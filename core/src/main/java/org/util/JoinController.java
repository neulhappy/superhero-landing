package org.util;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;


public class JoinController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/11/Join.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost 진입 성공!");
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String email = req.getParameter("email");

        MemberDao mDao = MemberDao.getInstance();
        MemberDto mDto = new MemberDto();
        mDto.setMemberId(id);
        mDto.setMemberMail(email);
        mDto.setMemberPw(pw);
        int joinResult = mDao.join(mDto);

        if (joinResult == 1) {
            req.setAttribute("joinResult", joinResult);
            HttpSession session = req.getSession();
            session.setAttribute("sessionID", id);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/index.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("joinResult", 0);
            RequestDispatcher rd = req.getRequestDispatcher("/11/Join.jsp");
            rd.forward(req, resp);
        }
    }
}
