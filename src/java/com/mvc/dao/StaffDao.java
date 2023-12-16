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
    double stfsalary = bean.getStfsalary();
    String stfdesignation = bean.getStfdesignation();
    String deptcode = bean.getDeptcode();
    
    String sql = "insert into staff (stfname, stfsalary, stfdesignation, deptcode)" 
                 + " values (?, ?, ?, ?)";
    
    PreparedStatement ps;
    
    try {
        //create preparedstatement
        ps = con.prepareStatement(sql);
        ps.setString(1, stfname);
        ps.setDouble(2, stfsalary);
        ps.setString(3, stfdesignation);
        ps.setString(4, deptcode);
        
        ps.executeUpdate();
        
        con.close();
        
    } catch (Exception ex) {
        System.out.println(ex);
    }
}
    public Staff getStaff(int stfid) {
    try {
        String sql = "select * from staff where stfid = "+stfid;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        String stfname = rs.getString("stfname");
        double stfsalary = rs.getDouble("stfsalary");
        String stfdesignation = rs.getString("stfdesignation");
        String deptcode = rs.getString("deptcode");
        Staff stf = new Staff(stfid, stfname, stfsalary, stfdesignation, deptcode);
        con.close();
        return stf;
    } catch (Exception ex) {
       System.out.println(ex);
    }
    return null;
}
    public void updateStaff(Staff bean){
    int stfid = bean.getStfid();
    String stfname = bean.getStfname();
    double stfsalary = bean.getStfsalary();
    String stfdesignation = bean.getStfdesignation();
    String deptcode = bean.getDeptcode();
    String sql = "update staff set stfname=?,stfsalary=?,stfdesignation=?,"
               + " deptcode=? where stfid = ?;";
    
    PreparedStatement ps;
    try {
        //create preparestatement
        ps = con.prepareStatement(sql);
        ps.setString(1, stfname);
        ps.setDouble(2, stfsalary);
        ps.setString(3, stfdesignation);
        ps.setString(4, deptcode);
        ps.setInt(5,stfid);
    
        ps.executeUpdate();
        con.close();

    }
    catch (Exception ex) {
        System.out.println(ex);
    }
}
public void deleteStaff(int stfid) {
    String sql = "delete from staff where stfid = ?";
    PreparedStatement ps;
    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1,stfid);
        ps.executeUpdate();
        con.close();
    }
    catch (Exception ex){
        System.out.println(ex);
    }
}
public List<Staff> getAllStaff() {
    List<Staff> staffs = new ArrayList<>();
    try {
        String sql = "select s.*,d.deptname from staff s, department d " +
                     "where s.deptcode = d.deptcode ";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            int stfid = rs.getInt("stfid");
            String stfname = rs.getString("stfname");
            double stfsalary = rs.getDouble("stfsalary");
            String stfdesignation = rs.getString("stfdesignation");
            String dept = rs.getString("deptcode")+"-"+rs.getString("deptname");
            Staff stf = new Staff(stfid, stfname, stfsalary, stfdesignation, dept);
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
