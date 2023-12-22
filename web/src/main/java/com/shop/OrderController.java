package com.shop;

import com.member.MemberDAO;
import com.util.Alert;


import com.util.LookUp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;


import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/shop/order.do")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LookUp.getAuth(req, resp);
        req.getRequestDispatcher("/shop/order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberDAO dao = new MemberDAO();
        int PID = dao.login((String) session.getAttribute("userId"), (String) session.getAttribute("userPw"));
        if (PID < 1) {
            PrintWriter out = resp.getWriter();
            Alert.alertLocation("잘못된 접근입니다.", "/index.jsp", out);
        } else {
            OrderDTO dto = new OrderDTO();
            dto.setCustom_id(PID);
            dto.setPurchaser_name(req.getParameter("purchaser_name"));
            dto.setRecipient_name(req.getParameter("recipient_name"));
            dto.setAddress(req.getParameter("address"));
            dto.setContact(req.getParameter("contact"));
            int productsLength = dto.setProductListByRequest(req);
            if (productsLength <= 0) {
                PrintWriter out = resp.getWriter();
                Alert.alertBack("상품이 없습니다.", out);
            } else {
                OrderDAO oDao = new OrderDAO();
                int orderId = oDao.insertOrder(dto);
                int totalPrice = oDao.totalPrice(orderId);
                System.out.println("insertQuery작동됨");

                oDao.close();
                if (orderId != 0) {
                    JSONObject json = new JSONObject();
                    json.put("orderId", orderId);
                    json.put("total", totalPrice);
                    resp.setContentType("application/x-json; charset=utf-8");
                    resp.getWriter().print(json);


                } else {
                    //order 생성 실패
                }
            }
        }
    }
}

