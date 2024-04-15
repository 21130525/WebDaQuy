package service.user;

import dao.UserDAO;
import model.User;
import service.EncryptAndDencrypt;

import java.sql.SQLException;
import java.util.ArrayList;

public class LoginService {
    public ArrayList<User> getAllUser(String typeLogin) throws SQLException {
        ArrayList<User> listuser= UserDAO.getInstance().selectAllByTypeLogin(typeLogin);
        return listuser;
    }
    public User checkLogin(String username, String password,String typeLogin) throws SQLException {
        EncryptAndDencrypt encryptAndDencrypt =new EncryptAndDencrypt();
        ArrayList<User> list = getAllUser(typeLogin);
        User user = null;
        for (User u : list) {
            if (u.getUserName().equals(username) && encryptAndDencrypt.decrypt(u.getPassword()).equals(password)) {
                return u;
            }
        }
        return null;
    }


}
