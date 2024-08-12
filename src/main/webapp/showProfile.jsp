<%@ page import="com.example.jsplogin.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Details</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
        }

        .member-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .member-details h2 {
            margin: 0;
            margin-bottom: 20px;
            font-size: 26px;
            color: #343a40;
        }

        .member-details .details {
            text-align: left;
            font-size: 18px;
            color: #495057;
        }

        .member-details .details label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            color: #212529;
        }

        .member-details .details span {
            display: inline-block;
            margin-bottom: 15px;
        }
        .cancel-button {
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none; /* Link altını kaldırır */
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .cancel-button:hover {
            background-color: #c0392b;
        }

    </style>
</head>
<body>
<%
    Boolean login = (Boolean) session.getAttribute("login");
    Member member = new Member();
    if (login != null && login) {
        member = (Member) session.getAttribute("member");
    }

    if (member != null) {
%>
<div class="member-details">
    <h2>Member Details</h2>
    <div class="details">
        <label>ID:</label>
        <span><%= member.getId() %></span>
        <br>
        <label>Name:</label>
        <span><%= member.getName() %></span>
        <br>
        <label>Email:</label>
        <span><%= member.getMail() %></span>
    </div>
</div>
<%
    }
%>
<a href="list.jsp" class="cancel-button">Cancel</a>
</body>
</html>