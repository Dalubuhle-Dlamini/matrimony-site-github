/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrinomy.controllers;

import com.matrimony.models.User;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author dsihl
 */
@WebServlet(name = "Login", urlPatterns = {"/login-user"})
public class Login extends HttpServlet {
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
        //        session object
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = null;
        try {
            String usertype = matrimonySessionBean.loginUser(email, password);
            List<User> users = matrimonySessionBean.getAllUsers();
            if(null == usertype){
                request.setAttribute("errorMessage", "login failed email or password inccorrect");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else switch (usertype) {
                case "User":
                    user = matrimonySessionBean.getUserByEmail(email);                    
                    session.setAttribute("users", users);
                    session.setAttribute("user", user);
                    response.sendRedirect("user");
                    break;
                case "Admin":
                    user = matrimonySessionBean.getUserByEmail(email);
                    session.setAttribute("users", users);
                    session.setAttribute("user", user);
                    response.sendRedirect("admin");
                    break;
                default:
                    request.setAttribute("errorMessage", "login failed email or password inccorrect");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "login failed email or password inccorrect " + ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
