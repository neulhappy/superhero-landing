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

        // 요청된 링크에 따라 액션을 수행합니다.
        if ("Order".equals(action)) {
            // 주문내역 링크 처리
            // OrderMypage.jsp로 포워딩하거나 리다이렉팅할 수 있습니다.
            request.getRequestDispatcher("/OrderMypage.jsp").forward(request, response);
        } else if ("QnA".equals(action)) {
            // 나의 문의내역 링크 처리
            // MyQnA.jsp로 포워딩하거나 리다이렉팅할 수 있습니다.
            request.getRequestDispatcher("/MyQnA.jsp").forward(request, response);
        } else if ("Review".equals(action)) {
            // 나의 후기 링크 처리
            // MyReview.jsp로 포워딩하거나 리다이렉팅할 수 있습니다.
            request.getRequestDispatcher("/MyReview.jsp").forward(request, response);
        } else if ("Shopping".equals(action)) {
            // 장바구니 링크 처리
            // MyShoppingCart.jsp로 포워딩하거나 리다이렉팅할 수 있습니다.
            request.getRequestDispatcher("/MyShoppingCart.jsp").forward(request, response);
        } else if ("Information".equals(action)) {
            // 회원정보 링크 처리
            // MyInformation.jsp로 포워딩하거나 리다이렉팅할 수 있습니다.
            request.getRequestDispatcher("/MyInformation.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        }
    }
}
