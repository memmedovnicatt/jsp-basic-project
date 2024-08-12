package com.example.jsplogin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            Member member = new Member();
            DatabaseConnection databaseConnection = new DatabaseConnection();
            databaseConnection.getConnection();
            String idParam = request.getParameter("id");
            Integer id = Integer.parseInt(idParam);
            String sql = "DELETE FROM user WHERE id=?";
            PreparedStatement preparedStatement=DatabaseConnection.connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
            System.out.println("Delete success");
            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
