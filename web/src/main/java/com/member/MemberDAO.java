package com.member;

import com.util.DBConnPool;
import com.util.Logger;

import java.sql.*;

public class MemberDAO extends DBConnPool {

    public int join(MemberDTO dto) {
        int result = 0;
        try {
            String query = " INSERT INTO custom (user_id, password, email) VALUES (?, ?, ?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUser_id());
            psmt.setString(2, dto.getPassword());
            psmt.setString(3, dto.getEmail());

            result = psmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error("join 중 에러 발생", e);
        }
        return result;
    }

    public boolean login(String id, String hashedPw) {
        try {
            String query = "SELECT password FROM custom WHERE user_id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                return storedHashedPassword.equals(hashedPw); // 데이터베이스의 해시와 비교
            }
        } catch (SQLException e) {
            Logger.error("Login 중 에러 발생", e);
        }
        return false;
    }

    public boolean isIdAvailable(String id) {

        try {
            String query = " SELECT COUNT(*) FROM custom WHERE user_id = ?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // count가 0이면 아이디 사용 가능
            }
        } catch (SQLException e) {
            Logger.error("isIdAvailable 중 에러 발생", e);
        }
        return false; // 예외가 발생하는 경우 false 반환
    }
}