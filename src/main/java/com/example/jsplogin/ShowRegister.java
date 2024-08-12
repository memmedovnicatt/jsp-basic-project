package com.example.jsplogin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.crypto.Data;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(value = "/ShowRegister")
public class ShowRegister extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        Member member=new Member();
        try{
            DatabaseConnection databaseConnection=new DatabaseConnection();
            databaseConnection.getConnection();
            String idParam = request.getParameter("id");
            Integer id = Integer.parseInt(idParam);
            String query ="select *from user where id=?";
            PreparedStatement preparedStatement=DatabaseConnection.connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                System.out.println("User found.");
                member.setId(resultSet.getInt("id"));
                member.setMail(resultSet.getString("mail"));
                member.setName(resultSet.getString("name"));
                member.setPassword(resultSet.getString("password"));
                member.setPhone_number(resultSet.getString("phone_number"));
            }resultSet.close();
            HttpSession httpSession2= request.getSession();
            httpSession2.setAttribute("member",member);
            response.sendRedirect("showProfile.jsp");

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
