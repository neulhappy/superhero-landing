package com.shop;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.SQLException;

public class ProductDAO extends DBConnPool {
    public ProductDTO selectProduct(String idx) {
        ProductDTO dto = new ProductDTO();
        String query = "SELECT * FROM product WHERE id=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setId(rs.getInt(1));
                dto.setName(rs.getString(2));
                dto.setPrice(rs.getInt(3));
                dto.setHero(rs.getInt(4));
                dto.setAble(rs.getString(5).equalsIgnoreCase("Y"));


            }


        } catch (SQLException e) {
            Logger.error("selectProduct 중 예외 발생");
        }
        return dto;
    }
}
