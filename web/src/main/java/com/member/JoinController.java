package com.member;

import com.util.Alert;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/join.do")
public class JoinController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/member/Join.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String email = req.getParameter("email");

        MemberDAO dao = new MemberDAO();
        MemberDTO mDto = new MemberDTO();

        mDto.setUser_id(id);
        mDto.setPassword(pw);
        mDto.setEmail(email);
        int joinResult = dao.join(mDto);
        dao.close();

        if (joinResult == 1) {
            Alert.alertLocation("회원가입에 성공했습니다.", "/member/Login.jsp", out);
        } else {
            Alert.alertLocation("회원가입에 실패했습니다.", "../member/Join.jsp", out);
        }
        out.flush();
    }
}

