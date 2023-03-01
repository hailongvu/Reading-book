
package dao.iml;

import context.DBContext;
import dao.IUserDao;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DINHDAT
 */
public class UserDao extends DBContext implements IUserDao{
 private static IUserDao instanceDao = new UserDao();
    public static IUserDao getInstance() {
        return instanceDao;
    }
 @Override
 public User checkAdmin(String usern,String pass, boolean isAdm)  {
        User user = null;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * from [User] where [username]= ? and [password]= ? AND [isAdmin] = ?";
            con = getConnection();
            st = con.prepareStatement(sql);
            st.setString(1, usern);
            st.setString(2, pass);
            st.setBoolean(3, isAdm);
            rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4));
            }
        } catch (Exception ex) {
            try {
                throw ex;
            } catch (Exception ex1) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                closeConnection(con, st, rs);
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }


    /**
     *
     * @param username
     * @return userName is existed or not
     * @throws java.lang.Exception
     */
 @Override
    public boolean checkUsernameExist(String username)  {
        boolean result = false;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * from [User] where [username]= ?";
            con = getConnection();
            st = con.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            while (rs.next()) {
                //loop to each item of the result set
                result = true;
            }
        } catch (Exception ex) {
            try {
                throw ex;
            } catch (Exception ex1) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                closeConnection(con, st, rs);
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    /**
     *
     * @param u
     * @throws java.lang.Exception
     */
 @Override
    public void insertUser(User u) {
        Connection con = null;
        PreparedStatement st = null;
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[isAdmin])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            con = getConnection();
            st = con.prepareStatement(sql);
           
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setBoolean(3, u.isIsAdmin());
            st.executeUpdate();
        } catch (Exception ex) {
            try {
                throw ex;
            } catch (Exception ex1) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                closeConnection(con, st);
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
