package com.member;

import com.util.DBConnPool;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class MemberDao extends DBConnPool{

    public int join(MemberDTO mDto) {
        int result = 0;

        try {
            con = this.getConnection();
            String query = " INSERT INTO GAME_MEMBER VALUES (?, ?, ?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, mDto.getUser_id());
            psmt.setString(2, mDto.getEmail());
            psmt.setString(3, mDto.getPassword());

            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("joinMember Exception");
        } finally {
            close(con, psmt, null);
        }
        return result;
    }

    public boolean login(String id, String hashedPw) {
        try {
            con = this.getConnection();
            String query = "SELECT MEMBERPW FROM GAME_MEMBER WHERE MEMBERID = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("MEMBERPW");
                System.out.println(hashedPw);
                return storedHashedPassword.equals(hashedPw); // 데이터베이스의 해시와 비교
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(con, psmt, rs);
        }
        return false;
    }


    public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close(); // 커넥션 반환
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // 아이디 중복 확인 메서드 등 다른 메서드 구현
    public boolean isIdAvailable(String id) {

        try {
            con = this.getConnection();
            String query = " SELECT COUNT(*) FROM GAME_MEMBER WHERE MEMBERID = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // count가 0이면 아이디 사용 가능
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(con, psmt, rs); // 자원 반납
        }
        return false; // 예외 발생하거나 이미 존재하는 경우 false 반환
    }
}