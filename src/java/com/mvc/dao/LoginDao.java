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
public class LoginDao {

    public LoginDao() {
    }
    public String authenticateUser(Staff staff) {
        String email = staff.getEmail(); //keeping user entered value 
        String password = staff.getPassword(); //in temporary variable

        Connection con = null;
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            con = DBConnection.createConnection(); //establishing connection 
            stmt = con.createStatement(); //stmt used to write queries
            String sql; //sql select stmt
            sql = "select * from staff where email = '" + email
                    + "' and password = '" + password + "'";

            resultSet = stmt.executeQuery(sql); // execute query
            if (resultSet.next()) { //record found (enter username & password 
                return "SUCCESS";       //match with value in db
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//Just returning appropriate message otherwise
        return "Invalid user credentials";
    }
}
