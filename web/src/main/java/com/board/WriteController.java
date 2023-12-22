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
import java.util.Optional;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {

    private int getAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String board = req.getParameter("board");
        String postId = req.getParameter("id");

        if (board == null || board.isEmpty()) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        } else {
            int pid = getAuth(req, resp);
            if (postId == null || postId.isEmpty()) {
                req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
            } else {
                if (pid > 0) {
                    BoardDAO dao = new BoardDAO();
                    BoardDTO post = dao.selectView(postId, board);
                    dao.close();
                    if (pid == post.getAuthor_id()) {
                        req.setAttribute("post", post);
                        req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
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
        int postId = Optional.ofNullable(req.getParameter("id"))
                .map(Integer::parseInt)
                .orElse(0);
        if (action == null || board == null) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다..", out);
            return;
        }
        int pid = getAuth(req, resp);
        switch (action) {
            case "delete" -> {
                BoardDAO bDao = new BoardDAO();
                if (pid == bDao.selectAuthor(postId, board)) {
                    bDao.deletePost(postId, board);
                    bDao.close();
                    req.setAttribute("board", board);
                    req.getRequestDispatcher("/board/list.do").forward(req, resp);
                } else {
                    resp.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = resp.getWriter();
                    Alert.alertBack("작성자만 삭제할 수 있습니다.", out);
                }
            }
            case "write", "update" -> {
                BoardDAO bDao = new BoardDAO();
                BoardDTO dto = new BoardDTO();
                dto.setTitle(req.getParameter("title"));
                dto.setContent(req.getParameter("content"));
                dto.setAuthor_id(pid);
                dto.setBoardId(Integer.parseInt(board));

                if (postId > 0) {
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
            default -> {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("잘못된 접근입니다..", out);
            }
        }
    }
}