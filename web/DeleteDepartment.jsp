
<%@page import="com.mvc.dao.DepartmentDao"%>
<%@page import="com.mvc.bean.Department"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Department Page</title>
    </head>
    <body>
        <%
            String deptcode = request.getParameter("deptcode");
            Department dept;
            DepartmentDao dao = new DepartmentDao();
            dept = dao.getDept(deptcode);
        %>
        <h1>Delete Department</h1>

        <form action="DeptController" method="POST">
            <table>
                <tr>
                    <td>Department code:</td>
                    <td><input type="text" name="deptcode" value="<%= dept.getDeptcode()%>" /></td>
                </tr>
                <tr>
                    <td>Department name:</td>
                    <td><input type="text" name="deptname" value="<%= dept.getDeptname()%>" /></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="operation" value="DD" />
                        <input type="hidden" name="deptcode" value="<%= dept.getDeptcode()%>" />

                    </td>
                    <td ><input type="submit" value="Delete" /> 
                </tr>

            </table>
        </form>

    </body>
</html>
