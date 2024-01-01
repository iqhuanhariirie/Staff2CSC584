<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Staff Page</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">Register Staff</h1>

            <form action="RegisterServlet" method="POST" class="needs-validation" novalidate>
                <input type="hidden" name="operation" value="R">
                <div class="form-group">
                    <label for="stfname">Name:</label>
                    <input type="text" class="form-control" id="stfname" name="stfname" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                </div>
                <div class="form-group">
                    <label for="stfsalary">Salary:</label>
                    <input type="text" class="form-control" id="stfsalary" name="stfsalary" required>
                </div>
                <div class="form-group">
                    <label for="stfdesignation">Designation:</label>
                    <input type="text" class="form-control" id="stfdesignation" name="stfdesignation" required>
                </div>
                <div class="form-group">
                    <label for="deptcode">Department:</label>
                    <select class="form-control" id="deptcode" name="deptcode">
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

                <button type="submit" class="btn btn-primary">Register</button>
                <button type="reset" class="btn btn-secondary">Reset</button>

                Already have an account?<a href="login.jsp" class="btn btn-link">Login</a>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
