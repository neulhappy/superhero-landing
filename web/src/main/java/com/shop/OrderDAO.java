package com.shop;
import com.util.DBConnPool;
import com.util.Logger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO extends DBConnPool {


    public int insertOrder(OrderDTO dto) {
        int orderId = 0;
        try {
            String query = "INSERT INTO order (" +
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
}

