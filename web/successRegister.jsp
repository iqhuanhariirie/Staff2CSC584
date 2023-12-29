<%-- 
    Document   : successRegister
    Created on : Dec 29, 2023, 3:23:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //get attributes from session
    String stfname = (String) session.getAttribute("stfname");
    String email = (String) session.getAttribute("email");
    if (email == null) { //if null (user not login) redirect to login page 
        request.setAttribute("errMessage", "You have not registered");
//        out.println("<script> location.href='./login.jsp'; </script>");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Registration Page</title>
    </head>
    <body>
        <h1>Welcome <%=stfname%>!</h1>
        <h2><%=email %> are successfully registered!</h2>
        <a href="login.jsp">Login</a>
    </body>
</html>
