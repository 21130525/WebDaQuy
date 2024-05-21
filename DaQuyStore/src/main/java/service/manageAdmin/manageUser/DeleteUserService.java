package service.manageAdmin.manageUser;

import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUsers;

import java.sql.SQLException;

public class DeleteUserService {
    public String deleteUser(int id) throws SQLException {
        AdminUsers adminUsers = new AdminUsers();
        UserAdminDAO userAdminDAO = UserAdminDAO.getInstance();
        if (userAdminDAO.callDelete(adminUsers, id)) {
            return "Xoa thanh cong";
        }
        return null;
    }

}
