
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Staff Page</title>
    </head>
    <body>
        <h1>Login Staff</h1>

        <form action="RegisterServlet" method="POST">
            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" id="username">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="userpassword" id="userpassword">
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" name="userpassword" id="userpassword">
            </div>

            <input type="submit" value="Register">
            <input type="reset" value="Reset">

            <a href="login.jsp">Login</a>
        </form>


    </body>
</html>
