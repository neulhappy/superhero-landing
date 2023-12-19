package com.board;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO extends DBConnPool {

    public List<BoardDTO> selectList(Map<String, Object> map, String boardId) {
        List<BoardDTO> bbs = new ArrayList<>();
        String table = "board-" + boardId;

        StringBuilder queryBuilder = new StringBuilder();
        queryBuilder.append("SELECT * FROM ")
                .append(table);

        if (map.get("searchWord") != null) {
            queryBuilder.append(" WHERE ")
                    .append(map.get("searchField"))
                    .append(" LIKE ?");
        }

        queryBuilder.append(" ORDER BY num DESC");

        String query = queryBuilder.toString();

        try {
            psmt = con.prepareStatement(query);
            int i = 1;
            if (map.get("searchWord") != null) {
                psmt.setString(i++, "%" + map.get("searchWord") + "%");
            }

            rs = psmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setBoardId(Integer.parseInt(boardId));
                dto.setNum(rs.getInt(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setAuthor_id(rs.getInt(4));
                dto.setPostdate(rs.getDate(5));
                dto.setLastchanged(rs.getDate(6));
                dto.setVisitcount(rs.getInt(7));
                dto.setIs_published(getBoolean(rs.getString(8)));
                dto.setIs_notice(getBoolean(rs.getString(9)));

                bbs.add(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectList 중 예외 발생", e);
        }

        return bbs;
    }


    public BoardDTO selectView(String id, String boardId) {
        String table = "board-" + boardId;
        BoardDTO dto = new BoardDTO();

        String query = "SELECT * FROM " + table + "WHERE id=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setBoardId(Integer.parseInt(boardId));
                dto.setNum(rs.getInt(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString(3));
                dto.setAuthor_id(rs.getInt(4));
                dto.setPostdate(rs.getDate(5));
                dto.setLastchanged(rs.getDate(6));
                dto.setVisitcount(rs.getInt(7));
                dto.setIs_published(getBoolean(rs.getString(8)));
                dto.setIs_notice(getBoolean(rs.getString(9)));
            }
        } catch (SQLException e) {
            Logger.error("selectView 중 예외 발생", e);
        }
        return dto;
    }

    public int insertWrite(BoardDTO dto) {
        int result = 0;
        String table = "board-" + dto.getBoardId();

        try {
            // Prepare the query with placeholders
            String query = "INSERT INTO " + table + " (title, content, author_id) VALUES (?, ?, ?)";
            psmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            // Set parameter values using PreparedStatement
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setInt(3, dto.getAuthor_id());
            psmt.executeUpdate();

            ResultSet generatedKeys = psmt.getGeneratedKeys();
            result = generatedKeys.getInt(1);

        } catch (SQLException e) {
            Logger.error("insertWrite 중 에러 발생", e);
        }
        return result;
    }


    public int updateWrite(BoardDTO dto) {
        int result = 0;
        String table = "board-" + dto.getBoardId();

        try {
            // Prepare the query with placeholders
            String query = "UPDATE " + table + " SET title = ?, content = ? WHERE id = ?";
            psmt = con.prepareStatement(query);

            // Set parameter values using PreparedStatement
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setInt(3, dto.getBoardId());

            result = psmt.executeUpdate();

        } catch (SQLException e) {
            Logger.error("updateWrite 중 에러 발생", e);
        }
        return result;
    }


    public void updateVisitCount(String id, String boardId) {
        String table = "board-" + boardId;
        String query = "UPDATE " + table + " SET visitcount = visitcount + 1 WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateVisitCount 중 에러 발생", e);
        }
    }

    public int deletePost(String id, String boardId) {
        String table = "board-" + boardId;
        int result = 0;

        try {
            String query = "DELETE FROM " + table + " WHERE id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("deletePost 중 에러 발생", e);
        }

        return result;
    }

    public int selectCount(Map<String, Object> map, String boardId) {
        String table = "board-" + boardId;
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM " + table;
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchFiled") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }
}

