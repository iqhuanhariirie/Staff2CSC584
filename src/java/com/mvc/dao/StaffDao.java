/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import java.util.*;
import com.mvc.bean.Staff;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author Admin
 */
public class StaffDao {

    public StaffDao() { //default constructor
    }

//call db connection (static method) to connect to java db
    public Connection con = DBConnection.createConnection();

    public void addStaff(Staff bean) {
        String stfname = bean.getStfname();
        String email = bean.getEmail();
        String password = bean.getPassword();
        double stfsalary = bean.getStfsalary();
        String stfdesignation = bean.getStfdesignation();
        String deptcode = bean.getDeptcode();

        String sql = "insert into staff (stfname, email, password, stfsalary, stfdesignation, deptcode)"
                + " values (?, ?, ?, ?, ?, ?)";

        PreparedStatement ps;

        try {
            //create preparedstatement
            ps = con.prepareStatement(sql);
            ps.setString(1, stfname);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setDouble(4, stfsalary);
            ps.setString(5, stfdesignation);
            ps.setString(6, deptcode);

            ps.executeUpdate();

            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public Staff getStaff(int stfid) {
        try {
            String sql = "select * from staff where stfid = " + stfid;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String stfname = rs.getString("stfname");
            String email = rs.getString("email");
            String password = rs.getString("password");
            double stfsalary = rs.getDouble("stfsalary");
            String stfdesignation = rs.getString("stfdesignation");
            String deptcode = rs.getString("deptcode");
            Staff stf = new Staff(stfid, stfname, email, password, stfsalary, stfdesignation, deptcode);
            con.close();
            return stf;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateStaff(Staff bean) {
        int stfid = bean.getStfid();
        String stfname = bean.getStfname();
        String email = bean.getEmail();
        double stfsalary = bean.getStfsalary();
        String stfdesignation = bean.getStfdesignation();
        String deptcode = bean.getDeptcode();
        String sql = "UPDATE staff SET stfname = ?, email = ?, stfsalary = ?, stfdesignation = ?, deptcode = ? WHERE stfid = ?;";
                

        PreparedStatement ps;
        try {
            //create preparestatement
            ps = con.prepareStatement(sql);
            ps.setString(1, stfname);
            ps.setString(2, email);
            ps.setDouble(3, stfsalary);
            ps.setString(4, stfdesignation);
            ps.setString(5, deptcode);
            ps.setInt(6, stfid);

            ps.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void deleteStaff(int stfid) {
        String sql = "delete from staff where stfid = ?";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, stfid);
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public List<Staff> getAllStaff() {
        List<Staff> staffs = new ArrayList<>();
        try {
            String sql = "select s.*,d.deptname from staff s, department d "
                    + "where s.deptcode = d.deptcode ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int stfid = rs.getInt("stfid");
                String stfname = rs.getString("stfname");
                String email = rs.getString("email");
                String password = rs.getString("password");
                double stfsalary = rs.getDouble("stfsalary");
                String stfdesignation = rs.getString("stfdesignation");
                String dept = rs.getString("deptcode") + "-" + rs.getString("deptname");
                Staff stf = new Staff(stfid, stfname, email, password, stfsalary, stfdesignation, dept);
                staffs.add(stf);
            }
            con.close();
            return staffs;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

}
