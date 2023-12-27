package com.shop;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBConnPool {


    public int insertOrder(OrderDTO dto) {
        int orderId = 0;
        try {
            String query = "INSERT INTO p_order (" +
                    "custom_id, purchaser_name, recipient_name, address, contact" +
                    ") VALUES (?, ?, ?, ?, ?) ";

            psmt = con.prepareStatement(query, new String[]{"id"});
            psmt.setInt(1, dto.getCustom_id());
            psmt.setString(2, dto.getPurchaser_name());
            psmt.setString(3, dto.getRecipient_name());
            psmt.setString(4, dto.getAddress());
            psmt.setString(5, dto.getContact());
            int result = psmt.executeUpdate();
            if (result > 0) {
                try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getInt(1);
                    }
                }
                Logger.info("생성된 주문 ID: " + orderId);
            }

            if (orderId > 0) {
                insertOrderProducts(orderId, dto.getProductList());
            } else {
                Logger.error("주문 ID 생성에 실패했습니다.");
            }
        } catch (SQLException e) {
            Logger.error("insertOrder 메소드 오류", e);
        }
        return orderId;
    }


    private void insertOrderProducts(int orderId, ArrayList<OrderDTO.ProductSet> productList) {
        for (OrderDTO.ProductSet set : productList) {
            String productQuery = "INSERT INTO " +
                    "order_product " +
                    "(order_id, prod_id, quantity)" +
                    " VALUES (?, ?, ?)";
            try {
                psmt = con.prepareStatement(productQuery);
                psmt.setInt(1, orderId);
                psmt.setInt(2, set.getProd_id());
                psmt.setInt(3, set.getQuantity());
                psmt.executeUpdate();
            } catch (SQLException e) {
                Logger.error("insertOrderProduct 중 메소드 오류 발생");
            }
        }
    }

    public List<OrderDTO> selectOrderList(String userId) {
        List<OrderDTO> orderList = new ArrayList<>();

        String query = "SELECT * FROM p_order WHERE custom_id = ? ORDER BY order_date desc";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, userId);

            rs = psmt.executeQuery();

            while (rs.next()) {
                OrderDTO dto = new OrderDTO();
                makeWholeDTO(dto);
                orderList.add(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectOrderList 중 예외 발생", e);
        }

        return orderList;
    }

    private void makeWholeDTO(OrderDTO dto) throws SQLException {
        int orderId = rs.getInt("ID");
        dto.setId(orderId);
        dto.setCustom_id(rs.getInt("CUSTOM_ID"));
        dto.setStatus(rs.getInt("STATUS"));
        dto.setPurchaser_name(rs.getString("PURCHASER_NAME"));
        dto.setRecipient_name(rs.getString("RECIPIENT_NAME"));
        dto.setAddress(rs.getString("ADDRESS"));
        dto.setContact(rs.getString("CONTACT"));
        dto.setOrder_date(rs.getDate("ORDER_DATE"));
        dto.setInvoice(rs.getString("INVOICE"));
        dto.setProductList(selectOrderProductLists(orderId));
    }


    public OrderDTO selectOrder(String id) {
        OrderDTO dto = new OrderDTO();
        String query = "SELECT * FROM p_order WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                makeWholeDTO(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectView 중 예외 발생", e);
        }
        return dto;
    }

    public ArrayList<OrderDTO.ProductSet> selectOrderProductLists(int orderId) {
        ArrayList<OrderDTO.ProductSet> orderProducts = new ArrayList<>();
        String query = "SELECT op.*, p.name as prod_name " +
                "FROM order_product op " +
                "INNER JOIN product p ON op.prod_id = p.id " +
                "WHERE op.order_id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, orderId);

            ResultSet localRs = psmt.executeQuery();
            while (localRs.next()) {
                OrderDTO.ProductSet dto = new OrderDTO.ProductSet();
                dto.setProd_id(localRs.getInt("prod_id"));
                dto.setQuantity(localRs.getInt("quantity"));
                dto.setProd_name(localRs.getString("prod_name"));
                orderProducts.add(dto);
            }
            localRs.close();
        } catch (SQLException e) {
            Logger.error("selectOrderProductLists 중 예외 발생", e);
        }
        return orderProducts;
    }

    public void updateStatus(String id, String status) {
        String query = "UPDATE p_order SET status = ? WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, status);
            psmt.setString(2, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateStatus 중 에러 발생", e);
        }
    }

    public void updatePaydate(String id, Date date) {
        String query = "UPDATE p_order SET pay_date = ? WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setDate(1, date);
            psmt.setString(2, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updatePaydate 중 에러 발생", e);
        }
    }


    public void updateInvoice(String id, String invoice) {
        String query = "UPDATE p_order SET invoice = ? WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, invoice);
            psmt.setString(2, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateInvoice 중 에러 발생", e);
        }
    }

    public int totalPrice(int orderId) {
        int totalPrice = 0;
        String query = "SELECT op.QUANTITY, p.PRICE"
                + " FROM ORDER_PRODUCT op"
                + " INNER JOIN PRODUCT p ON op.PROD_ID = p.ID"
                + " WHERE ORDER_ID = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, orderId);
            rs = psmt.executeQuery();

            while (rs.next()) {
                int quantity = rs.getInt("quantity");
                int price = rs.getInt("price");
                totalPrice += (quantity * price);
            }

        } catch (SQLException e) {
            Logger.error("totalPrice 실행중 메소드 오류 발생");
        }
        return totalPrice;
    }
}

