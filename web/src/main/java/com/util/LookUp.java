package com.util;

import com.member.MemberDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class LookUp {
    public static int getAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userId");
        String userPw = (String) session.getAttribute("userPw");
        int pid = 0;
        if (!(userId == null || userPw == null)) {
            MemberDAO mDao = new MemberDAO();
            pid = mDao.login(userId, userPw);
            mDao.close();
        }
        if (pid < 1) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertLocation("로그인 후 이용해 주시기 바랍니다.", "/member/login.do", out);
        }
        return pid;
    }
}
