<%-- 
    Document   : EditStaff
    Created on : Dec 16, 2023, 12:10:30 AM
    Author     : Admin
--%>
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
        <title>Edit Staff Page</title>
    </head>
    <body>
        <%
            int stfid = Integer.parseInt(request.getParameter("stfid"));
            Staff stf;
            StaffDao dao = new StaffDao();
            stf = dao.getStaff(stfid);
        %>
        <h1>Edit Staff</h1>

        <form action="StfController" method="POST">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="stfname" value="<%=stf.getStfname()%>" /></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><input type="text" name="stfsalary" value="<%=stf.getStfsalary()%>" /></td>
                </tr>
                <tr>
                    <td>Designation:</td>
                    <td><input type="text" name="stfdesignation" value="<%=stf.getStfdesignation()%>" /></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td>
                        <select name="deptcode" id="deptcode">
                            <%
                        while (rs.next()) {%>
                            <option value="<%= rs.getString("deptcode")%>"><%= rs.getString("deptname")%></option>

                            <% }%>       
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" name="operation" value="U" />
                        <input type="hidden" name="stfid" value="<%=stf.getStfid()%>" />

                    </td>
                    <td ><input type="submit" value="Update" /> 
                </tr>

            </table>
        </form>
        <%
            rs.close();
            st.close();
            con.close();
        %>
    </body>
</html>
