package com.board;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                dto.setDetail(rs.getString(5));

            }

        } catch (SQLException e) {
            Logger.error("selectHero 중 예외 발생");
        }
        return dto;
    }

    public List<HeroDTO> selectList() {
        List<HeroDTO> heroList = new ArrayList<HeroDTO>();

        String query = "SELECT * FROM hero ORDER BY id DESC";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                //게시물 하나의 내용을 저장
                HeroDTO dto = new HeroDTO();
                dto.setId(rs.getInt("id"));
                dto.setHeroname(rs.getString("heroname"));
                dto.setRealname(rs.getString("realname"));
                dto.setActor(rs.getString("actor"));
                dto.setDetail(rs.getString("detail"));
                heroList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return heroList;
    }
}
