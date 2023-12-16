/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Department;
import com.mvc.bean.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import util.DBConnection;

public class DepartmentDao {

    public DepartmentDao() {
    }

    public Connection con = DBConnection.createConnection();

    public void addDept(Department bean) {
        String deptcode = bean.getDeptcode();
        String deptname = bean.getDeptname();

        String sql = "insert into department (deptcode, deptname)"
                + " values (?, ?)";

        PreparedStatement ps;

        try {
            //create preparedstatement
            ps = con.prepareStatement(sql);
            ps.setString(1, deptcode);
            ps.setString(2, deptname);

            ps.executeUpdate();

            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public Department getDept(String deptcode) {
        try {
            String sql = "select * from department where deptcode = '" + deptcode + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String deptname = rs.getString("deptname");
            Department dept = new Department(deptcode, deptname);
            con.close();
            return dept;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateDept(Department bean) {
        String deptcode = bean.getDeptcode();
        String deptname = bean.getDeptname();
        String sql = "update department set deptname=? where deptcode = ?;";

        PreparedStatement ps;
        try {
            //create preparestatement
            ps = con.prepareStatement(sql);
            ps.setString(1, deptname);
            ps.setString(2, deptcode);

            ps.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void deleteDept(String deptcode) {
        PreparedStatement ps;
//        String sql1 = "update staff set deptcode = null where deptcode = ?";
//
//        try {
//            ps = con.prepareStatement(sql1);
//            ps.setString(1, deptcode);
//            ps.executeUpdate();
//            con.close();
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
        String sql = "delete from department where deptcode = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, deptcode);
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
