package com.shop;

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
import java.util.ArrayList;

@WebServlet("/shop/orderSuccess.do")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("shop/order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberDAO dao = new MemberDAO();
        int PID = dao.login((String) session.getAttribute("userId"), (String) session.getAttribute("userPw"));
        if (PID < 1){
            PrintWriter out = resp.getWriter();
            Alert.alertLocation("잘못된 접근입니다.", "/index.jsp",out);
        }else {
        ArrayList<OrderDTO.ProductSet> products = new ArrayList();


        OrderDTO dto = new OrderDTO();
        dto.setCustom_id(PID);
        dto.setPurchaser_name(req.getParameter("purchaser_name"));
        dto.setRecipient_name(req.getParameter("recipient_name"));
        dto.setAddress(req.getParameter("address"));
        dto.setContact(req.getParameter("contact"));
        dto.setProductList(products);
        OrderDAO oDao = new OrderDAO();
        int orderId = oDao.insertOrder(dto);
        System.out.println("insertQuery작동됨");
        oDao.close();

        // 그 밖에 결제 과정에서 필요한 요소들

        if (orderId != 0) {
            req.getRequestDispatcher("//payment.do").forward(req, resp);
            resp.sendRedirect("//payment.do");
        } else {
            //order 생성 실패
        }
    }
}}
