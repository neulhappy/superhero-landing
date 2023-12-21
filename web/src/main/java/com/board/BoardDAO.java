package com.board;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConnPool {

    public List<BoardDTO> selectList(String boardId) {
        List<BoardDTO> bbs = new ArrayList<>();
        String table = "board" + boardId;
        String query = "SELECT b.*, m.user_id FROM " +
                table + " b " +
                "INNER JOIN custom m ON b.author_id = m.id " +
                "WHERE b.is_published = 'Y' " +
                "ORDER BY b.id DESC";
        System.out.println(query);
        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setBoardId(Integer.parseInt(boardId));
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setAuthor_id(rs.getInt("author_id"));
                dto.setAuthor_uid(rs.getString("user_id"));
                dto.setPostdate(getUtilDate(rs.getDate("postdate")));
                dto.setLastchanged(getUtilDate(rs.getDate("lastchanged")));
                dto.setVisitcount(rs.getInt("visitcount"));
                dto.setIs_published(getBoolean(rs.getString("is_published")));
                dto.setIs_notice(getBoolean(rs.getString("is_notice")));

                bbs.add(dto);
            }
        } catch (SQLException e) {
            Logger.error("selectList 중 예외 발생", e);
        }

        return bbs;
    }


    public BoardDTO selectView(String id, String boardId) {
        String table = "board" + boardId;
        BoardDTO dto = new BoardDTO();

        String query = "SELECT b.*, m.user_id " +
                "FROM " + table + " b " +
                "JOIN custom m ON b.author_id = m.id " +
                "WHERE b.id=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setBoardId(Integer.parseInt(boardId));
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setAuthor_id(rs.getInt("author_id"));
                dto.setAuthor_uid(rs.getString("user_id"));
                dto.setPostdate(getUtilDate(rs.getDate("postdate")));
                dto.setLastchanged(getUtilDate(rs.getDate("lastchanged")));
                dto.setVisitcount(rs.getInt("visitcount"));
                dto.setIs_published(getBoolean(rs.getString("is_published")));
                dto.setIs_notice(getBoolean(rs.getString("is_notice")));
            }
        } catch (SQLException e) {
            Logger.error("selectView 중 예외 발생", e);
        }
        return dto;
    }


    public int insertWrite(BoardDTO dto) {
        int result = 0;
        String table = "board" + dto.getBoardId();
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
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            }
        } catch (SQLException e) {
            Logger.error("insertWrite 중 에러 발생", e);
        }
        return result;
    }


    public int updateWrite(BoardDTO dto) {
        int result = 0;
        String table = "board" + dto.getBoardId();
        try {
            // Prepare the query with placeholders
            String query = "UPDATE " + table + " SET title = ?, content = ?, lastchanged = ? WHERE id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setDate(3, new java.sql.Date(System.currentTimeMillis()));
            psmt.setInt(4, dto.getId());
            result = psmt.executeUpdate();

        } catch (SQLException e) {
            Logger.error("updateWrite 중 에러 발생", e);
        }
        return result;
    }


    public void updateVisitCount(String id, String boardId) {
        String table = "board" + boardId;
        String query = "UPDATE " + table + " SET visitcount = visitcount + 1 WHERE id = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("updateVisitCount 중 에러 발생", e);
        }
    }

    public int deletePost(int id, String boardId) {
        String table = "board" + boardId;
        int result = 0;
        try {
            String query = "UPDATE " + table + " SET is_published = 'N' WHERE id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, String.valueOf(id));
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("deletePost 중 에러 발생", e);
        }

        return result;
    }

    public int selectAuthor(int id, String boardId) {
        String table = "board" + boardId;
        int authorId = 0;
        try {
            String query = "SELECT author_id FROM " + table + " WHERE id = ?";
            psmt = con.prepareStatement(query);
            psmt.setInt(1, id);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                authorId = rs.getInt("author_id");
            }
        } catch (SQLException e) {
            Logger.error("selectAuthor 중 에러 발생", e);
        }
        return authorId;
    }
}


