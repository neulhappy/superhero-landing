package com.shop;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDAO extends DBConnPool {


    public int insertOrder(OrderDTO dto) {
        int orderId = 0;
        try {
            String query = "INSERT INTO 'order' (" +
                    "custom_id, purchaser_name, recipient_name, address, contact" +
                    ") VALUES (?, ?, ?, ?, ?)";

            psmt = con.prepareStatement(query, psmt.RETURN_GENERATED_KEYS);
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
            }

            // Insert order products
            if (orderId > 0) {
                insertOrderProducts(orderId, dto.getProductList());
            }
        } catch (SQLException e) {
            Logger.error("insertOrder 메소드 오류 발생");
        }

        return orderId;
    }

    private void insertOrderProducts(int orderId, ArrayList<OrderDTO.ProductSet> productList) {
        for (OrderDTO.ProductSet set : productList) {
            String productQuery = "INSERT INTO " +
                    "'order_product' " +
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

    public List<OrderDTO> selectOrderList(Map<String, Object> map, String userId) {
        List<OrderDTO> orderList = new ArrayList<>();

        String query = "SELECT * FROM (" +
                " SELECT Tb.*, ROWNUM rNUM FROM (" +
                " SELECT * FROM" +
                " 'order'" +
                " WHERE custom_id = ?" +
                " ORDER BY order_date DESC ) Tb )" +
                " WHERE rNUM " +
                "BETWEEN ? AND ? ";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, userId);
            psmt.setInt(2, Integer.parseInt(map.get("start").toString()));
            psmt.setInt(3, Integer.parseInt(map.get("end").toString()));

            rs = psmt.executeQuery();

            while (rs.next()) {
                OrderDTO dto = new OrderDTO();
                dto.setId(rs.getInt("1"));
                dto.setCustom_id(rs.getInt("2"));
                dto.setStatus(rs.getInt("3"));
                dto.setPurchaser_name(rs.getString("4"));
                dto.setRecipient_name(rs.getString("5"));
                dto.setAddress(rs.getString("6"));
                dto.setContact(rs.getString("7"));
                dto.setOrder_date(rs.getDate("8"));
                dto.setInvoice(rs.getString("9"));

                orderList.add(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectOrderList 중 예외 발생", e);
        }

        return orderList;
    }

    public OrderDTO selectOrder(String id) {
        OrderDTO dto = new OrderDTO();
        String query = "SELECT * FROM 'order' WHERE order_id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getInt("1"));
                dto.setCustom_id(rs.getInt("2"));
                dto.setStatus(rs.getInt("3"));
                dto.setPurchaser_name(rs.getString("4"));
                dto.setRecipient_name(rs.getString("5"));
                dto.setAddress(rs.getString("6"));
                dto.setContact(rs.getString("7"));
                dto.setOrder_date(rs.getDate("8"));
                dto.setInvoice(rs.getString("9"));
                dto.setProductList(selectOrderProductLists(Integer.parseInt(id)));
            }
        } catch (SQLException e) {
            Logger.error("selectView 중 예외 발생", e);
        }
        return dto;
    }

    public ArrayList<OrderDTO.ProductSet> selectOrderProductLists(int orderId) {
        ArrayList<OrderDTO.ProductSet> orderProducts = new ArrayList<>();

        String query = "SELECT * FROM 'order_product' WHERE order_id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, orderId);

            rs = psmt.executeQuery();

            while (rs.next()) {
                OrderDTO.ProductSet dto = new OrderDTO.ProductSet();
                dto.setProd_id(rs.getInt("prod_id"));
                dto.setQuantity(rs.getInt("quantity"));

                orderProducts.add(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectOrderProductsByOrderId 중 예외 발생", e);
        }

        return orderProducts;
    }

    public void updateStatus(String id, String status) {
        String query = "UPDATE 'order' SET status = ? WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, status);
            psmt.setString(2, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateStatus 중 에러 발생", e);
        }
    }

    public void updateInvoice(String id, String invoice) {
        String query = "UPDATE 'order' SET invoice = ? WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, invoice);
            psmt.setString(2, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateInvoice 중 에러 발생", e);
        }
    }
}

