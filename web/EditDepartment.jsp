<%-- 
    Document   : UpdateDepartment
    Created on : Dec 16, 2023, 11:06:03 PM
    Author     : Admin
--%>

<%@page import="com.mvc.dao.DepartmentDao"%>
<%@page import="com.mvc.bean.Department"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Department Page</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <%
                String deptcode = request.getParameter("deptcode");
                Department dept;
                DepartmentDao dao = new DepartmentDao();
                dept = dao.getDept(deptcode);
            %>
            <h1 class="text-center">Edit Department</h1>

            <form action="DeptController" method="POST">
                <input type="hidden" name="operation" value="UD">
                <input type="hidden" name="stfid" value="<%=dept.getDeptcode()%>">
                <div class="form-group">
                    <label for="deptcode">Department code:</label>
                    <input type="text" class="form-control" name="deptcode" id="deptcode" value="<%=dept.getDeptcode()%>">
                </div>
                <div class="form-group">
                    <label for="deptname">Department name:</label>
                    <input type="text" class="form-control" name="deptname" id="deptname" value="<%=dept.getDeptname()%>">
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </form>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

