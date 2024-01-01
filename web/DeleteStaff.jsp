
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.StaffDao"%>
<%@page import="com.mvc.bean.Staff"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Connection con = DBConnection.createConnection();
    Statement st = con.createStatement();
    String sql = "select deptcode, concat(deptcode,'-',deptname) deptname from department order by deptcode";
    ResultSet rs = st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Staff Page</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <%
                int stfid = Integer.parseInt(request.getParameter("stfid"));
                Staff stf;
                StaffDao dao = new StaffDao();
                stf = dao.getStaff(stfid);
            %>
            <h1 class="text-center">Delete Staff</h1>
            
            <form action="StfController" method="POST">
                <input type="hidden" name="operation" value="D">
                <input type="hidden" name="stfid" value="<%=stf.getStfid()%>">
                <div class="form-group">
                    <label for="stfname">Name:</label>
                    <input type="text" class="form-control" name="stfname" id="stfname" value="<%=stf.getStfname()%>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" name="email" id="email" value="<%=stf.getEmail()%>">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" class="form-control" name="password" id="password" value="<%=stf.getPassword()%>">
                </div>
                <div class="form-group">
                    <label for="stfsalary">Salary:</label>
                    <input type="text" class="form-control" name="stfsalary" id="stfsalary" value="<%=stf.getStfsalary()%>">
                </div>
                <div class="form-group">
                    <label for="stfdesignation">Designation:</label>
                    <input type="text" class="form-control" name="stfdesignation" id="stfdesignation" value="<%=stf.getStfdesignation()%>">
                </div>
                <div class="form-group">
                    <label for="deptcode">Department:</label>
                    <select class="form-control" name="deptcode" id="deptcode">
                        <%
                            while (rs.next()) {%>
                        <option value="<%= rs.getString("deptcode")%>"><%= rs.getString("deptname")%></option>
                        <% }%>       
                    </select>
                </div>

                <button type="submit" class="btn btn-danger">Delete</button>
                
            </form>
            <%
                rs.close();
                st.close();
                con.close();
            %>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

