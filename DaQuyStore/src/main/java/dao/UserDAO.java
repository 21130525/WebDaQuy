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

    public static void main(String[] args) throws SQLException {
//        User u = new User("un01", "111", "@","nam","le tam","","","vietnam","coutomer");
//        new UserDAO().insert(u);
        System.out.println(new UserDAO().getListUserName());
        System.out.println(new UserDAO().selectAll().toString());
    }

    @Override
    public boolean insert(User user) throws SQLException {
        Connection con = DAOConnection.getConnection();
        String sql = "insert into users(username,password,full_name,gender,birthday, email,phone,address,avatar,role,status,type_login) " +
                "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, user.getUserName());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getFullName());
        ps.setString(4, user.getGender());
        ps.setDate(5, user.getBirthday());
        ps.setString(6, user.getEmail());
        ps.setString(7, user.getPhone());
        ps.setString(8, user.getAddress());
        ps.setString(9, user.getAvatar());
        ps.setString(10, user.getRole());
        ps.setString(11, user.getStatus());
        ps.setString(12, user.getType_login());

        int res = ps.executeUpdate();
        ps.close();
        con.close();
        return res >= 1;
    }

    @Override
    public boolean update(User user) {
        try {
            Connection con = DAOConnection.getConnection();
            String sql = "update users u set " +
                "u.username=?, u.password=?,u.full_name=?, u.gender =?,u.birthday=?,u.email=?,u.phone=?,u.address=?," +
                "u.avatar=?, u.updated_at=CURRENT_TIMESTAMP,u.role=?, u.status=? ,u.type_login=?  " +
                "where u.id=?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getBirthday());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhone());
            ps.setString(8, user.getAddress());
            ps.setString(9, user.getAvatar());
            ps.setString(10, user.getRole());
            ps.setString(11, user.getStatus());
            ps.setString(12, user.getType_login());
            ps.setString(13, user.getId());

            int res = ps.executeUpdate();
            ps.close();
            con.close();
            return res >= 1;
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
                    rs.getString("full_name"), rs.getString("gender"),
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
                    rs.getString("full_name"), rs.getString("gender"),
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
                    rs.getString("full_name"), rs.getString("gender"), rs.getString("email"), rs.getString("phone"),
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
