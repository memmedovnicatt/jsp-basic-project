<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    Boolean login = (Boolean) session.getAttribute("login");
    String name="";
    if (login!=null && login){
        Cookie[] cookie=request.getCookies();
        for (Cookie ck : cookie){
            if (ck.getName().equals("username")){
                name=ck.getValue();
            }
        }
    }
    else {
        response.sendRedirect("index.jsp");
    }
%>

<h1><%=name%></h1>
<a href="LogoutServlet">Log out</a>

</body>
</html>
