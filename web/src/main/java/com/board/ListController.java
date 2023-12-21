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


@WebServlet("/board/list.do")
public class ListController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDAO dao = new BoardDAO();
        String board = req.getParameter("board");
        List<BoardDTO> bbs = dao.selectList(board);
        dao.close();


        req.setAttribute("bbs", bbs);
        switch (board) {
            case "1" -> req.getRequestDispatcher("/jsp/Review.jsp").forward(req, resp);
            case "2" -> req.getRequestDispatcher("/jsp/faqPage.jsp").forward(req, resp);
            default -> {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("잘못된 접근입니다.", out);
            }


        }
    }
}
