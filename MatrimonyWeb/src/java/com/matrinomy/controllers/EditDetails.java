/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrinomy.controllers;

import com.matrimony.models.User;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
@WebServlet(name = "EditDetails", urlPatterns = {"/editdetails"})
public class EditDetails extends HttpServlet {

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

        String aboutSelf = request.getParameter("aboutSelf");
        String familyDetails= request.getParameter("familyDetails");
        String qualification= request.getParameter("qualification");
        String workingAt= request.getParameter("workingAt");
        String designation= request.getParameter("designation");
        String hobbies = request.getParameter("hobbies");
        String favoriteMusic = request.getParameter("favoriteMusic");
        String favoriteMovies = request.getParameter("favoriteMovies");
        String favoriteCuisine = request.getParameter("favoriteCuisines");
        String favoriteBooks = request.getParameter("favoriteBooks");
        String favoritePlaces = request.getParameter("favoritePlace");
        String userId = request.getParameter("user_id");
        
        int id = Integer.parseInt(userId);
        User user = null;
        HttpSession session = request.getSession();
        
        try {
            matrimonySessionBean.updateUserDetails(id, aboutSelf, familyDetails, qualification, workingAt, designation, hobbies, favoriteMusic, favoriteMovies, favoriteCuisine, favoriteBooks, favoritePlaces);
            user = matrimonySessionBean.searchByMemberId(id);  
            session.setAttribute("user", user);
            response.sendRedirect("user");
        } catch (SQLException ex) {
            Logger.getLogger(EditDetails.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("editdetailsroute?id="+userId);
        }
    }

}
