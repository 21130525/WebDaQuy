package service.manageUser.registerAndLogin;

import dao.userDAO.UserDAO;
import model.User;
import service.manageUser.security.EncryptAndDencrypt;

import java.sql.SQLException;
import java.util.ArrayList;

public class LoginService {

    public User login(String username, String password,String typeLogin) throws SQLException {
        EncryptAndDencrypt encryptAndDencrypt =new EncryptAndDencrypt();
        UserDAO userDAO =  UserDAO.getInstance();
        User u = userDAO.selectByName(username);
        if (encryptAndDencrypt.decrypt(u.getPassword()).equals(password)) {
            return u;
        }
        return null;
    }
}