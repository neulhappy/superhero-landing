package com.board;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/list.do")
public class ListController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> bbs = dao.selectList("1");
        dao.close();

        req.setAttribute("bbs", bbs);
        req.getRequestDispatcher("/jsp/CommunityPage.jsp").forward(req, resp);


    }
}
