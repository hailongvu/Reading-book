
package bean;
import java.io.Serializable;
import java.util.List;
/**
 *
 * @author DINHDAT
 */
public class BookBean implements Serializable{
    private int id;
    private String title;
    private String author;
    private String brief;
    private String image;
    private String genre;
    private List<ChapterBean> listChapters;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public List<ChapterBean> getListChapters() {
        return listChapters;
    }

    public void setListChapters(List<ChapterBean> listChapters) {
        this.listChapters = listChapters;
    }

    public BookBean(String title, String author, String brief, String image, String genre) {
        this.title = title;
        this.author = author;
        this.brief = brief;
        this.image = image;
        this.genre = genre;
    }
    public BookBean() {
    }
    
}
