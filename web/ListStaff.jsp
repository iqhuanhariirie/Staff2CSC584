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
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">List Staff</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Staff ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Salary</th>
                        <th>Designation</th>
                        <th>Department</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
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

                        <td>
                            <a href='EditStaff.jsp?stfid=<%=rs.getInt("stfid")%>' title='Update Record' class="btn btn-primary">Edit</a>
                            <a href='DeleteStaff.jsp?stfid=<%=rs.getInt("stfid")%>' title='Delete Record' class="btn btn-danger">Delete</a>
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

