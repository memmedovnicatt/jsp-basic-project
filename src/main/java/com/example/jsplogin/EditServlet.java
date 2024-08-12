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

@WebServlet(value = "/EditServlet")
public class EditServlet extends HttpServlet {
    private static final String UPDATE_QUERY = "UPDATE user SET name=?, mail=?, phone_number=? WHERE id=?";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String method = request.getParameter("method");
        if ("PUT".equalsIgnoreCase(method)) {
            doPut(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Method Not Allowed");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String insertedName = request.getParameter("name");
        String insertedMail = request.getParameter("mail");
        String insertedPhoneNumber = request.getParameter("phone");
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            databaseConnection.getConnection();
            String query="update user set name=?,mail=?,phone_number=? where id=?";
            String idParam = request.getParameter("id");
            System.out.println(idParam);
            int id;
            id=Integer.parseInt(idParam);
            PreparedStatement preparedStatement=DatabaseConnection.connection.prepareStatement(query);
            preparedStatement.setString(1, insertedName);
            preparedStatement.setString(2, insertedMail);
            preparedStatement.setString(3, insertedPhoneNumber);
            preparedStatement.setInt(4, id);
            preparedStatement.executeUpdate();
            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
