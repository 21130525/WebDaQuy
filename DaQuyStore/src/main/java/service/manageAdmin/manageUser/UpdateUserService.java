package service.manageAdmin.manageUser;

import dao.adminDAO.userAdmin.UserAdminDAO;

import java.sql.SQLException;

public class UpdateUserService {
    public String updateRoleAdmin(int id) throws SQLException {
        UserAdminDAO userAdminDAO = UserAdminDAO.getInstance();
        if (userAdminDAO.updateRoleAdmin(id)) {
            return "Cap nhat thanh cong";
        }

        return null;
    }
}
