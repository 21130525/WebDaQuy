package service;

import dao.UserDAO;
import model.User;

import java.sql.SQLException;
import java.util.ArrayList;

public class LoginService {
    public ArrayList<User> getAllUser() throws SQLException {
        ArrayList<User> listuser= UserDAO.getInstance().selectAll();
        return listuser;
    }
    public String getEmail(String username) throws SQLException {
        String email= UserDAO.getInstance().getEmailforLogin(username);
        return email;
    }
}
