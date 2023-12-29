<%-- 
    Document   : AddStaff
    Created on : Dec 15, 2023, 10:23:32 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
    </head>
    <body>
        <h1>Add New Staff</h1>

        <form action="StfController" method="POST">
            <input type="hidden" name="operation" value="C">
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
                <input type="text" name="password" id="password">
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

            <input type="submit" value="Save">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
