/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Staff;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author Admin
 */
public class RegisterDao {

    public RegisterDao() {
    }

    public String registerUser(Staff staff) {
        String stfname = staff.getStfname();
        String email = staff.getEmail();
        String password = staff.getPassword();
        double stfsalary = staff.getStfsalary();
        String stfdesignation = staff.getStfdesignation();
        String deptcode = staff.getDeptcode();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnection.createConnection();
            String query = "INSERT INTO staff (stfname, email, password, stfsalary, stfdesignation, deptcode) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, stfname);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setDouble(4, stfsalary);
            preparedStatement.setString(5, stfdesignation);
            preparedStatement.setString(6, deptcode);
            int i = preparedStatement.executeUpdate();
            if (i != 0) //Just to ensure data has been inserted into the database
            {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Oops.. Something went wrong there..!";
    }

}
