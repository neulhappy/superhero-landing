package com.member;

import com.util.Alert;
import com.util.LookUp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/mypage.do")
public class MypageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        LookUp.getAuth(request, response);
        if ("Order".equals(action)) {
            request.getRequestDispatcher("/member/OrderMypage.jsp").forward(request, response);
        } else if ("QnA".equals(action)) {
            request.getRequestDispatcher("/member/MyQnA.jsp").forward(request, response);
        } else if ("Review".equals(action)) {
            request.getRequestDispatcher("/member/MyReview.jsp").forward(request, response);
        } else if ("Shopping".equals(action)) {
            request.getRequestDispatcher("/member/MyShoppingCart.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Alert.alertLocation("잘못된 접근입니다.", "/index.do", out);
        }
    }
}
