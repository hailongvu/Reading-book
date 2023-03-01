
package service.impl;

import bean.UserBean;
import dao.IUserDao;
import dao.iml.UserDao;
import entity.User;
import service.IUserService;

/**
 *
 * @author DINHDAT
 */
public class UserService implements IUserService {

    private IUserDao userdao = UserDao.getInstance();

    private static IUserService instanceService = new UserService();

    public static IUserService getInstance() {
        return instanceService;
    }

    @Override
    public User checkAdmin(String usern, String pass, boolean isAdm) {
        return userdao.checkAdmin(usern, pass, isAdm);

    }

    @Override
    public boolean checkUsernameExist(String username) {
        return userdao.checkUsernameExist(username);
    }

    @Override
    public void insertUser(User u) {
        userdao.insertUser(u);
    }

    @Override
    public UserBean checkAdminBean(User user) {
         UserBean bean = new UserBean();
        bean.setId(user.getId());
        bean.setUsername(user.getUsername());
        bean.setPassword(user.getPassword());
        bean.setIsAdmin(user.isIsAdmin());
        return bean;
    }
 
}
