package com.cafeteria.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddMenuItemServlet")
public class AddMenuItemServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cafeteria";
    private static final String DB_USER = "root";  // Update if different
    private static final String DB_PASSWORD = "root";  // Update if you have a password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String imagePath = request.getParameter("imagePath");

        try {
            double price = Double.parseDouble(priceStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO menu_items (name, description, price, image_path) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setString(2, description);
                    stmt.setDouble(3, price);
                    stmt.setString(4, imagePath);

                    stmt.executeUpdate();
                }
            }

            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding menu item: " + e.getMessage());
        }
    }
}
