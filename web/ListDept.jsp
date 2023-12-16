<%-- 
    Document   : ListDept
    Created on : Dec 16, 2023, 10:52:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Page</title>
    </head>
    <body>
        <h1>List Department</h1>

        <table border="1" width="70%">
            <tr>
                <th>Department Code</th>
                <th>Department Name</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Connection con = DBConnection.createConnection();
                    Statement st = con.createStatement();
                    String sql = "select * from department";
                    ResultSet rs = st.executeQuery(sql);

                    while (rs.next()) {%>
            <tr>
                <%--Get the department code --%>
                <td><%= rs.getString("deptcode")%></td>

                <%--Get the department name --%>
                <td><%= rs.getString("deptname")%></td>


                <td><a href='EditDepartment.jsp?deptcode=<%=rs.getString("deptcode")%>' title='Update Record'>Edit</a>
                    <a href='DeleteDepartment.jsp?deptcode=<%=rs.getString("deptcode")%>' title='Delete Record'>Delete</a>
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
