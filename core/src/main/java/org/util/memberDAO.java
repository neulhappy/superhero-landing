package org.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class memberDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Connection getConn() {
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
        String user = "test";
        String password = "bitc5600";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url,user, password);

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("getConn Exception");
        }
        return conn;
    }
    public boolean joinMember(memberDTO dto) {
        conn = getConn();
        int suc = 0;
        String sql = " INSERT INTO GAME_MEMBER values(?,?,?) ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getMemberId());
            ps.setString(2, dto.getMemberPw());
            ps.setString(3, dto.getMemberMail());
            suc = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("joinMember Exception");
        }
        return false;
    }
}
