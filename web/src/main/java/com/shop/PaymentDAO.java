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

    public int updatePayDate(PaymentDTO pDto){
        DBConnPool connectionPool = new DBConnPool();
        String query= QueryBuilder.updateQuery("P_ORDER", "PAY_DATE", "?");
        try {
            Connection conn = connectionPool.getConnection();
            psmt = conn.prepareStatement(query);
            psmt.setString(1, String.valueOf(pDto.getPayDate()));
            result = psmt.executeUpdate();
        }catch (SQLException e){
            logger.error("SQLException");
        }catch (Exception e){
            logger.error("payDate값을 수정하던 중 예외 발생");
        }
        return result;
    }

}
