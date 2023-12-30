<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Department</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Add New Department</h1>
            
            <% List<String> errorMsgs = (List<String>) request.getAttribute("errorMsgs"); %>
            <% if (errorMsgs != null && !errorMsgs.isEmpty()) { %>
            <div class="alert alert-danger">
                <strong>Error!</strong>
                <ul>
                    <% for (String errorMsg : errorMsgs) {%>
                    <li><%= errorMsg%></li>
                        <% } %>
                </ul>
            </div>
            <% } %>

            <% String successMsg = (String) request.getAttribute("successMsg"); %>
            <% if (successMsg != null) {%>
            <div class="alert alert-success">
                <%= successMsg%>
            </div>
            <% } %>

            <form action="DeptController" method="POST">
                <input type="hidden" name="operation" value="CD">
                <div class="form-group">
                    <label for="deptcode">Department code:</label>
                    <input type="text" class="form-control" name="deptcode" id="deptcode">
                </div>
                <div class="form-group">
                    <label for="deptname">Department name:</label>
                    <input type="text" class="form-control" name="deptname" id="deptname">
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-success btn-block">Save</button>
                    </div>
                    <div class="col-md-6">
                        <button type="reset" class="btn btn-danger btn-block">Reset</button>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-md-12">
                        <a href='index.jsp' class="btn btn-primary btn-block">Home</a>
                    </div>
                </div>
            </form>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
