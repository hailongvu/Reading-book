package control;

import bean.BookBean;
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
@WebServlet(name = "updateBookServlet", urlPatterns = {"/updateBook"})
public class updateBookServlet extends HttpServlet {

    private int book_id = 0;
    public IDaoService daoService = DaoService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.book_id = Integer.parseInt(request.getParameter("id"));
        Book b = daoService.getProduct(this.book_id);
        BookBean bookBean = daoService.getProductBean(b);
        request.setAttribute("book", bookBean);
        request.getRequestDispatcher("view/updatebook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("book_title");
        String author = request.getParameter("author");
        String brief = request.getParameter("brief");
        String image = request.getParameter("image");
        String genre = request.getParameter("genre");
        Book b = new Book(this.book_id, title, author, brief, image, genre);
        daoService.updateBook(b);
        response.sendRedirect("HomeAdmin");
    }
}
