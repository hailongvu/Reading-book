
package service;

import bean.BookBean;
import bean.ChapterBean;
import entity.Book;
import entity.Chapter;
import java.util.List;

/**
 *
 * @author DINHDAT
 */
public interface IDaoService {

    List<Book> getAll();

    List<BookBean> getAll1(List<Book> books);

    List<Chapter> getChaptersByBookId(int bookId);

    List<ChapterBean> getChaptersByBookIdBean(List<Chapter> chaps);

    Chapter getSingleChapter(String bookId);

    ChapterBean getSingleChapterBean(Chapter chap);

    Book getProduct(int id);

    BookBean getProductBean(Book book);

    void addBook(Book b);

    int delBook(String id);

    int updateBook(Book p);

    void addChapter(Chapter b);

    void addChaptertoBook(int book_id, int chapter_id);

    Chapter getChapter(int id);

    ChapterBean getChapterBean(Chapter chap);

    int updateChapter(Chapter p);

    int delChapter(String id);

    int delChapterBook(String id);

    int delChapterBookbyBook(String id);

    Chapter getlastchapter();

    ChapterBean getlastchapterBean(Chapter chap);

    List<Book> searchByName(String txtSearch);

    List<BookBean> searchByNameBean(List<Book> book);
}
