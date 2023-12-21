package com.member;


import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/inform.do")
public class MyInformation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String newPassword = req.getParameter("newPassword");
        String newEmail = req.getParameter("newEmail");
        String userId = (String) req.getSession().getAttribute("userId");

        MemberDAO dao = new MemberDAO();
        boolean updateResult = dao.updateUserInformation(userId, newPassword, newEmail);
        dao.close();
        if (updateResult) {
            resp.sendRedirect("index.jsp");
        } else {
            resp.sendRedirect("/member/MyInformation.jsp");
        }
    }
}

