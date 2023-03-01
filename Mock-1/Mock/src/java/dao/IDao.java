
package dao;

import entity.Book;
import entity.Chapter;
import java.util.List;

/**
 *
 * @author DINHDAT
 */
public interface IDao {

    List<Book> getAll();

    List<Chapter> getChaptersByBookId(int bookId);

    Chapter getSingleChapter(String bookId);

    Book getProduct(int id);

    void addBook(Book b);

    int delBook(String id);

    int updateBook(Book p);

    void addChapter(Chapter b);

    void addChaptertoBook(int book_id, int chapter_id);

    Chapter getChapter(int id);

    int updateChapter(Chapter p);

    int delChapter(String id);

    int delChapterBook(String id);

    int delChapterBookbyBook(String id);

    Chapter getlastchapter();

    List<Book> searchByName(String txtSearch);
}
