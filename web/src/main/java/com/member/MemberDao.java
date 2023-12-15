package com.member;

import java.sql.*;

public class MemberDao {
    private static MemberDao mDao;
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private int result;
    private MemberDao() {

    }
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
            ps.setInt(1, mDto.getId());
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
}
