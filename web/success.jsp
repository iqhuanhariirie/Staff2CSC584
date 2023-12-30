
<%@page import="com.mvc.bean.Staff"%>
<%@page contentType = "text/html" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Management: Add Staff Success</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <%
                Staff stf = (Staff) request.getAttribute("staff");
            %>
            <h1 class="text-center">Successfully added a staff!</h1>

            <div class="alert alert-success" role="alert">
                You have added the following Staff:
                <ul>
                    <li>Name: <%= stf.getStfname()%></li>
                    <li>Email: <%= stf.getEmail()%></li>
                    <li>Salary: <%= stf.getStfsalary()%></li>
                    <li>Designation: <%= stf.getStfdesignation()%></li>
                    <li>Department: <%= stf.getDeptcode()%></li>
                </ul>
            </div>

            <a href='index.jsp' class="btn btn-primary">Home</a>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
