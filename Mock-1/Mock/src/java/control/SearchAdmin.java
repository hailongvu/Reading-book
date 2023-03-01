/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(name = "SearchAdmin", urlPatterns = {"/SearchAdmin"})
public class SearchAdmin extends HttpServlet {

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
                    + "                        <img class=\"card-img-top\" width=\"250px\" height=\"300px\" src=\"" + o.getImage() + "\" alt=\"Card image cap\">\n"
                    + "                        <div class=\"card-body\" style=\"text-align: center\">\n"
                    + "                            <h5 class=\"card-title\">" + o.getTitle() + "</h5>\n"
                    + "                            <a href=\"updateBook?id=" + o.getId() + "\" class=\"btn btn-success\">Update Book</a>\n"
                    + "                            <a href=\"Edit-Chapter?id=" + o.getId() + "\" class=\"btn btn-warning\">Edit Chapter</a>\n"
                    + "                            <a href=\"deleteBook?id=" + o.getId() + "\" class=\"btn btn-danger\" onclick=\"return confirm('Are you sure you want to remove?')\">Delete</a>\n"
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
