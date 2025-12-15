/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.matrinomy.routes;

import com.matrimony.models.AdditionalUserDetails;
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
@WebServlet(name = "AdminRoute", urlPatterns = {"/admin"})
public class AdminRoute extends HttpServlet {
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
        User user = null;

        try {
            HttpSession session = request.getSession();
            int totalLikes = matrimonySessionBean.getTotalLikes();
            int totalViews = matrimonySessionBean.getTotalViews();
            user = (User) session.getAttribute("user");
            List<User> users = matrimonySessionBean.getAllUsers();
            List<AdditionalUserDetails> info = matrimonySessionBean.getAllDetails();

            if (user == null) {
                response.sendRedirect("login");
            } else if (user != null) {
                session.setAttribute("likes", String.valueOf(totalLikes));
                session.setAttribute("views", String.valueOf(totalViews));
                session.setAttribute("users", users);
                session.setAttribute("info", info);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MainRoute.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
