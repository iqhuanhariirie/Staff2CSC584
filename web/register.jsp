
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Staff Page</title>
    </head>
    <body>
        <h1>Register Staff</h1>

        <form action="RegisterServlet" method="POST">
            <input type="hidden" name="operation" value="R">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="stfname" id="stfname">
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="text" name="email" id="email">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" id="password">
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" name="password" id="password">
            </div>
             <div class="form-group">
                <label>Salary:</label>
                <input type="text" name="stfsalary" id="stfsalary">
            </div>
            <div class="form-group">
                <label>Designation:</label>
                <input type="text" name="stfdesignation" id="stfdesignation">
            </div>
            
            <div class="form-group">
                <label>Department:</label>
                <select name="deptcode" id="deptcode">
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

            <input type="submit" value="Register">
            <input type="reset" value="Reset">

            <a href="login.jsp">Login</a>
        </form>


    </body>
</html>
