package org.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import static org.util.Logger.logger;

public class DBConnPool {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    public DBConnPool(){
        try{
            Context initCtx = new InitialContext();
            Context ctx = (Context)initCtx.lookup("java:comp/env");
            DataSource source = (DataSource) ctx.lookup("dbcp-myoracle");

            con = source.getConnection();
            logger.info("DB 커넥션 풀 연결 성공");
        }catch (Exception e){
            logger.error("DBConnPool 시도 중 예외 발생");
        }
    }

    public void close(){
        try{
            if(rs !=null) rs.close();
            if(stmt !=null) stmt.close();
            if(psmt !=null) psmt.close();
            if(con !=null) con.close();

            logger.info("DB 커넥션 풀 자원 반납");
        }catch (Exception e){
            logger.error("DB 커넥션 풀 자원 반납");
        }
    }

}
