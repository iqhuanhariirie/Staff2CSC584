/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.Department;
import com.mvc.dao.DepartmentDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DeptController extends HttpServlet {

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
            out.println("<title>Servlet DeptController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeptController at " + request.getContextPath() + "</h1>");
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
            Department dept = new Department();
            String deptcode = request.getParameter("deptcode");
            String deptName = request.getParameter("deptname");
            String operation = request.getParameter("operation");
            
            if (deptcode == null) {
                deptcode = "";
            }

            // (e) do form validation
            if (deptcode == null || deptcode.trim().length() == 0) {
                errorMsgs.add("Please enter the department code.");
            }
            if (deptName == null || deptName.trim().length() == 0) {
                errorMsgs.add("Please enter the department name.");
            }

            // (f) dispatch to error.jsp. Refer Lab 7: Exercise 2, task 2
            if (!errorMsgs.isEmpty()) {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("errorDept.jsp");
                view.forward(request, response);
                return;
            }

            // (g) store entered data to department object
            dept.setDeptcode(deptcode);
            dept.setDeptname(deptName);
            
            if (operation.equals("CD")) { //do create function
                DepartmentDao dao = new DepartmentDao(); //create dao object
                dao.addDept(dept); //call addDepartment() to insert data

                request.setAttribute("dept", dept);
                //(h) dispatch to success.jsp
                RequestDispatcher view = request.getRequestDispatcher("successDept.jsp");
                view.forward(request, response);
            }

            // add more operation for update & delete
            if (operation.equals("UD")) {
                DepartmentDao dao = new DepartmentDao();
                dao.updateDept(dept);
            }
            
            if (operation.equals("DD")) {
                
                DepartmentDao dao = new DepartmentDao();;
                dao.deleteDept(deptcode);
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
