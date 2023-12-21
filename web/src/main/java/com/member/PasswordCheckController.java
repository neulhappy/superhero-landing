package com.member;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mypage/passwordCheck.do")
public class PasswordCheckController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8"); // 콘텐츠 타입과 문자 인코딩 설정
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String hashedPw = request.getParameter("hashedPw");

        MemberDAO dao = new MemberDAO();
        boolean isAuthenticated = dao.login(id, hashedPw);
        dao.close();
        if (isAuthenticated) {
            response.sendRedirect("/mypage/MyInformation.jsp");
        } else {
            Alert.alertBack("인증에 실패했습니다.", out);
        }
    }
}
