package dao.adminDAO.userAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminUsers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//truyền object rỗng để làm tham số và xử lí để tuân theo nguyên tắc kế thừa
public class UserAdminDAO extends AbsAdminDAO<AdminUsers> {
    public static UserAdminDAO getInstance() {
        return new UserAdminDAO();

    }

    @Override
    public ArrayList select(AdminUsers obj) throws SQLException {
        ArrayList<AdminUsers> adminUserslist = new ArrayList<>();
        String sql = "Select username,password,full_name,gender,birthday,email,phone,address,avatar,created_at,updated_at,role,status from users";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        AdminUsers adminUsers = null;
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            adminUsers = null;
            adminUserslist.add(adminUsers);
        }
        return adminUserslist;
    }

    @Override
    public void add(AdminUsers obj) {

    }

    @Override
    public void delete(AdminUsers obj) {

    }

    @Override
    public void filter(AdminUsers obj) {

    }

    @Override
    public void findbyCreatedat(AdminUsers obj) {

    }

    public ArrayList<AdminUsers> callSelect(AdminUsers obj) throws SQLException {
       ArrayList<AdminUsers> list= super.select(obj);
       return list;
    }

    @Override
    public void callAdd(AdminUsers obj) {

    }

    @Override
    public void callDelete(AdminUsers obj) {

    }

    @Override
    public void callFilter(AdminUsers obj) {

    }
}
