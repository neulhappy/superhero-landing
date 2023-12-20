package com.shop;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBConnPool {
    public ProductDTO selectProduct(String id) {
        ProductDTO dto = new ProductDTO();
        String query = "SELECT * FROM product WHERE id=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto.setId(rs.getInt(1));
                dto.setName(rs.getString(2));
                dto.setCategory(rs.getString(3));
                dto.setPrice(rs.getInt(4));
                dto.setAble(rs.getString(5).equalsIgnoreCase("Y"));
            }
        } catch (SQLException e) {
            Logger.error("selectProduct 중 예외 발생");
        }
        return dto;
    }


    public List<ProductDTO> selectList() {
        List<ProductDTO> prodList = new ArrayList<ProductDTO>();
        String query = "SELECT * FROM product ORDER BY id DESC";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setId(rs.getInt(1));
                dto.setName(rs.getString(2));
                dto.setCategory(rs.getString(3));
                dto.setPrice(rs.getInt(4));
                dto.setAble(rs.getString(5).equalsIgnoreCase("Y"));
                prodList.add(dto);
            }
        } catch (Exception e) {
            Logger.error("selectList 오류 발생");
        }
        return prodList;
    }

    public List<ProductDTO> selectListByCat(String cat) {
        List<ProductDTO> prodList = new ArrayList<ProductDTO>();
        String query = "SELECT * FROM product WHERE category=? ORDER BY id DESC";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, cat);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setId(rs.getInt(1));
                dto.setName(rs.getString(2));
                dto.setCategory(rs.getString(3));
                dto.setPrice(rs.getInt(4));
                dto.setAble(rs.getString(5).equalsIgnoreCase("Y"));
                prodList.add(dto);
            }
        } catch (Exception e) {
            Logger.error("selectListByCat 오류 발생");
        }
        return prodList;
    }
}
