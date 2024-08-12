package com.example.jsplogin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    static final String CONNECTION_URL = "jdbc:mysql://localhost/user";
    static final String USERNAME = "root";
    static final String PASSWORD = "Nicat556n";
    public static Connection connection;

    public void getConnection() throws SQLException {
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
            System.out.println("Connection success");

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public static void disConnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.isClosed();
                System.out.println("Connection disconnect successfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
