package com.shop;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.ResultSet;

public class OrderDAO extends DBConnPool {


    public int insertOrder(OrderDTO dto) {
     //반환값은 id임
        int orderId = -1;
        try {
            //쿼리 작성
            String query = "INSERT INTO order ( "
                    + "custom_id, purchaser_name, recipient_name, address, contact)"
                    + "VALUES( "
                    + dto.getCustom_id() + "," + dto.getPurchaser_name() + "," + dto.getRecipient_name() + "," + dto.getAddress() + "," + dto.getContact() + ")";


            psmt = con.prepareStatement(query, psmt.RETURN_GENERATED_KEYS);

            int result = psmt.executeUpdate();
            if (result > 0) {
                try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            Logger.error("insertWrite 메소드 오류 발생");
        }

        for (OrderDTO.ProductSet set : dto.getProductList()) {
            String query = "INSERT INTO order-product ( "
                    + "order_id, prod_id, quantity)"
                    + "VALUES( "
                    + orderId + "," + set.getProd_id() + "," + set.getQuantity();
        }

        return orderId;
    }
}
