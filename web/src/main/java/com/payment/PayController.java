package com.payment;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment/paySuccess.do")
public class PayController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 클라이언트에서 온 데이터를 받습니다.
        String productName = req.getParameter("productName");
        String buyerId = req.getParameter("buyer_buyId");
        String productId = req.getParameter("productId");
        String amount = req.getParameter("amount");
        String status = req.getParameter("status");
        String paymentMethod = req.getParameter("paymentMethod");

        // 받은 데이터를 처리하거나 다른 작업을 수행합니다.
        // 예: 로그에 출력하거나 데이터베이스에 저장하는 등의 작업을 할 수 있습니다.

        // 클라이언트에 응답을 보냅니다.
        resp.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("Payment information received!");

        //TODO 이후 삭제해야할 실험용 코딩
        System.out.println(productName +":::: "+ buyerId +":::: "+ productId +":::: "+ amount + ":::: "+ status +"::::" + paymentMethod );

        //폼값을 DTO에 저장
        PaymentDTO pDto = new PaymentDTO();
        pDto.setPayment(req.getParameter("payment"));



        //결제를 무엇으로 하였는지 업데이트
        PaymentDAO pDao = new PaymentDAO();
        int result = pDao.updatePayment(pDto);
        pDao.close();
    }
}