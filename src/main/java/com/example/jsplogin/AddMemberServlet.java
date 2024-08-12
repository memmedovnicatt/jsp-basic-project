package com.example.jsplogin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;

@WebServlet(value = "/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        if (request.getMethod().equalsIgnoreCase("post")) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String mail = request.getParameter("mail");
            String p = request.getParameter("phone");
            try {
                DatabaseConnection databaseConnection = new DatabaseConnection();
                databaseConnection.getConnection();
                String query = "insert into user (name,password,mail,phone_number) values(?,?,?,?)";
                PreparedStatement preparedStatement = DatabaseConnection.connection.prepareStatement(query);
                {
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, password);
                    preparedStatement.setString(3, mail);
                    preparedStatement.setString(4, p);
                    preparedStatement.executeUpdate();
                    response.sendRedirect("list.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }
}
