package com.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet
public class QuestionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String saveDir = req.getServletContext().getRealPath("/upload");

        BoardDTO dto = new BoardDTO();
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setAuthor_id(Integer.parseInt(req.getParameter("UserId")));


        BoardDAO dao = new BoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("../mvcboard/list.do");
        } else {
            //실패
        }
    }
}
