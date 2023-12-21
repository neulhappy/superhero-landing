package com.shop;

import com.util.Alert;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/goods.do")
public class GoodsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> prodList = dao.selectListByCat(category);
        req.setAttribute("prodList", prodList);
        switch (category) {
            case "goods" -> req.getRequestDispatcher("/jsp/goods.jsp").forward(req, resp);
            case "photo" -> req.getRequestDispatcher("/jsp/Photocard.jsp").forward(req, resp);
            default -> {
                resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                Alert.alertBack("잘못된 접근입니다.", out);
            }
        }
    }
}
