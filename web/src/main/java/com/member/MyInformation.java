package com.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/inform.do")
public class MyInformation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String userId = (String) request.getSession().getAttribute("userId");

        MemberDAO dao = new MemberDAO();
        boolean updateResult = dao.updateUserInformation(userId, newPassword, newEmail);

        if (updateResult) {
            response.getWriter().write("정보가 성공적으로 변경되었습니다.");
        } else {
            response.getWriter().write("정보 변경에 실패했습니다.");
        }
    }
}
