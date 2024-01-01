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
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Staff Management System</h1>
            
            <p class="text-center">Welcome: <span class="text-danger"><%=email %></span></p>
            
            <div class="row">
                <div class="col-md-4">
                    <h2>Staff</h2>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="AddStaff.jsp">Add Staff</a></li>
                        <li class="list-group-item"><a href="ListStaff.jsp">List Staff</a></li>
                        <li class="list-group-item"><a href="viewStaff.jsp">View Staff</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h2>Department</h2>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="AddDepartment.jsp">Add Department</a></li>
                        <li class="list-group-item"><a href="ListDept.jsp">List Department</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h2>Other</h2>
                    <ul class="list-group">
                        
                        <li class="list-group-item"><a href="./LogoutServlet">Logout</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

