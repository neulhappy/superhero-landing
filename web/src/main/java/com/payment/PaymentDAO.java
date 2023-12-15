package com.payment;

import com.util.DBConnPool;
import com.util.QueryBuilder;

import static com.util.Logger.logger;

public class PaymentDAO extends DBConnPool {

    public PaymentDAO() { super(); }

    //TODO DB커넥풀 오류 수정해야함
    public int updatePayment(PaymentDTO pDto){
        int applyResult = 0;
        try{
            String query = "UPDATE order SET payment = 'none';" ;

            psmt = con.prepareStatement(query);


            applyResult = psmt.executeUpdate();
            System.out.println(query);
        }catch (Exception e){
            logger.error("payment값을 수정하던 중 예외 발생");
        }
        return applyResult;
    }

}
