/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrimony.admin;

import com.matrimony.models.User;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import com.matrinomy.controllers.EditDetails;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AdminEditDetails", urlPatterns = {"/admineditdetails"})
public class AdminEditDetails extends HttpServlet {

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
     * Processes requests for <code>POST</code> method.
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
        String favoriteMovies = request.getParameter("favouriteMovies");
        String favoriteCuisine = request.getParameter("favouriteCuisines");
        String favoriteBooks = request.getParameter("favouriteBooks");
        String favoritePlaces = request.getParameter("favouritePlace");
        String userId = request.getParameter("user_id");
        
        int id = Integer.parseInt(userId);
        HttpSession session = request.getSession();
        
        try {
            matrimonySessionBean.updateUserDetails(id, aboutSelf, familyDetails, qualification, workingAt, designation, hobbies, favoriteMusic, favoriteMovies, favoriteCuisine, favoriteBooks, favoritePlaces);
            List<User> users = matrimonySessionBean.getAllUsers();
            session.setAttribute("users", users);
            response.sendRedirect("admin");
        } catch (SQLException ex) {
            Logger.getLogger(AdminEditDetails.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("admin?message="+"could not update");
        }
    }
}
