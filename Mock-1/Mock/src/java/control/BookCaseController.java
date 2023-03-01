
package control;

import entity.BookCase;
import entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DINHDAT
 */
@WebServlet(name = "BookCaseController", urlPatterns = {"/BookCaseController"})
public class BookCaseController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             Cookie cookie = new Cookie("bookcase",request.getParameter("bookcase"));
            HttpSession session = request.getSession();
            BookCase bookcase = (BookCase) session.getAttribute("bookcase");
            String action = request.getParameter("action");
            if (action.equals("Add to Bookcase")) {
                if (bookcase == null) {
                    bookcase = new BookCase();
                }
                int id = Integer.parseInt(request.getParameter("id"));
                String title = request.getParameter("title");
                String image = request.getParameter("image");
                Book b = new Book(id, title, image);
                bookcase.addBC(b);
                session.setAttribute("bookcase", bookcase);
                response.sendRedirect("home-user");
//            } else if (action.equals("Show Bookcase")) {
//                response.sendRedirect("view/BookCase.jsp");
            } else if (action.equals("Remove")) {
                int id = Integer.parseInt(request.getParameter("id"));
                bookcase.remove(id);
                session.setAttribute("bookcase", bookcase);
                response.sendRedirect("Show-BockCase");
            } else if (action.equals("Remove All")) {
                session.removeAttribute("bookcase");
                response.sendRedirect("Show-BockCase");
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
