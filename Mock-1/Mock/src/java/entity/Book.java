package entity;

import java.util.List;

/**
 *
 * @author hailo
 */
public class Book {

    private int id;
    private String title;
    private String author;
    private String brief;
    private String image;
    private String genre;
    private List<Chapter> listChapters;
    

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

    public List<Chapter> getListChapters() {
        return listChapters;
    }

    public void setListChapters(List<Chapter> listChapters) {
        this.listChapters = listChapters;
    }

    public Book(int id, String title, String image) {
        this.id = id;
        this.title = title;
        this.image = image;
    }

    public Book(int id, String title, String author, String brief, String image, String genre, List<Chapter> listChapters) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.brief = brief;
        this.image = image;
        this.genre = genre;
        this.listChapters = listChapters;
    }

    public Book(int id, String title, String author, String brief, String image, String genre) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.brief = brief;
        this.image = image;
        this.genre = genre;
    }

    public Book(String title, String author, String brief, String image, String genre) {
        this.title = title;
        this.author = author;
        this.brief = brief;
        this.image = image;
        this.genre = genre;

    }

    public Book() {
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", title=" + title + ", author=" + author + ", brief=" + brief + ", image=" + image + ", genre=" + genre + ", listChapters=" + listChapters + '}';
    }

}
