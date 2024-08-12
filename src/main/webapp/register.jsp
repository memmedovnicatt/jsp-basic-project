<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTER</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Register</h2>
<form action="RegisterServlet" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="uniName" placeholder="University" required>
    <input type="text" name="phoneNumber" placeholder="Phone Number" required>
    <button type="submit">Register</button>
</form>
<a href="index.jsp"><button>Sign In</button></a>
</body>
</html>
