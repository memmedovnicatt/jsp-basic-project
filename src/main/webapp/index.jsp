<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login    </title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<form action="LoginServlet" method="POST">
    <input type="text" id="sername" name="username" placeholder="username" required>
    <input type="password" id="password" name="password" placeholder="password" required>
    <button type="submit">Log in</button>
    <br>
</form>
<div class="signup-container">
    <a href="register.jsp">Sign Up</a></div>
</body>
</html>

