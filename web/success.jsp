
<%@page import="com.mvc.bean.Staff"%>
<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Staff Management: Add Staff Success</title>
    </head>
    <body>
        <%
            Staff stf = (Staff) request.getAttribute("staff");
        %>
        <h1>Successfully added a staff!</h1>

        You have added the following Staff: <br/>
        Name: <%= stf.getStfname()%><br> 
        Salary: <%= stf.getStfsalary()%><br> 
        Designation: <%= stf.getStfdesignation()%><br> 
        Department: <%= stf.getDeptcode()%><br> 
        <br><a href='index.jsp'>Home</a>
    </body>
</html>