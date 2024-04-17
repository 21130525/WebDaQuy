package service.manageUser.registerAndLogin;

import dao.userDAO.UserDAO;
import model.User;

import java.sql.SQLException;

public class ChangePasswordService {
    public boolean updatePassword(String username, String newpassword) throws SQLException {
        UserDAO userDAO=UserDAO.getInstance();
        User u = userDAO.selectByUserName(username);
        u.setPassword(newpassword);
        if(userDAO.update(u)){
            return true;
        }else{
            return false;
        }
    }
}
