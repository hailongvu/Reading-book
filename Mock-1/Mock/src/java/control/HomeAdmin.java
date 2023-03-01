
package control;

import bean.BookBean;
import entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "HomeAdmin", urlPatterns = {"/HomeAdmin"})
public class HomeAdmin extends HttpServlet {
 public IDaoService daoService = DaoService.getInstance();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */        
        List<Book> list = daoService.getAll();
        List<BookBean> listBean = daoService.getAll1(list);
        request.setAttribute("listBook", listBean);
        request.getRequestDispatcher("/view/homeAdmin.jsp").forward(request, response);
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
