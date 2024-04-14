package service.manageuser;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dao.adminDAO.AbsAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUsers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class GetUserService extends HttpServlet {
    public void getUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        AbsAdminDAO<AdminUsers> usersAbsAdminDAO= UserAdminDAO.getInstance();
        AdminUsers adminUsers=new AdminUsers();
        try {
            Gson gson=new Gson();
            String jsonElements=gson.toJson(usersAbsAdminDAO.callSelect(adminUsers));
            JsonArray jsonArray=gson.fromJson(jsonElements, JsonArray.class);
            response.getWriter().println(jsonArray);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
