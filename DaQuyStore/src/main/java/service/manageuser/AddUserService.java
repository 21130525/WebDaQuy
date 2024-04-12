package service.manageuser;

import com.google.gson.Gson;
import dao.adminDAO.AbsAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUsers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

//truyền kiểu dữ liệu cho Generic và 1 object rỗng để xử lí logic
public class AddUserService  extends HttpServlet {
    public void add(HttpServletRequest request) throws SQLException {
        AbsAdminDAO<AdminUsers> usersAbsAdminDAO=UserAdminDAO.getInstance();
        AdminUsers adminUsers=new AdminUsers();
        usersAbsAdminDAO.callSelect(adminUsers);
        Gson gson=new Gson();

    }
}
