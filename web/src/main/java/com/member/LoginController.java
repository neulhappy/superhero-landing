package com.member;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/member1/login.do")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String id = req.getParameter("id");
        String hashedPw = req.getParameter("pw");
        out.println(id);
        out.println(hashedPw);
        String mode = req.getParameter("mode");

        MemberDAO dao = new MemberDAO();
        boolean isSuccess = dao.login(id, hashedPw);
        dao.close();
        if (isSuccess) {
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
            Alert.alertBack("로그인에 실패하였습니다.", out);
        }
    }
}
