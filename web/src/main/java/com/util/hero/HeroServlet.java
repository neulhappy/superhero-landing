package com.util.hero;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet("/getHeroData")
public class HeroServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HeroManager heroManager = new HeroManager();
        // 모든 히어로 데이터를 가져옴
        Map<HeroName, HeroInfo> heroes = heroManager.getAllHeroes();

        // JSON 형식으로 변환
        String json = new Gson().toJson(heroes);

        // JSON을 클라이언트에 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
