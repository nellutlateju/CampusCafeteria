package com.cafeteria.dao;

import com.cafeteria.models.MenuItem;
import java.sql.*;
import java.util.*;

public class MenuDAO {

    public static MenuItem getMenuItemById(int itemId) {
        MenuItem item = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafeteria", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM menu_items WHERE item_id = ?");
            stmt.setInt(1, itemId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                item = new MenuItem();
                item.setId(rs.getInt("item_id"));
                item.setName(rs.getString("name"));
                item.setDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return item;
    }

    // You can add other methods for retrieving the full menu list
}
