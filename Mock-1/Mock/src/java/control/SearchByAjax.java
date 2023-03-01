package control;

import bean.BookBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Book;
import service.IDaoService;
import service.impl.DaoService;

/**
 *
 * @author hailo
 */
@WebServlet(name = "SearchByAjax", urlPatterns = {"/searchByAjax"})
public class SearchByAjax extends HttpServlet {

    public IDaoService daoService = DaoService.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");//giay chay bo
        List<Book> list = daoService.searchByName(txtSearch);
        List<BookBean> listBean = daoService.searchByNameBean(list);
        PrintWriter out = response.getWriter();
        for (BookBean o : listBean) {
            out.print("<div class=\"card col-md-3\">\n"
                    + "                        <input type=\"hidden\" name=\"id\" value=\"" + o.getId() + "\"/>\n"
                    + "                        <img class=\"card-img-top\" width=\"250px\" height=\"300px\" name=\"image\" src=\"" + o.getImage() + "\" alt=\"Card image cap\">\n"
                    + "                        <div class=\"card-body\" style=\"text-align: center\">\n"
                    + "                            <h5 class=\"card-title\" name=\"title\" >" + o.getTitle() + "</h5>\n"
                    + "                            <a href=\"product-detail?id=" + o.getId() + "\" class=\"btn btn-success\">Read</a>\n"
                    + "                            <a href=\"BookCaseController?action=Add to Bookcase&id=" + o.getId() + "&title=" + o.getTitle() + " &image=" + o.getImage() + "\" class=\"btn btn-warning\">Add to BookCase</a>\n"
                    + "                        </div>\n"
                    + "                    </div>");
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
