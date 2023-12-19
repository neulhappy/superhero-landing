package com.shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mypage/MyShoppingCart.do")
public class ShoppingCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = dao.selectProduct(req.getParameter("id"));
        HttpSession session = req.getSession();
        session.setAttribute("productDTO", dto);
    }
}
