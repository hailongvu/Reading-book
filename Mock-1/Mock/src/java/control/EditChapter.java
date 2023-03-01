
package control;

import entity.Book;
import entity.Chapter;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IDaoService;
import service.impl.DaoService;

/**
 *
 * @author DINHDAT
 */
@WebServlet(name = "EditChapter", urlPatterns = {"/Edit-Chapter"})
public class EditChapter extends HttpServlet {

    public IDaoService daoService = DaoService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book b = daoService.getProduct(id);
        List<Chapter> listC = daoService.getChaptersByBookId(id);
        b.setListChapters(listC);
        request.setAttribute("book1", b);
        request.getRequestDispatcher("view/EditChapter.jsp").forward(request, response);
    }
}
