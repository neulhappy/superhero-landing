// 참고용으로 보존
//package com.board;
//
//import com.util.BoardPage;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//
////@WebServlet("heroboard/list.do")
//public class BoardController extends HttpServlet {
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //DAO 생성
//        BoardDAO dao = new BoardDAO();
//
//        //뷰에 전달할 맵 생성
//        Map<String, Object> map = new HashMap<>();
//
//        String searchField = req.getParameter("searchField");
//        String searchWord = req.getParameter("searchWord");
//        String boardId = req.getParameter("boardId");
//        if (searchWord != null) {
//            map.put("searchField", searchField);
//            map.put("searchWord", searchWord);
//        }
//        int totalCount = dao.selectCount(map, boardId);
//
//        List<BoardDTO> boardList = dao.selectList(map, boardId);
//
//        dao.close();
//        String contextPath = req.getContextPath();
//
//        req.setAttribute("boardList", boardList);
//        req.setAttribute("map", map);
//        req.getRequestDispatcher("/include/").include(req, resp);
//
//
//    }
//}
