package com.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("member/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false는 새 세션을 생성하지 않음
        if (session != null) {
            session.invalidate(); // 세션이 존재하면 세션을 무효화
        }
        response.sendRedirect("index.jsp"); // 메인 페이지로 리디렉션
    }
}

