package dao.adminDAO.categoryAdmin;

import connector.DAOConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryAdminDAO {
    public static CategoryAdminDAO getInstance() {
        return new CategoryAdminDAO();
    }

    public int getProductType(String product_type) throws SQLException {
        String sql = "Select id from categories where product_type=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, product_type);
        ResultSet rs = pr.executeQuery();
        int product_type_id = 0;
        while (rs.next()) {
            product_type_id = rs.getInt("id");
        }
        return product_type_id;
    }
}
