package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements DAOInterface<User> {

    public static UserDAO getInstance() {
        return new UserDAO();
    }

    @Override
    public boolean insert(User user) throws SQLException {
        Connection con = DAOConnection.getConnection();
        String sql = "insert into users(username,password,full_name,email,phone,avatar,status,role,address,birthday,type_login,gender) values "
                +"(?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, user.getUserName());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getFullName());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getPhone());
        ps.setString(6, user.getAvatar());
        ps.setString(7, user.getStatus());
        ps.setString(8, user.getRole());
        ps.setString(9, user.getAddress());
        ps.setDate(10, user.getBirthday());
        ps.setString(11, user.getType_login());
        ps.setString(12, user.getGender());

        int res = ps.executeUpdate();
        ps.close();
        con.close();
        return res>=1;
    }

    @Override
    public boolean update(User user) {
        try {
            Connection con = DAOConnection.getConnection();
            String sql = "update users u set " +
                    "u.username=?, u.password=?,u.full_name=?, u.email=?,u.phone=?,u.avatar=?, " +
                    "u.updated_at=CURRENT_TIMESTAMP, u.status=? ,u.role=?,u.address=?, u.birthday=?," +
                    "u.type_login=?,u.gender =?  where u.id=?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getStatus());
            ps.setString(8, user.getRole());
            ps.setString(9, user.getAddress());
            ps.setDate(10, user.getBirthday());
            ps.setString(11, user.getType_login());
            ps.setString(12, user.getGender());
            ps.setString(13, user.getId());

            int res = ps.executeUpdate();
            ps.close();
            con.close();
            return res>=1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    @Override
    public User selectById(String id) throws SQLException {
        String sql = " select * from users where id = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, id);
        ResultSet rs = pst.executeQuery();
        User user = null;
        if (rs.next()) {
            user = new User(rs.getString("id"), rs.getString("username"), rs.getString("password"),
                    rs.getString("full_name"),rs.getString("gender"),
                    rs.getString("email"), rs.getString("phone"), rs.getString("avatar"),
                    rs.getDate("created_at"), rs.getDate("updated_at"), rs.getDate("deleted_at"),
                    rs.getString("status"), rs.getString("role"), rs.getString("address"), rs.getDate("birthday"),
                    rs.getString("type_login"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return user;
    }
    public User selectByUserName(String name) throws SQLException {
        String sql = " select * from users where username = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, name);
        ResultSet rs = pst.executeQuery();
        User user = null;
        if (rs.next()) {
            user = new User(rs.getString("id"), rs.getString("username"), rs.getString("password"),
                    rs.getString("full_name"),rs.getString("gender"),
                    rs.getString("email"), rs.getString("phone"), rs.getString("avatar"),
                    rs.getDate("created_at"), rs.getDate("updated_at"), rs.getDate("deleted_at"),
                    rs.getString("status"), rs.getString("role"), rs.getString("address"), rs.getDate("birthday"),
                    rs.getString("type_login"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return user;
    }
    @Override
    public ArrayList<User> selectAll() throws SQLException {
        String sql = " select * from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<User> users = new ArrayList<>();
        while (rs.next()) {
            User user = new User(rs.getString("id"), rs.getString("username"), rs.getString("password"),
                    rs.getString("full_name"),rs.getString("gender"), rs.getString("email"), rs.getString("phone"),
                    rs.getString("avatar"), rs.getDate("created_at"), rs.getDate("updated_at"),
                    rs.getDate("deleted_at"), rs.getString("status"), rs.getString("role"),
                    rs.getString("address"), rs.getDate("birthday"), rs.getString("type_login"));
            users.add(user);
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return users;
    }


    public String getEmailforLogin(String username) {
        return null;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new UserDAO().selectAll().toString());
    }


//TODO
    public List<String> getListEmail() throws SQLException {
        String sql = " select email  from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<String> emails = new ArrayList<>();
        while (rs.next()) {
            emails.add(rs.getString("email"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return emails;
    }
//TODO
    public List<String> getListUserName() throws SQLException {
        String sql = " select username  from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<String> users = new ArrayList<>();
        while (rs.next()) {
            users.add(rs.getString("username"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return users;
    }
}
