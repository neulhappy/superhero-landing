package com.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class MemberDao {
    private static MemberDao mDao;
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private int result;

    public static synchronized MemberDao getInstance() {
        if (mDao == null) {
            mDao = new MemberDao();
        }
        return mDao;
    }
    public Connection getConn() {
        String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
        String id = "test";
        String pw = "bitc5600";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, id, pw);
            System.out.println("db 연결 성공");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("getConn Exception");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public int join(MemberDTO mDto) {
        System.out.println("join 메소드 실행 됨");
        conn = this.getConn();
        StringBuffer query = new StringBuffer();
        query.append(" INSERT INTO GAME_MEMBER ").append(" values(?,?,?) ");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, mDto.getUser_id());
            ps.setString(2, mDto.getEmail());
            ps.setString(3, mDto.getPassword());

            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("joinMember Exception");
        } finally {
            this.close(conn, ps, null);
        }
        return result;
    }
    // 로그인 확인 메서드
    public boolean login(String id, String password) {
        conn = this.getConn();
        String query = "SELECT MEMBERPW FROM GAME_MEMBER WHERE MEMBERID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("MEMBERPW");
                System.out.println(storedHashedPassword);
                String inputHashedPassword = hashPassword(password);
                System.out.println(inputHashedPassword);

                // 저장된 해시된 비밀번호와 입력된 해시된 비밀번호 비교
                return storedHashedPassword.equals(inputHashedPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.close(conn, ps, rs);
        }
        return false;
    }

    // 비밀번호를 해시화하는 메서드
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException("Password hashing failed.", e);
        }
    }

    public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        if (rs != null) {
            try{
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(ps != null) {
            try{
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean isIdAvailable(String id) {
        conn = this.getConn();
        String query = " SELECT COUNT(*) FROM GAME_MEMBER WHERE MEMBERID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                // count가 0이면 해당 아이디는 사용 가능
                return count == 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.close(conn, ps, rs);
        }
        // 아이디가 이미 존재하거나 예외가 발생한 경우
        return false;
    }
}
