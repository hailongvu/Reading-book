
package service.impl;

import bean.BookBean;
import bean.ChapterBean;
import dao.IDao;
import dao.iml.DAO;
import entity.Book;
import entity.Chapter;
import java.util.ArrayList;
import java.util.List;
import service.IDaoService;

/**
 *
 * @author DINHDAT
 */
public class DaoService implements IDaoService {

    private IDao dao = DAO.getInstance();
    private static IDaoService instanceService = new DaoService();

    public static IDaoService getInstance() {
        return instanceService;
    }

    @Override
    public List<Book> getAll() {
        return dao.getAll();
    }

    @Override
    public List<Chapter> getChaptersByBookId(int bookId) {
        return dao.getChaptersByBookId(bookId);
    }

    @Override
    public Chapter getSingleChapter(String bookId) {
        return dao.getSingleChapter(bookId);

    }

    @Override
    public Book getProduct(int id) {
        return dao.getProduct(id);
    }

    @Override
    public void addBook(Book b) {
        dao.addBook(b);
    }

    @Override
    public int delBook(String id) {
        return dao.delBook(id);
    }

    @Override
    public int updateBook(Book p) {
        return dao.updateBook(p);
    }

    @Override
    public void addChapter(Chapter b) {
        dao.addChapter(b);
    }

    @Override
    public void addChaptertoBook(int book_id, int chapter_id) {
        dao.addChaptertoBook(book_id, chapter_id);
    }

    @Override
    public List<Book> searchByName(String txtSearch) {
        return dao.searchByName(txtSearch);
    }

    @Override
    public Chapter getChapter(int id) {
        return dao.getChapter(id);

    }

    @Override
    public int updateChapter(Chapter p) {
        return dao.updateChapter(p);
    }

    @Override
    public int delChapter(String id) {
        return dao.delChapter(id);
    }

    @Override
    public int delChapterBook(String id) {
        return dao.delChapterBook(id);
    }

    @Override
    public int delChapterBookbyBook(String id) {
        return dao.delChapterBookbyBook(id);
    }

    @Override
    public Chapter getlastchapter() {
        return dao.getlastchapter();
    }

    @Override
    public List<BookBean> getAll1(List<Book> books) {
        // BookBean bean = new BookBean();
        List<BookBean> bookBean = new ArrayList<>();
        for (Book b : books) {
            BookBean bean = new BookBean();
            bean.setId(b.getId());
            bean.setImage(b.getImage());
            bean.setTitle(b.getTitle());
            bookBean.add(bean);
        }
        return bookBean;
    }

    @Override
    public List<ChapterBean> getChaptersByBookIdBean(List<Chapter> chaps) {
        List<ChapterBean> chapBean = new ArrayList<>();
        for (Chapter c : chaps) {
            ChapterBean bean = new ChapterBean();
            bean.setId(c.getId());
            bean.setContent(c.getContent());
            bean.setTitle(c.getTitle());
            chapBean.add(bean);
        }
        return chapBean;
    }

    @Override
    public ChapterBean getSingleChapterBean(Chapter chap) {
        ChapterBean bean = new ChapterBean();
        bean.setId(chap.getId());
        bean.setTitle(chap.getTitle());
        bean.setContent(chap.getContent());
        return bean;
    }

    @Override
    public BookBean getProductBean(Book book) {
        BookBean bean = new BookBean();
        bean.setId(book.getId());
        bean.setAuthor(book.getAuthor());
        bean.setImage(book.getImage());
        bean.setTitle(book.getTitle());
        bean.setBrief(book.getBrief());
        bean.setGenre(book.getGenre());
        return bean;
    }

    @Override
    public ChapterBean getChapterBean(Chapter chap) {
        ChapterBean bean = new ChapterBean();
        bean.setId(chap.getId());
        bean.setContent(chap.getContent());
        bean.setTitle(chap.getTitle());
        return bean;
    }

    @Override
    public ChapterBean getlastchapterBean(Chapter chap) {
        ChapterBean bean = new ChapterBean();
        bean.setId(chap.getId());
        bean.setContent(chap.getContent());
        bean.setTitle(chap.getTitle());
        return null;
    }

    @Override
    public List<BookBean> searchByNameBean(List<Book> book) {
        List<BookBean> bookBean = new ArrayList<>();
        for (Book b : book) {
            BookBean bean = new BookBean();
            bean.setId(b.getId());
            bean.setImage(b.getImage());
            bean.setTitle(b.getTitle());
            bookBean.add(bean);
        }
        return bookBean;
    }
}
