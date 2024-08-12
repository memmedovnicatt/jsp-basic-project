<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Update User</h2>
    <form action="EditServlet" method="post">
        <input type="hidden" name="method" value="put">
            <input type="hidden" name="id" id="id" value=<%=request.getParameter("id")%>>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="mail">Email:</label>
        <input type="email" id="mail" name="mail" required>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required>

        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
