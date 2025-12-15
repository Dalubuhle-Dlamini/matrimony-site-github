package com.matrimony.admin;

import com.matrimony.models.User;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import com.matrinomy.controllers.EditDetails;
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
 * @author dsihle875@gmail.com
 */
@WebServlet(name = "AdminEdit", urlPatterns = {"/adminedit"})
public class AdminEdit extends HttpServlet {
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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("date_of_birth");
        String height = request.getParameter("height");
        String maritalStatus = request.getParameter("marital_status");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String number = request.getParameter("contact_number");
        String language = request.getParameter("mother_tongue");
        String religion = request.getParameter("religion");
        String caste = request.getParameter("caste");
        String userType = request.getParameter("user_type"); 
        String userId = request.getParameter("user_id");

        int id = Integer.parseInt(userId);
        HttpSession session = request.getSession();
        try {
            matrimonySessionBean.updateUser(id, firstname, lastname, email, gender, dob, height, maritalStatus, country, city, number, language, religion, caste, userType);
            List<User> users = matrimonySessionBean.getAllUsers();
            session.setAttribute("users", users);
            response.sendRedirect("admin");
        } catch (SQLException ex) {
            Logger.getLogger(EditDetails.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("admin?message=" + "cannot update");
        }
    }

}
