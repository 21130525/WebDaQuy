package dao.adminDAO.userAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminUsers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
        AdminUsers adminUsers;
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String username = rs.getString("username");
            String password = rs.getString("password");
            String full_name = rs.getString("full_name");
            String gender = rs.getString("gender");
            Date birthday = rs.getDate("birthday");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String avatar = rs.getString("avatar");
            Date created_at = rs.getDate("created_at");
            Date updated_at = rs.getDate("updated_at");
            String role = rs.getString("role");
            String status = rs.getNString("status");
            adminUsers = new AdminUsers(username, password, full_name, gender, birthday, email, phone, address, avatar, created_at, updated_at, role, status);
            adminUserslist.add(adminUsers);
        }
        pr.close();
        rs.close();
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

    public boolean updateRole(String username) throws SQLException {
        String sql="Update  users set role='Admin' where username=? and role='User'";
        PreparedStatement preparedStatement=DAOConnection.getConnection().prepareStatement(sql);
        preparedStatement.setString(1,username);
        int row_changed=preparedStatement.executeUpdate();
        if(row_changed>=1){
            return true;
        }
        return false;
    }
    public boolean updateStatusBlocked(String username) throws SQLException{
        String sql="Update  users set status='blocked' where username=? and status='active' ";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,username);
        int row_changed= pr.executeUpdate();
        if(row_changed>=1){
            return true;
        }
        return false;
    }
    public boolean updateStatusActive(String username) throws SQLException {
        String sql="Update users set status='active' where username=? and status='blocked'";
        PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,username);
        int row_changed=pr.executeUpdate();
        if(row_changed>=1){
            return true;
        }
        return false;
    }
    @Override
    public void findbyName(AdminUsers obj, String name) {

    }

    public ArrayList<AdminUsers> callSelect(AdminUsers obj) throws SQLException {
        ArrayList<AdminUsers> list = super.select(obj);
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
