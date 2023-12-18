package com.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/member1/logout.do")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 현재 세션을 가져옴
        HttpSession session = req.getSession(false);

        // 세션이 존재하면 세션을 종료
        if (session != null) {
            session.invalidate();
        }

        // 로그아웃 후 캐시 헤더 설정
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setDateHeader("Expires", 0); // Proxies.

        // 로그인 화면으로 리다이렉트
        resp.sendRedirect("/member1/logoutsuccess.jsp");
    }
}