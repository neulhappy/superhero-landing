package com.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/member1/checkId.do")
public class CheckIdController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        String id = request.getParameter("id");

        // MemberDao에서 아이디 중복 여부 확인
        MemberDAO dao = new MemberDAO();

        boolean isIdAvailable = dao.isIdAvailable(id);

        // 결과를 클라이언트로 전송
        response.getWriter().write(String.valueOf(isIdAvailable));
    }
}
