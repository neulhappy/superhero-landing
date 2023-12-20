package com.board;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/profile.do")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "intro" -> req.getRequestDispatcher("/jsp/profilePage.jsp").forward(req, resp);
            case "hero" -> {
                req.getRequestDispatcher("/jsp/profilePage02.jsp").forward(req, resp);
            }
            default -> {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("잘못된 접근입니다.", out);
            }
        }

    }
}
