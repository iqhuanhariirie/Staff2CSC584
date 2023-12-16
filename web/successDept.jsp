
<%@page import="com.mvc.bean.Department"%>
<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Add Department Success</title>
    </head>
    <body>
        <%
            Department dept = (Department) request.getAttribute("dept");
        %>
        <h1>Successfully added a department!</h1>

        You have added the following Department: <br/>
        Department Code: <%= dept.getDeptcode()%><br> 
        Department Name: <%= dept.getDeptname() %><br> 
        <br><a href='index.jsp'>Home</a>
    </body>
</html>