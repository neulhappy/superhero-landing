package com.shop;

import com.util.DBConnPool;
import com.util.QueryBuilder;

import java.sql.Connection;
import java.sql.SQLException;

import static com.util.Logger.logger;

public class PaymentDAO extends DBConnPool {
    private static PaymentDAO pDao;
    private int result;
    public PaymentDAO() { super(); }
    public static synchronized PaymentDAO getInstance() {
        if (pDao == null) {
            pDao = new PaymentDAO();
        }
        return pDao;
    }

    public int updatePayment(PaymentDTO pDto){
        System.out.println("updatePayment 실행됨");
        DBConnPool connectionPool = new DBConnPool();
        String query= QueryBuilder.updateQuery("W_ORDER", "PAYMENTS", "?");
        System.out.println(query);
        try {
            Connection conn = connectionPool.getConnection();
            psmt = conn.prepareStatement(query);
            psmt.setString(1,pDto.getPayment());
            System.out.println(query);
            result = psmt.executeUpdate();
        }catch (SQLException e){
            logger.error("SQLException");
        }catch (Exception e){
            logger.error("payment값을 수정하던 중 예외 발생");
        }
        return result;
    }

}
