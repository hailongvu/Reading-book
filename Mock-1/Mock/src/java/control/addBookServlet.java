
package control;

import entity.Book;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IDaoService;
import service.impl.DaoService;

/**
 *
 * @author tung phan
 */
@WebServlet(name = "addBookServlet", urlPatterns = {"/addBook"})
public class addBookServlet extends HttpServlet {
public IDaoService daoService = DaoService.getInstance();
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/addBook.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("book_title");
        String author = request.getParameter("author");
        String brief = request.getParameter("brief");
        String image = request.getParameter("image");
        String genre = request.getParameter("genre");
        Book b = new Book(title, author, brief, image, genre);
        daoService.addBook(b);
        response.sendRedirect("HomeAdmin");
    }
}
