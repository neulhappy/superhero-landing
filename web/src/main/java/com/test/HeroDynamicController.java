package com.test;

import com.board.HeroDAO;
import com.board.HeroDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/HeroDynamic.do")
public class HeroDynamicController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HeroDAO dao = new HeroDAO();
        // heroList 전체를 DB에서 받아옴
        List<HeroDTO> heroList = dao.selectList();
        // 리퀘스트 객체에 히어로 리스트를 추가
        req.setAttribute("heroList", heroList);

        // JSP 파일로 포워딩
        req.getRequestDispatcher("/exemple/dynamicHeroPage.jsp").forward(req, resp);
    }
}

