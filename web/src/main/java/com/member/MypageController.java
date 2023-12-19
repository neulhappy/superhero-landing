package com.member;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member1/mypage.do")
public class MypageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // 액션을 결정하기 위해 쿼리 파라미터를 사용할 수 있습니다.

        if ("Order".equals(action)) {
            request.getRequestDispatcher("/mypage/OrderMypage.jsp").forward(request, response);
        } else if ("QnA".equals(action)) {
            request.getRequestDispatcher("/mypage/MyQnA.jsp").forward(request, response);
        } else if ("Review".equals(action)) {
            request.getRequestDispatcher("/mypage/MyReview.jsp").forward(request, response);
        } else if ("Shopping".equals(action)) {
            request.getRequestDispatcher("/mypage/MyShoppingCart.jsp").forward(request, response);
        } else if ("Information".equals(action)) {
            request.getRequestDispatcher("/mypage/MyInformation.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        }
    }
}
