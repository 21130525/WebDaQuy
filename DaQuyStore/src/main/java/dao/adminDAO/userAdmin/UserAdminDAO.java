package dao.adminDAO.userAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminUsers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

//truyền object rỗng để làm tham số và xử lí để tuân theo nguyên tắc kế thừa
public class UserAdminDAO extends AbsAdminDAO<AdminUsers> {
    public static UserAdminDAO getInstance() {
        return new UserAdminDAO();

    }

    //ghi log cho chức năng xóa người dùng
    public void addLogDangerForDelete(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.DANGER.toString());
        ps.executeUpdate();
    }

    //ghi log cho chức năng cập nhật quyền
    public void addLogDangerForUpdateRole(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.DANGER.toString());
        ps.executeUpdate();
    }
    //ghi log cho chức năng truy vấn dữ liệu
    public void addLogInformForSelect(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.DANGER.toString());
        ps.executeUpdate();
    }
    @Override
    public ArrayList select(AdminUsers obj) throws SQLException {
        ArrayList<AdminUsers> adminUserslist = new ArrayList<>();
        String sql = "Select id, username,password,full_name,gender,birthday,email,phone,address,avatar,created_at,updated_at,role,status from users where status='chua xoa'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        AdminUsers adminUsers;
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
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
            adminUsers = new AdminUsers(id, username, password, full_name, gender, birthday, email, phone, address, avatar, created_at, updated_at, role, status);
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
    public boolean deletebyID(AdminUsers obj, int id) throws SQLException {
        String sql = "Update users set status='da xoa' where status='chua xoa' and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        int rows = pr.executeUpdate();
        if (rows >= 1) {
            return true;
        }
        return false;
    }


    @Override
    public void filter(AdminUsers obj) {

    }


    public ArrayList findbyName(AdminUsers obj, String username) throws SQLException {
        ArrayList<AdminUsers> adminUserslist = new ArrayList<>();
        String sql = "Select id, username,password,full_name,gender,birthday,email,phone,address,avatar,created_at,updated_at,role,status from users where username=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, username);
        AdminUsers adminUsers;
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String usernameaccount = rs.getString("username");
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
            adminUsers = new AdminUsers(id, usernameaccount, password, full_name, gender, birthday, email, phone, address, avatar, created_at, updated_at, role, status);
            adminUserslist.add(adminUsers);
        }
        pr.close();
        rs.close();
        return adminUserslist;
    }

    public ArrayList<AdminUsers> callSelect(AdminUsers obj) throws SQLException {
        ArrayList<AdminUsers> list = super.select(obj);
        return list;
    }

    @Override
    public void callAdd(AdminUsers obj) {

    }

    @Override
    public boolean callDelete(AdminUsers obj, int id) throws SQLException {
        super.deletebyID(obj, id);
        return false;
    }

    @Override
    public void callFilter(AdminUsers obj) {

    }

    @Override
    public ArrayList callSearch(AdminUsers obj, String name) throws SQLException {
        return null;
    }

    //đổi tên hàm thành updaterole cho chức năng cập nhật quyền của tài khoản người
    public boolean updateRole(int id, String selected_role) throws SQLException {
        String sql = "Update users set role=? where  id=?";

        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, selected_role);
        pr.setInt(2, id);
        int rows = pr.executeUpdate();
        if (rows >= 1) {
            return true;
        }
        return false;
    }

    public int getMaxID() throws SQLException {
        String sql = "select max(id) from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int index = 0;
        while (rs.next()) {
            index = rs.getInt("id");
        }
        return index;
    }

    public static void main(String[] args) throws SQLException {
        AdminUsers adminUsers = new AdminUsers();
        try {
            System.out.println(UserAdminDAO.getInstance().select(adminUsers));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
