
package service;

import bean.UserBean;
import entity.User;

/**
 *
 * @author DINHDAT
 */
public interface IUserService {

    User checkAdmin(String usern, String pass, boolean isAdm);

    UserBean checkAdminBean(User user);

    boolean checkUsernameExist(String username);

    void insertUser(User u);

}
