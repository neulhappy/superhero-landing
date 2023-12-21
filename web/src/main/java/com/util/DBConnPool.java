package com.util;
//

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;

public class DBConnPool {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;
    private DataSource dataSource;


    public DBConnPool() {
        try {
            initializeDataSource();
            con = getConnection();
            Logger.logger.info("DB 커넥션 풀 연결 성공");
        } catch (Exception e) {
            Logger.logger.error("DBConnPool 초기화 중 예외 발생");
        }
    }

    private void initializeDataSource() {
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            dataSource = (DataSource) ctx.lookup("jdbc/orcl");
        } catch (Exception e) {
            Logger.logger.error("DataSource 초기화 중 예외 발생");
        }
    }

    public Connection getConnection() throws SQLException {
        try {
            return dataSource.getConnection();
        } catch (Exception e) {
            Logger.logger.error("getConnection 중 예외 발생");
        }
        return null;
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

            Logger.logger.info("DB 커넥션 풀 자원 반납");
        } catch (Exception e) {
            Logger.logger.error("DB 커넥션 풀 자원 반납");
        }
    }

    public static PreparedStatement setString(PreparedStatement psmt, String... string) throws SQLException {
        int parameterIndex = 1;
        for (String str : string) {
            psmt.setString(parameterIndex, str);
        }
        return psmt;
    }

    public static boolean getBoolean(String input) {
        return "Y".equalsIgnoreCase(input);
    }
}
