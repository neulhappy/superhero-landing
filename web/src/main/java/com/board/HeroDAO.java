package com.board;

import com.shop.ProductDTO;
import com.util.DBConnPool;
import com.util.Logger;

import java.sql.SQLException;

public class HeroDAO extends DBConnPool {
    public HeroDTO selectHero(String id) {
        HeroDTO dto = new HeroDTO();
        String query = "SELECT * FROM hero WHERE id=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setId(rs.getInt(1));
                dto.setHeroname(rs.getString(2));
                dto.setRealname(rs.getString(3));
                dto.setActor(rs.getString(4));
                dto.setAge(rs.getInt(5));

            }

        } catch (SQLException e) {
            Logger.error("selectHero 중 예외 발생");
        }
        return dto;
    }
}
