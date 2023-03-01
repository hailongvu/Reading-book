
package entity;

import java.util.HashMap;

/**
 *
 * @author DINHDAT
 */
public class BookCase extends HashMap {

    public BookCase() {
    }

    public void addBC(Book book) {
        this.put(book.getId(), book);
    }

    public boolean removeBC(String code) {
        if (this.containsKey(code)) {
            this.remove(code);
            return true;
        } else {
            return false;
        }
    }
}
