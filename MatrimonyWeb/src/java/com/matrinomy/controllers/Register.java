/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrinomy.controllers;

import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author dsihl
 */
@WebServlet(name = "Register", urlPatterns = {"/register-user"})
public class Register extends HttpServlet {

    private MatrimonySessionBeanLocal matrimonySessionBean;

    @Override
    public void init() throws ServletException {
        try {
            Context ctx = new InitialContext();
            matrimonySessionBean = (MatrimonySessionBeanLocal) ctx.lookup("java:global/Matrimony/MatrimonyEJB/MatrimonySessionBean!com.matrimony.stateful.MatrimonySessionBeanLocal");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup Admin Service EJB", e);
        }
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
            //        parameters from register form
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String date_of_birth = request.getParameter("date_of_birth");
            String heightString = request.getParameter("height");
            String marital_status = request.getParameter("status");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String contact_number = request.getParameter("number");
            String mother_tongue = request.getParameter("language");
            String religion = request.getParameter("religion");
            String caste = request.getParameter("caste");
            String usertype = request.getParameter("usertype");
            String paymentMethod = request.getParameter("payment_method");
            String amount = request.getParameter("payment_amount");
            int height = Integer.parseInt(heightString);
            
            matrimonySessionBean.insertBasicUserInformation(
                    firstname,
                    lastname,
                    email,
                    password,
                    gender,
                    date_of_birth,
                    height,
                    marital_status,
                    country,
                    city,
                    contact_number,
                    mother_tongue,
                    religion,
                    caste,
                    usertype,
                    paymentMethod,
                    amount
            );
            
            
            
            request.getRequestDispatcher("login").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Registration failed: " + ex.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        
        
    }

}
