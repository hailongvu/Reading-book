
package control;

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
@WebServlet(name = "deleteChapterServlet", urlPatterns = {"/deleteChapter"})
public class deleteChapterServlet extends HttpServlet {
    public IDaoService daoService = DaoService.getInstance();
    private int Book_id = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        this.Book_id = book_id;
        daoService.delChapterBook(id);
        daoService.delChapter(id);
        response.sendRedirect("Edit-Chapter?id=" + this.Book_id);
    }
}
