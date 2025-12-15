package com.matrinomy.controllers;

import com.matrimony.models.User;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author dsihle875@gmail.com
 */
@WebServlet(name = "UpdatePhoto", urlPatterns = {"/updatephoto"})
@MultipartConfig(maxFileSize = 11124776)
public class UpdatePhoto extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            User user = (User) session.getAttribute("user");
            int user_id = user.getUser_id();

            // Get the uploaded file as a part (since it's a file upload)
            Part filePart = request.getPart("photo");

            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream()) {
                    byte[] photoBytes = inputStream.readAllBytes();

                    matrimonySessionBean.updateProfilePhoto(user_id, photoBytes);
                    
                    User newUser = matrimonySessionBean.getUserByEmail(user.getEmail());
                    session.setAttribute("user", newUser);
                }
            }

            response.sendRedirect("user");
        } catch (SQLException ex) {
            Logger.getLogger(UpdatePhoto.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("update-photo.jsp");
        }
    }
}
