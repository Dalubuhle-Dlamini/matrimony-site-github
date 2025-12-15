package com.matrinomy.routes;

import com.matrimony.models.UserAdd;
import com.matrimony.stateful.MatrimonySessionBeanLocal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
@WebServlet(name = "ServiceRoute", urlPatterns = {"/services"})
public class ServiceRoute extends HttpServlet {
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
        
        
        try {
            List<UserAdd> adds = matrimonySessionBean.getAllAdds();
            
            
            request.setAttribute("adds", adds);
            request.getRequestDispatcher("services.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceRoute.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
