package com.board;

import com.util.BoardPage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet("heroboard/list.do")
public class BoardController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //DAO 생성
        BoardDAO dao = new BoardDAO();

        //뷰에 전달할 맵 생성
        Map<String, Object> map = new HashMap<>();

        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        String boardId = req.getParameter("boardId");
        if (searchWord != null) {
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount = dao.selectCount(map, boardId);

        /*페이징 처리 시작*/
        int pageSize = 10;
        int blockPage = 5;

        //현재 페이지 확인
        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.isEmpty()) {
            pageNum = Integer.parseInt(pageTemp);
        }

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;

        map.put("start", start);
        map.put("end", end);

        List<BoardDTO> boardList = dao.selectListPage(map, boardId);

        dao.close();

        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "heroboard/list.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        req.setAttribute("boardList", boardList);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/include/board_grid.jsp").forward(req, resp);


    }
}
