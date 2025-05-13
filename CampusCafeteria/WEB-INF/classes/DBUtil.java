package com.cafeteria.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/your_db_name"; // Replace with your DB URL
    private static final String USER = "your_db_user"; // Replace with your DB user
    private static final String PASSWORD = "your_db_password"; // Replace with your DB password

    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver (if not already loaded)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Failed to establish database connection", e);
        }
    }
}
