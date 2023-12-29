/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;
import com.mvc.bean.Staff;
import com.mvc.dao.RegisterDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        try{
        List errorMsgs = new LinkedList();
            // get staff details from register.jsp page 
           
            String stfname = request.getParameter("stfname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String stfSalary = request.getParameter("stfsalary");
            String stfDesignation = request.getParameter("stfdesignation");
            String deptcode = request.getParameter("deptcode");
            String operation = request.getParameter("operation");

            //creating object Staff
            Staff staff = new Staff();

            // (e) do form validation
            if (stfname == null || stfname.trim().length() == 0) {
                errorMsgs.add("Please enter your name.");
            }
            if (email == null || email.trim().length() == 0) {
                errorMsgs.add("Please enter your email.");
            }
            if (password == null || password.trim().length() == 0) {
                errorMsgs.add("Please enter your password.");
            }
            if (stfSalary == null || stfSalary.trim().length() == 0) {
                errorMsgs.add("Please enter the staff salary.");
            }
            if (stfDesignation == null || stfDesignation.trim().length() == 0) {
                errorMsgs.add("Please enter the designation.");
            }

            //setting staff details through the Staff object 
           
            staff.setStfname(stfname);
            staff.setEmail(email);
            staff.setPassword(password);
            staff.setStfsalary(Double.parseDouble(stfSalary));
            staff.setStfdesignation(stfDesignation);
            staff.setDeptcode(deptcode);
           

            // creating object for RegisterDao
            RegisterDao registerDao = new RegisterDao();

            //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
            String userRegistered = registerDao.registerUser(staff);

            if (userRegistered.equals("SUCCESS")) //On success, you can display a message to user on Home page
            {
                HttpSession session = request.getSession(); //register session

                //to set the attribute to the session 
                session.setAttribute("stfname", stfname);
                session.setAttribute("email", email);
                request.getRequestDispatcher("successRegister.jsp").forward(request, response);
            } 
//            else //On Failure, display a meaningful message to the User.
//            {
//                request.setAttribute("errMessage", errorMsgs);
//                request.getRequestDispatcher("registerError.jsp").forward(request, response);
//            }
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
