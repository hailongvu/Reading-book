
package control;

import bean.BookBean;
import bean.ChapterBean;
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
 * @author hailo
 */
@WebServlet(name = "ProductDetailController", urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {
public IDaoService daoService = DaoService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")) ;
        Book b = daoService.getProduct(id);
        BookBean bookBean = daoService.getProductBean(b);
        List<Chapter> listC = daoService.getChaptersByBookId(id);
        List<ChapterBean> listBean = daoService.getChaptersByBookIdBean(listC);
        bookBean.setListChapters(listBean);
        request.setAttribute("book", bookBean);
        request.getRequestDispatcher("view/ProductDetail.jsp").forward(request, response);
    }
}
