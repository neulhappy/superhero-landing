package com.member;

import com.util.Alert;
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

        if ("mypage".equals(action)) {
            request.getRequestDispatcher("/member/MyPage.jsp").forward(request, response);
        } else if ("order".equals(action)) {
            request.getRequestDispatcher("/member/OrderMypage.jsp").forward(request, response);
        } else if ("qna".equals(action)) {
            request.getRequestDispatcher("/member/MyQnA.jsp").forward(request, response);
        } else if ("review".equals(action)) {
            request.getRequestDispatcher("/member/MyReview.jsp").forward(request, response);
        } else if ("shopping".equals(action)) {
            request.getRequestDispatcher("/member/MyShoppingCart.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Alert.alertLocation("잘못된 접근입니다.", "/index.jsp", out);
        }
    }
}
