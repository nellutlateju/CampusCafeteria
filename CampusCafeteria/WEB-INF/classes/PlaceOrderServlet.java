package com.cafeteria.servlets;

import com.cafeteria.models.CartItem;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("menu.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafeteria", "root", "root");

            String orderSql = "INSERT INTO orders (item_id, quantity, price) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(orderSql);

            for (CartItem item : cart) {
                ps.setInt(1, item.getMenuItem().getId());
                ps.setInt(2, item.getQuantity());
                ps.setDouble(3, item.getMenuItem().getPrice() * item.getQuantity());
                ps.addBatch();
            }

            ps.executeBatch();
            conn.close();

            // Clear cart
            session.removeAttribute("cart");

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("menu.jsp");
    }
}
