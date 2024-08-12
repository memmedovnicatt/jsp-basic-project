<%@ page import="com.example.jsplogin.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Member</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Member</h2>
    <form action="AddMemberServlet" method="post">
        <label for="name">Id:auto</label>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="name">Phone:</label>
        <input type="text" id="phone_number" name="phone" required>

        <label for="name">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="name">Mail:</label>
        <input type="text" id="mail" name="mail" required>

        <button type="submit">Save</button>
    </form>
</div>

</body>
</html>
