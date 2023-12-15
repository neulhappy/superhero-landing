package com.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class JoinController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/member/Join.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost 진입 성공!");
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String pw = req.getParameter("pw");
        String email = req.getParameter("email");

        MemberDao mDao = MemberDao.getInstance();
        MemberDTO mDto = new MemberDTO();

        mDto.setId(id);
        mDto.setEmail(email);
        mDto.setPassword(pw);
        System.out.println(pw);
        int joinResult = mDao.join(mDto);


        if (joinResult == 1) {
            req.setAttribute("joinResult", joinResult);
            HttpSession session = req.getSession();
            session.setAttribute("sessionID", id);
            RequestDispatcher rd = req.getRequestDispatcher("/member/success.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("joinResult", 0);
            RequestDispatcher rd = req.getRequestDispatcher("../member/Join.jsp");
            rd.forward(req, resp);
        }
    }
}
