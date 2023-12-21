package com.board;

import com.member.MemberDAO;
import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
                HttpSession session = req.getSession();
                String userId = (String) session.getAttribute("userId");
                String userPw = (String) session.getAttribute("userPw");
                MemberDAO mDao = new MemberDAO();
                int pid = mDao.login(userId, userPw);
                mDao.close();
                BoardDAO dao = new BoardDAO();
                BoardDTO post = dao.selectView(postId, board);
                if (pid == post.getAuthor_id()) {
                    req.setAttribute("post", post);
                    req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
                    dao.close();
                } else {
                    resp.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = resp.getWriter();
                    Alert.alertBack("잘못된 접근입니다.", out);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String board = req.getParameter("board");
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userId");
        String userPw = (String) session.getAttribute("userPw");
        MemberDAO mDao = new MemberDAO();
        int pid = mDao.login(userId, userPw);
        mDao.close();
        BoardDTO dto = new BoardDTO();
        dto.setTitle(req.getParameter("name"));
        dto.setContent(req.getParameter("content"));
        dto.setAuthor_id(pid);
        dto.setBoardId(Integer.parseInt(board));
        BoardDAO bDao = new BoardDAO();
        bDao.insertWrite(dto);
        bDao.close();

        req.setAttribute("board", board);
        req.getRequestDispatcher("/board/list.do").forward(req, resp);

    }
}
