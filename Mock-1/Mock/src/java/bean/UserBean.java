
package bean;

import java.io.Serializable;

/**
 *
 * @author DINHDAT
 */
public class UserBean implements Serializable{
    private int id;
    private String username;
    private String password;
    private boolean isAdmin;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "UserBean{" + "id=" + id + ", username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }
    
}
