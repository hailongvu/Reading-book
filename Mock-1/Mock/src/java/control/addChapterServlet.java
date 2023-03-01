
package control;

import bean.BookBean;
import entity.Book;
import entity.Chapter;
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
@WebServlet(name = "addChapterServlet", urlPatterns = {"/addChapter"})
public class addChapterServlet extends HttpServlet {

    public IDaoService daoService = DaoService.getInstance();
    private int book_id = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.book_id = Integer.parseInt(request.getParameter("id"));
        Book b = daoService.getProduct(this.book_id);
        BookBean bookBean = daoService.getProductBean(b);
        request.setAttribute("book", bookBean);
        request.getRequestDispatcher("view/AddChapter.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Chapter c = new Chapter(title, content);
        daoService.addChapter(c);
        daoService.addChaptertoBook(book_id, daoService.getlastchapter().getId());
        response.sendRedirect("Edit-Chapter?id=" + book_id);
    }
}
