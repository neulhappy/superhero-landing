package org.util;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/goods_pay_success.do")
public class PayController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 온 데이터를 받습니다.
        String buyerEmail = request.getParameter("buyer_email");
        String productName = request.getParameter("product_name");
        String buyerId = request.getParameter("buyer_id");
        String amount = request.getParameter("amount");
        String success = request.getParameter("buyer_pay_ok");

        // 받은 데이터를 처리하거나 다른 작업을 수행합니다.
        // 예: 로그에 출력하거나 데이터베이스에 저장하는 등의 작업을 할 수 있습니다.

        // 클라이언트에 응답을 보냅니다.
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Payment information received!");
    }
}