<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff Error</title>
    </head>
    <body>
        <h1>Add Staff Error</h1>
        
        <form action="StfController" method="POST">
            <input type="hidden" name="operation" value="C">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="stfname" id="stfname">
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
                <%
            List errorMsgs = (List) request.getAttribute("errorMsgs");
        %>
        <c:if test="${not empty errorMsgs}">
            <br>
            <div class="error-message">
                Please correct the following errors:
                <ul>
                    <c:forEach var="message" items="${errorMsgs}">
                        <li>${message}</li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>
    </body>
</html>
