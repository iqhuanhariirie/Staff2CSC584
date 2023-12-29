<%-- 
    Document   : index
    Created on : Dec 15, 2023, 4:23:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //get userName attributes from session
    String email = (String) session.getAttribute("email");
    if (email == null) { //if null (user not login) redirect to login page 
        request.setAttribute("errMessage", "You have not login");
        out.println("<script> location.href='./login.jsp'; </script>");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Staff Management System</h1>
        
        Welcome:
        <span style="color: red">
            <%=email %>
        </span>
        
        <ul>
            <li><a href="AddStaff.jsp">Add Staff</a></li>
            <li><a href="ListStaff.jsp">List Staff</a></li>
            <li><a href="viewStaff.jsp">View Staff</a></li>
        </ul>
        <ul>
            <li><a href="AddDepartment.jsp">Add Department</a></li>
            <li><a href="ListDept.jsp">List Department</a></li>
        </ul>
        <ul>
            <li><a href="register.jsp">Register</a></li>
        </ul>
    </body>
</html>
