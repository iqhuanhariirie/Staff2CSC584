
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Staff</h1>
        <form action="LoginServlet" method="POST">
            <div class="form-group">
                <label>Email:</label>
                <input type="text" name="email" id="email">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" id="password">
            </div>
            
            <input type="submit" value="Login">
            <input type="reset" value="Reset">
            
            <a href="register.jsp">Register</a>
        </form>
    </body>
</html>
