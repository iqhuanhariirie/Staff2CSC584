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
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">List Department</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Department Code</th>
                        <th>Department Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
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

                        <td>
                            <a href='EditDepartment.jsp?deptcode=<%=rs.getString("deptcode")%>' title='Update Record' class="btn btn-primary">Edit</a>
                            <a href='DeleteDepartment.jsp?deptcode=<%=rs.getString("deptcode")%>' title='Delete Record' class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%   }
                            rs.close();
                            st.close();
                            con.close();
                        } catch (Exception e) {

                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

