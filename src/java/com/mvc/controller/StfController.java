/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.Staff;
import com.mvc.dao.StaffDao;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class StfController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StfController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StfController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List errorMsgs = new LinkedList();
            Staff stf = new Staff();
            String stfID = request.getParameter("stfid");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String stfName = request.getParameter("stfname");
            String stfSalary = request.getParameter("stfsalary");
            String stfDesignation = request.getParameter("stfdesignation");
            String deptcode = request.getParameter("deptcode");
            String operation = request.getParameter("operation");
            String successMsg = "You have added the following: <br/>"
                    + "Name: " + stfName + "<br/>"
                    + "Email: " + email + "<br/>"
                    + "Salary: " + stfSalary + "<br/>"
                    + "Designation: " + stfDesignation + "<br/>"
                    + "deptcode: " + deptcode;

            if (stfID == null) {
                stfID = "0";
            }

            // (e) do form validation
            if (stfName == null || stfName.trim().length() == 0) {
                errorMsgs.add("Please enter the staff name.");
            }
            if (email == null || email.trim().length() == 0) {
                errorMsgs.add("Please enter the staff email.");
            }
            if (password == null || password.trim().length() == 0) {
                errorMsgs.add("Please enter the staff password.");
            }
            if (stfSalary == null || stfSalary.trim().length() == 0) {
                errorMsgs.add("Please enter the staff salary.");
            }
            if (stfDesignation == null || stfDesignation.trim().length() == 0) {
                errorMsgs.add("Please enter the designation.");
            }
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("AddStaff.jsp");
                view.forward(request, response);
                return;
            }
            // (g) store entered data to staff object
            stf.setStfid(Integer.parseInt(stfID));
            stf.setStfname(stfName);
            stf.setEmail(email);
            stf.setPassword(password);
            stf.setStfsalary(Double.parseDouble(stfSalary));
            stf.setStfdesignation(stfDesignation);
            stf.setDeptcode(deptcode);

            if (operation.equals("C")) { //do create function

                StaffDao dao = new StaffDao(); //create dao object
                dao.addStaff(stf); //call addStaff() to insert data
                request.setAttribute("staff", stf);
                request.setAttribute("successMsg", successMsg);
                RequestDispatcher view = request.getRequestDispatcher("AddStaff.jsp");
                view.forward(request, response);
            }

            // add more operation for update & delete
            if (operation.equals("U")) {
                StaffDao dao = new StaffDao();
                dao.updateStaff(stf);
                request.setAttribute("staff", stf);

                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            }

            if (operation.equals("D")) {
                int stfid = Integer.parseInt(request.getParameter("stfid"));
                StaffDao dao = new StaffDao();
                dao.deleteStaff(stfid);

                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
