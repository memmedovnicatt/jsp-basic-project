package com.example.jsplogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;


@WebServlet(value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    static final String INSERT = "INSERT INTO jsp_include(username, password, uniName, phoneNumber) VALUES(?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String uniName = request.getParameter("uniName");
        String phoneNumber = request.getParameter("phoneNumber");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            databaseConnection.getConnection();
            PreparedStatement preparedStatement = DatabaseConnection.connection.prepareStatement(INSERT);
            {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, hashedPassword);
                preparedStatement.setString(3, uniName);
                preparedStatement.setString(4, phoneNumber);
                preparedStatement.executeUpdate();
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
