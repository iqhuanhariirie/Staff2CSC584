<%-- 
    Document   : ListStaff
    Created on : Dec 15, 2023, 11:26:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
    </head>
    <body>
        <h1>List Staff</h1>

        <table border="1" width="70%">
            <tr>
                <th>Staff ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Connection con = DBConnection.createConnection();
                    Statement st = con.createStatement();
                    String sql = "select * from staff";
                    ResultSet rs = st.executeQuery(sql);

                    while (rs.next()) {%>
            <tr>
                <%--Get the staff id --%>
                <td><%= rs.getInt("stfid")%></td>

                <%--Get the staff name --%>
                <td><%= rs.getString("stfname")%></td>
                
                <%--Get the staff email --%>
                <td><%= rs.getString("email")%></td>

                <%--Get the staff salary --%>
                <td><%= rs.getDouble("stfsalary")%></td> 

                <%--Get the staff designation --%>
                <td><%= rs.getString("stfdesignation")%></td>

                <%--Get the department code --%>
                <td><%= rs.getString("deptcode")%></td>

                <td><a href='EditStaff.jsp?stfid=<%=rs.getInt("stfid")%>' title='Update Record'>Edit</a>
                    <a href='DeleteStaff.jsp?stfid=<%=rs.getInt("stfid")%>' title='Delete Record'>Delete</a>
                </td>
            </tr>
            <%   }
                    rs.close();
                    st.close();
                    con.close();
                } catch (Exception e) {

                }
            %>

        </table>
    </body>
</html>
