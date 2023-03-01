
package control;

import entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IUserService;
import service.impl.UserService;

/**
 *
 * @author DINHDAT
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    public IUserService userService = UserService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("view/register.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            if (userService.checkUsernameExist(username)) {
                request.setAttribute("mess", "Username has already existed!");
                request.getRequestDispatcher("view/register.jsp").forward(request, response);
            } else {
                String password = request.getParameter("password");
                String userType = request.getParameter("userType");
                boolean isAdmin = userType.equals("true");
                userService.insertUser(new User(username, password, isAdmin));
                request.setAttribute("mes", "Successfully register!");
                request.getRequestDispatcher("view/register.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
        }
    }
}
