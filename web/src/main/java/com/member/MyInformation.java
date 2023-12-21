package com.member;


import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mypage/myinform.do")
public class MyInformation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String newPassword = req.getParameter("newPassword");
        String newEmail = req.getParameter("newEmail");
        String userId = (String) req.getSession().getAttribute("userId");

        MemberDAO dao = new MemberDAO();
        boolean updateResult = dao.updateUserInformation(userId, newPassword, newEmail);

        if (updateResult) {
            Alert.alertLocation("정보가 성공적으로 변경되었습니다.","/index.jsp", out);
        } else {
            Alert.alertBack("정보 변경에 실패했습니다.", out);
        }
    }
}

