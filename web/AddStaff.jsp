<%-- 
    Document   : AddStaff
    Created on : Dec 15, 2023, 10:23:32 PM
    Author     : Admin
--%>

<%@page import="com.mvc.bean.Staff"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Add New Staff</h1>

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
            <form action="StfController" method="POST">
                <input type="hidden" name="operation" value="C">
                <div class="form-group">
                    <label for="stfname">Name:</label>
                    <input type="text" class="form-control" name="stfname" id="stfname">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" name="email" id="email">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" class="form-control" name="password" id="password">
                </div>
                <div class="form-group">
                    <label for="stfsalary">Salary:</label>
                    <input type="text" class="form-control" name="stfsalary" id="stfsalary">
                </div>
                <div class="form-group">
                    <label for="stfdesignation">Designation:</label>
                    <input type="text" class="form-control" name="stfdesignation" id="stfdesignation">
                </div>
                <div class="form-group">
                    <label for="deptcode">Department:</label>
                    <select class="form-control" name="deptcode" id="deptcode">
                        <%
                            try {
                                Connection con = DBConnection.createConnection();
                                Statement st = con.createStatement();
                                String sql = "select * from department";
                                ResultSet rs = st.executeQuery(sql);

                                while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("deptcode")%>"><%= rs.getString("deptcode")%> - <%= rs.getString("deptname")%></option>
                        <%
                                }
                            } catch (Exception e) {

                            }

                        %>
                    </select> 
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

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

