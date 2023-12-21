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

    private int getPID(HttpServletRequest req) throws IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userId");
        String userPw = (String) session.getAttribute("userPw");
        MemberDAO mDao = new MemberDAO();
        int pid = 0;
        pid = mDao.login(userId, userPw);
        mDao.close();
        return pid;
    }

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
                int pid = getPID(req);
                if (pid > 0) {
                    BoardDAO dao = new BoardDAO();
                    BoardDTO post = dao.selectView(postId, board);

                    if (pid == post.getAuthor_id()) {
                        req.setAttribute("post", post);
                        req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
                        dao.close();
                    } else {
                        resp.setContentType("text/html;charset=UTF-8");
                        PrintWriter out = resp.getWriter();
                        Alert.alertBack("작성자만 수정할 수 있습니다.", out);
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String board = req.getParameter("board");
        int postId = Integer.parseInt(req.getParameter("id"));

        int pid = getPID(req);

        if (pid < 1) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("인증 오류가 발생했습니다.", out);
            return;
        }

        BoardDAO bDao = new BoardDAO();
        if (action.equals("delete")) {
            if (pid == bDao.selectAuthor(postId, board)) {
                bDao.deletePost(postId, board);
            } else {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("작성자만 삭제할 수 있습니다.", out);
                bDao.close();
                return;
            }
            req.setAttribute("board", board);
            req.getRequestDispatcher("/board/list.do").forward(req, resp);
        } else if (action.equals("write") || action.equals("update")) {
            BoardDTO dto = new BoardDTO();
            dto.setTitle(req.getParameter("title"));
            dto.setContent(req.getParameter("content"));
            dto.setAuthor_id(pid);
            dto.setBoardId(Integer.parseInt(board));

            if (action.equals("write")) {
                postId = bDao.insertWrite(dto);
            } else {
                dto.setId(postId);
                postId = bDao.updateWrite(dto);
            }

            bDao.close();

            if (postId > 0) {
                req.setAttribute("id", postId);
                req.setAttribute("board", board);
                req.getRequestDispatcher("/board/view.do").forward(req, resp);
            } else {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("게시글 작성에 실패했습니다.", out);
            }
        }
    }
}
