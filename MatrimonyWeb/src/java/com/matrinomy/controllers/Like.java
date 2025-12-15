/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrinomy.controllers;

import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Like", urlPatterns = {"/like"})
public class Like extends HttpServlet {

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

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {
//            user that will be liked 
            int profileUserId = Integer.parseInt(request.getParameter("profileUserId"));
            //            user that will be liking 
            int likingUserId = Integer.parseInt(request.getParameter("likingUserId"));
            matrimonySessionBean.like(profileUserId, likingUserId);
            response.setStatus(200);
            out.print("{\"status\": \"success\"}");
        } catch (SQLException ex) {
            Logger.getLogger(Like.class.getName()).log(Level.SEVERE, null, ex);
            response.setStatus(500);
            out.print("{\"status\": \"error\"}");
        } finally {
            out.close();
        }

    }

}
