<%-- 
    Document   : viewStaff
    Created on : Dec 16, 2023, 1:11:55 AM
    Author     : Admin
--%>

<%@page import="com.mvc.dao.StaffDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    StaffDao dao = new StaffDao(); //create StaffDAO object
    request.setAttribute("staff", dao.getAllStaff());
%>
<jsp:useBean id="staff" scope="session" class="com.mvc.dao.StaffDao"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Staff</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">View All Staff Information</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Staff Id</th>
                        <th>Name</th>
                        <th>Salary</th>
                        <th>Designation</th>
                        <th>Department</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${staff}" var ="stf">
                        <tr>
                            <td><c:out value="${stf.stfid}"/></td>
                            <td><c:out value="${stf.stfname}"/></td>
                            <td><c:out value="${stf.stfsalary}"/></td>
                            <td><c:out value="${stf.stfdesignation}"/></td>
                            <td><c:out value="${stf.deptcode}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

