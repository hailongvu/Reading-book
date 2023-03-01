
package control;

import bean.ChapterBean;
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
@WebServlet(name = "UpdateChapterServlet", urlPatterns = {"/updateChapter"})
public class UpdateChapterServlet extends HttpServlet {

    public IDaoService daoService = DaoService.getInstance();
    private int chapter_id = 0;
    private int Book_id = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.chapter_id = Integer.parseInt(request.getParameter("id"));
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        this.Book_id = book_id;
        Chapter c = daoService.getChapter(this.chapter_id);
        ChapterBean chapBean = daoService.getChapterBean(c);
        request.setAttribute("chapter", chapBean);
        request.setAttribute("book_id", book_id);
        request.getRequestDispatcher("view/updateChapter.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Chapter c = new Chapter(this.chapter_id, title, content);
        daoService.updateChapter(c);
        response.sendRedirect("Edit-Chapter?id=" + this.Book_id);
    }
}
