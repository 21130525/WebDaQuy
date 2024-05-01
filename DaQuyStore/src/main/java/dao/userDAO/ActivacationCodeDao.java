package dao.userDAO;

import connector.DAOConnection;
import model.ActivacationCode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ActivacationCodeDao implements IDAO<ActivacationCode> {
    private String code;
    private String username;
    private String password;
    private String email;
    @Override
    public boolean insert(ActivacationCode activacationCode) throws SQLException {
        Connection con = DAOConnection.getConnection();
        String sql = "insert into activacation_code(activationCode,username,password,email) " +
                "values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, activacationCode.getActivationCode());
        ps.setString(2, activacationCode.getUsername());
        ps.setString(3, activacationCode.getPassword());
        ps.setString(4, activacationCode.getEmail());

        int res = ps.executeUpdate();
        ps.close();
        con.close();
        return res >= 1;
    }

    @Override
    public boolean update(ActivacationCode activacationCode) throws SQLException {
        return false;
    }

    @Override
    public int delete(String id) throws SQLException {
        return 0;
    }

    @Override
    public ActivacationCode selectById(String id) throws SQLException {
        String sql = " select * from activacation_code where activationCode = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, id);
        ResultSet rs = pst.executeQuery();
        ActivacationCode ac = null;
        if (rs.next()) {
            code = rs.getString("activationCode");
            username = rs.getString("username");
            password = rs.getString("password");
            email = rs.getString("email");

        }
        ac = new ActivacationCode(code, username, password, email);
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return ac;
    }

    @Override
    public ActivacationCode selectByName(String id) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<ActivacationCode> selectAll() throws SQLException {
        return null;
    }
}
