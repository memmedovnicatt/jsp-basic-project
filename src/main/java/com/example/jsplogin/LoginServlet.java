package com.example.jsplogin;

import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.example.jsplogin.DatabaseConnection.connection;

@WebServlet(value = "/LoginServlet")
public class LoginServlet extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        String insertedUserName=request.getParameter("username");
        String insertedPassword=request.getParameter("password");
        String username="";
        String password="";
        try{
            DatabaseConnection databaseConnection=new DatabaseConnection();
            databaseConnection.getConnection();
            String sql="select *from jsp_include where username=?";
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            preparedStatement.setString(1,insertedUserName);
            ResultSet resultSet= preparedStatement.executeQuery();
            if (resultSet!=null){
                while (resultSet.next()){
                    username=resultSet.getString("username");
                    password=resultSet.getString("password");
                }
                if ((insertedUserName.equals(username)) && verifiedPass(insertedPassword,password)){
                    HttpSession httpSession= request.getSession();
                    httpSession.setAttribute("login",true);
                    Cookie cookie=new Cookie("username",username);
                    cookie.setMaxAge(10);
                    response.addCookie(cookie);
                    boolean login=httpSession.getAttribute("login")!=null;
                    if (login){
                        System.out.println("success");
                        response.sendRedirect("list.jsp");
                    }
                    else {
                        System.out.println("failed");
                        response.sendRedirect("index.jsp");
                    }
                }
                else {
                    System.out.println("connection failed");
                    response.sendRedirect("index.jsp");
                }

            }
            resultSet.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    public boolean verifiedPass(String insertedPassword, String hassPassword){
        return BCrypt.checkpw(insertedPassword,hassPassword);
    }

}

