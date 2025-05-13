package com.cafeteria.servlets;

import com.cafeteria.models.MenuItem;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MenuItem> menuItems = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafeteria", "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM menu_items");

            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setId(rs.getInt("item_id"));
                item.setName(rs.getString("name"));
                item.setDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
                // item.setImagePath(rs.getString("image_path"));

                menuItems.add(item);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Log the size of the menuItems to check if they are populated
        System.out.println("Menu items size: " + menuItems.size());

        // Set menuItems as request attribute to pass to JSP
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
