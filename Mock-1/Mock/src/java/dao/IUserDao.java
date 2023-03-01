
package dao;

import entity.User;

/**
 *
 * @author DINHDAT
 */
public interface IUserDao {

    User checkAdmin(String usern, String pass, boolean isAdm);

    boolean checkUsernameExist(String username);

    void insertUser(User u);
}
