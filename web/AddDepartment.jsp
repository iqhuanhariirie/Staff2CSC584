<%-- 
    Document   : AddDepartment
    Created on : Dec 16, 2023, 10:33:25 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Department</title>
    </head>
    <body>
        <h1>Add New Department</h1>

        <form action="DeptController" method="POST">
            <input type="hidden" name="operation" value="CD">
            <div class="form-group">
                <label>Department code:</label>
                <input type="text" name="deptcode" id="deptcode">
            </div>
            <div class="form-group">
                <label>Department name:</label>
                <input type="text" name="deptname" id="deptname">
            </div>
            

            <input type="submit" value="Save">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
