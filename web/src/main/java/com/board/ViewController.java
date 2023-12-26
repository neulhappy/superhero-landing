package com.board;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String board = req.getParameter("board");
        String postId = req.getParameter("id");
        BoardDAO dao = new BoardDAO();
        BoardDTO post = dao.selectView(postId, board);
        req.setAttribute("post", post);
        if (board.isEmpty() || postId.isEmpty()) {
            dao.close();
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        } else {
            dao.updateVisitCount(postId, board);
            dao.close();
            req.getRequestDispatcher("/board/textPage.jsp").forward(req, resp);
        }
    }
}
