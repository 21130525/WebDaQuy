package dao.adminDAO.imageAdmin;

import connector.DAOConnection;
import model.modelAdmin.AdminImage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageAdminDAO {
    public void insertImage(AdminImage image) throws SQLException {
        String sql="Insert into image value(?,?,?,?)";
        PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
        pr.executeUpdate();
        pr.close();
    }
    public int getMaxID() throws SQLException {
        String sql="Select max(id) from image";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs=pr.executeQuery();
        int max=0;
        while(rs.next()){
            max=rs.getInt("id");
        }
        pr.close();
        rs.close();
        return max;

    }
}
