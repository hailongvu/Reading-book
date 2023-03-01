
package control;

import bean.ChapterBean;
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
 * @author tung phan
 */
@WebServlet(name = "deleteBookServlet", urlPatterns = {"/deleteBook"})
public class deleteBookServlet extends HttpServlet {

    public IDaoService daoService = DaoService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Chapter> lc = daoService.getChaptersByBookId(id);
        List<ChapterBean> chapBook = daoService.getChaptersByBookIdBean(lc);
        daoService.delChapterBookbyBook(id + "");
        for (ChapterBean chapterBean : chapBook) {
            daoService.delChapter(chapterBean.getId() + "");
        }
        daoService.delBook(id + "");
        response.sendRedirect("HomeAdmin");
    }
}
