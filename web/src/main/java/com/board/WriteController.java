package com.board;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String board = req.getParameter("board");
        String postId = req.getParameter("id");
        if (board.isEmpty()) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        } else {
            if (postId.isEmpty()) {
                req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
            } else {
                //todo: 로그인 유효성 검사
                BoardDAO dao = new BoardDAO();
                BoardDTO post = dao.selectView(postId, board);
                req.setAttribute("post", post);
                req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
                dao.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int author_id = Integer.parseInt(req.getParameter("author_id"));
        //todo: 로그인 유효성 검사
        BoardDTO dto = new BoardDTO();
        dto.setTitle(req.getParameter("name"));
        dto.setContent(req.getParameter("content"));
        dto.setAuthor_id(author_id);

        BoardDAO dao = new BoardDAO();
    }
}
