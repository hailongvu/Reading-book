
package control;

import bean.UserBean;
import entity.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.IUserService;
import service.impl.UserService;

/**
 *
 * @author DINHDAT
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    public IUserService userService = UserService.getInstance();

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
            request.getRequestDispatcher("view/Login.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            User u = userService.checkAdmin(user, pass, true);
            User u1 = userService.checkAdmin(user, pass, false);
            HttpSession session = request.getSession();
            if (u == null && u1 == null) {
                session.setAttribute("mess", "Wrong username or password!!!");
                request.getRequestDispatcher("view/Login.jsp").forward(request, response);
            }
            if (u1 != null) {
                UserBean ub1 = userService.checkAdminBean(u1);
                session.setAttribute("cus", ub1);
                request.setAttribute("welcome", user);
                response.sendRedirect("home-user");
            }
            if (u != null) {
                UserBean ub = userService.checkAdminBean(u);
                session.setAttribute("adm", u);
                request.setAttribute("welcome", user);
                response.sendRedirect("HomeAdmin");
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
