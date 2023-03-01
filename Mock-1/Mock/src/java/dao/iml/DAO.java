package dao.iml;

import context.DBContext;
import dao.IDao;
import entity.Book;
import entity.Chapter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DINHDAT
 */
public class DAO implements IDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static IDao instanceDao = new DAO();

    public static IDao getInstance() {
        return instanceDao;
    }

    @Override
    public List<Book> getAll() {
        String query = "SELECT * FROM Book";
        List<Book> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public List<Chapter> getChaptersByBookId(int bookId) {
        String query = "SELECT * FROM Chapter c JOIN BookChapter bc ON c.id = bc.chapter_id WHERE bc.book_id = ?";
        List<Chapter> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Chapter(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public Chapter getSingleChapter(String bookId) {
        String query = "SELECT * FROM Chapter c WHERE c.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Chapter(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public Book getProduct(int id) {
        String query = "SELECT * FROM Book b WHERE b.book_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));

                return b;
            }
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public void addBook(Book b) {
        String query = "INSERT INTO Book(book_title,author,brief,image,genre) "
                + "VALUES(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getBrief());
            ps.setString(4, b.getImage());
            ps.setString(5, b.getGenre());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public int delBook(String id) {
        String query = "DELETE Book WHERE book_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int updateBook(Book p) {
        String query = " UPDATE Book SET book_title=?,author=?, brief=?,\n"
                + "[image]=?, genre=? WHERE book_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getAuthor());
            ps.setString(3, p.getBrief());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getGenre());
            ps.setInt(6, p.getId());
            return ps.executeUpdate();
        } catch (Exception e) {

            System.out.println(e);
        }
        return 0;
    }

    @Override
    public void addChapter(Chapter b) {
        String query = "INSERT INTO Chapter(title,content) "
                + "VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getContent());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void addChaptertoBook(int book_id, int chapter_id) {
        String query = "INSERT INTO BookChapter(book_id,chapter_id)\n"
                + "VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            ps.setInt(2, chapter_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public Chapter getChapter(int id) {
        String query = " SELECT * FROM Chapter c WHERE c.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public int updateChapter(Chapter p) {
        String query = "UPDATE Chapter SET title =?, content =? WHERE id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getContent());
            ps.setInt(3, p.getId());
            return ps.executeUpdate();
        } catch (Exception e) {

            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int delChapter(String id) {
        String query = "DELETE Chapter WHERE id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int delChapterBook(String id) {
        String query = "DELETE [BookChapter] WHERE chapter_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int delChapterBookbyBook(String id) {
        String query = "DELETE [BookChapter] WHERE book_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            return ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public Chapter getlastchapter() {
        String query = " SELECT * FROM Chapter ORDER BY id desc ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public List<Book> searchByName(String txtSearch) {
        List<Book> list = new ArrayList<>();
        String query = "SELECT * FROM Book WHERE book_title like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
    }
}
