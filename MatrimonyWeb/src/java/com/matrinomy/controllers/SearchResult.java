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
import java.util.ArrayList;
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
@WebServlet(name = "SearchResult", urlPatterns = {"/searchresult"})
public class SearchResult extends HttpServlet {

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

        List<User> casteList;
        HttpSession session = request.getSession();
        String caste = request.getParameter("caste");
        if (!caste.isEmpty()) {
            try {
                casteList = matrimonySessionBean.searchByCaste(caste);
                request.setAttribute("casteList", casteList);
                session.setAttribute("matrimonySessionBean", matrimonySessionBean);
                
                request.getRequestDispatcher("search-result.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SearchResult.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //request.setAttribute("casteList", casteList);
            // Forward the request to the JSP page to display the results
            request.getRequestDispatcher("search-result.jsp").forward(request, response);
        }
    }

}
