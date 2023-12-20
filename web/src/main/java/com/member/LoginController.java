package com.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member1/login.do")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String hashedPw = req.getParameter("pw");
        System.out.println(id);
        System.out.println(hashedPw);
        String mode = req.getParameter("mode");

        MemberDao dao = new MemberDao();

        if (dao.login(id, hashedPw)) {
            // 로그인 성공
            HttpSession session = req.getSession();
            switch (mode) {
                case "login" -> {
                    session.setAttribute("userId", id);
                    // 로그인 후 이동할 페이지로 리다이렉트 또는 포워딩
                    resp.sendRedirect("/index.jsp");
                }
                case "inform" -> {
                    req.getRequestDispatcher("/mypage/MyInformation.jsp").forward(req, resp);
                }
            }
        } else {
            // 로그인 실패
            req.setAttribute("loginResult", "fail");
            RequestDispatcher rd = req.getRequestDispatcher("/member1/Login.jsp");
            System.out.println("로그인실패");
            rd.forward(req, resp);
        }
    }
}
