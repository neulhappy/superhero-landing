package com.board;

import com.member.MemberDAO;
import com.util.Alert;
import com.util.LookUp;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String board = req.getParameter("board");
        String postId = req.getParameter("id");

        if (board == null || board.isEmpty()) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다.", out);
        } else {
            int pid = LookUp.getAuth(req, resp);
            req.setAttribute("board", board);
            if (postId == null || postId.isEmpty()) {
                req.getRequestDispatcher("/board/writePage.jsp").forward(req, resp);
            } else {
                if (pid > 0) {
                    BoardDAO dao = new BoardDAO();
                    BoardDTO post = dao.selectView(postId, board);
                    dao.close();
                    if (pid == post.getAuthor_id()) {
                        req.setAttribute("post", post);
                        req.setAttribute("action", "update");
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
                .filter(s -> !s.isEmpty())
                .map(Integer::parseInt)
                .orElse(0);

        if (action == null || board == null) {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Alert.alertBack("잘못된 접근입니다..", out);
            return;
        }
        int pid = LookUp.getAuth(req, resp);
        switch (action) {
            case "delete" -> {
                BoardDAO bDao = new BoardDAO();
                if (pid == bDao.selectAuthor(postId, board)) {
                    bDao.deletePost(postId, board);
                    bDao.close();
                    req.setAttribute("board", board);
                    resp.sendRedirect(req.getContextPath() + "/board/list.do?board=" + board);
                } else {
                    resp.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = resp.getWriter();
                    Alert.alertBack("작성자만 삭제할 수 있습니다.", out);
                }
                //todo: 삭제할 글이 db에 없을 떄 오류
            }
            case "write" -> {
                BoardDAO bDao = new BoardDAO();
                BoardDTO dto = new BoardDTO();
                dto.setTitle(req.getParameter("title"));
                System.out.println(req.getParameter("title") + "타이틀");
                System.out.println(req.getParameter("content") + "컨텐츠 내용");
                dto.setContent(req.getParameter("content"));
                dto.setAuthor_id(pid);
                dto.setBoardId(Integer.parseInt(board));

                if (postId == 0) {
                    postId = bDao.insertWrite(dto);
                } else if (postId > 0) {
                    dto.setId(postId);
                    postId = bDao.updateWrite(dto);
                }
                bDao.close();
                if (postId > 0) {
                    resp.sendRedirect(req.getContextPath() + "/board/view.do?id=" + postId + "&board=" + board);
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