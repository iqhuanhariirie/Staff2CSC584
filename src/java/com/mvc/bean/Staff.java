/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

import java.io.Serializable;


public class Staff implements Serializable {
    private int stfid;
    private String stfname;
    private String email;
    private String password;
    private double stfsalary;
    private String stfdesignation;
    private String deptcode;

    public Staff(int stfid, String stfname, String email, String password, double stfsalary, String stfdesignation, String deptcode) {
        this.stfid = stfid;
        this.stfname = stfname;
        this.email = email;
        this.password = password;
        this.stfsalary = stfsalary;
        this.stfdesignation = stfdesignation;
        this.deptcode = deptcode;
    }

    public Staff() {
    }

    public int getStfid() {
        return stfid;
    }

    public void setStfid(int stfid) {
        this.stfid = stfid;
    }

    public String getStfname() {
        return stfname;
    }

    public void setStfname(String stfname) {
        this.stfname = stfname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getStfsalary() {
        return stfsalary;
    }

    public void setStfsalary(double stfsalary) {
        this.stfsalary = stfsalary;
    }

    public String getStfdesignation() {
        return stfdesignation;
    }

    public void setStfdesignation(String stfdesignation) {
        this.stfdesignation = stfdesignation;
    }

    public String getDeptcode() {
        return deptcode;
    }

    public void setDeptcode(String deptcode) {
        this.deptcode = deptcode;
    }
    
    
    
    
    
}
