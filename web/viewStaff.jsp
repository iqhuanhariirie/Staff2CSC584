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
//call getAllStaff() to set an attribute to a servlet request
//and store into "staff" object
    request.setAttribute("staff", dao.getAllStaff());
%>
<!-- Get staff object using jsp:useBean -->
<jsp:useBean id="staff" scope="session" class="com.mvc.dao.StaffDao"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Staff</title>
    </head>
    <body>
        <h1>View All Staff Information</h1>

        <table border="1" width="70%">
            <tr>
                <th>Staff Id</th>
                <th>Name</th>
                <th>Salary</th>
                <th>Designation</th>
                <th>Department</th>
            </tr>
            <c:forEach items="${staff}" var ="stf">
                <tr>
                    <td><c:out value="${stf.stfid}"/></td>
                    <td><c:out value="${stf.stfname}"/></td>
                    <td><c:out value="${stf.stfsalary}"/></td>
                    <td><c:out value="${stf.stfdesignation}"/></td>
                    <td><c:out value="${stf.deptcode}"/></td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
