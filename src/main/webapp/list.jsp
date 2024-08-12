<%@ page import="com.example.jsplogin.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Mammadov
  Date: 7/29/2024
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TABLE</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            border: solid 1px;
        }

        thead {
            background-color: #f8f8f8;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            color: #333;
        }

        thead {
            background-color: #f8f8f8;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .addList-container {
            margin-top: 5px;
            text-align: center;
        }

        .addList-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .addList-container a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>


</head>
<body>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Password</th>
        <th>Mail</th>
        <th>PhoneNumber</th>
        <th>Profile</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>

    </thead>
    <tbody>

    <%

        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            databaseConnection.getConnection();
            String sql = "select *from user";
            Statement statement = DatabaseConnection.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet != null) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
    %>
    <tr>
        <td><%=resultSet.getInt("id") %>
        </td>
        <td><%=resultSet.getString("name") %>
        </td>
        <td><%=resultSet.getString("password") %>
        </td>
        <td><%=resultSet.getString("mail") %>
        </td>
        <td><%=resultSet.getString("phone_number") %>
        </td>
        <td><a href="ShowRegister?id=<%= resultSet.getInt("id") %>">Show Profile</a></td>
        <td><a href="DeleteServlet?id=<%= resultSet.getInt("id") %>">Delete</a></td>
        <td><a href="edit.jsp?id=<%=resultSet.getInt("id")  %>">Edit </a></td>

    </tr>

    <%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </tbody>
</table>
<div class="addList-container">
    <a href="addList.jsp">Add Memmber</a>
</div>
</body>
</html>
