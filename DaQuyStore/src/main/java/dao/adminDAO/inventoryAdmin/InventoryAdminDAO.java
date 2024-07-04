package dao.adminDAO.inventoryAdmin;

import connector.DAOConnection;
import model.LogLevel;
import model.modelAdmin.AdminInventoryDetail_fixed;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class InventoryAdminDAO {
    public static InventoryAdminDAO getInstance() {
        return new InventoryAdminDAO();
    }

    public boolean deleteInventory(String productname) throws SQLException {
        String sql = "Update inventory_detail set status_deleted='đã xóa' where productname=? and status_deleted='chưa xóa'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, productname);
        int rows = pr.executeUpdate();
        if (rows == 1) {
            return true;
        } else {
            return false;
        }
    }

    /*
    hàm thêm log cho chức năng truy vấn hiển thị số lượng
     */
    public void addLogInformForSelect(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.INFORM.toString());
        ps.executeUpdate();
    }

    //xử lí số lượng còn lại sau khi mua hàng
    public int getInventoryRemain() throws SQLException {
        String sql = "Select remaining,product_name from products join inventory_detail on products.id=inventory_detail.product_id group by product_name";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected++;
        }
        return rows_affected;
    }

    /*
    hàm này dùng để lấy lên số lượng của sản phẩm
     */
    public ArrayList<AdminInventoryDetail_fixed> getListInventoryDetail() throws SQLException {
        ArrayList<AdminInventoryDetail_fixed> detailArrayList = new ArrayList<>();
        String sql = "select products.id,products.product_name,sum(inventory_detail.remaining) as total_quantity,products.status from products join inventory_detail on products.id=inventory_detail.product_id group by inventory_detail.product_id";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            AdminInventoryDetail_fixed admindetail = new AdminInventoryDetail_fixed();
            admindetail.setProduct_id(rs.getInt("products.id"));
            admindetail.setProduct_name(rs.getString("products.product_name"));
            admindetail.setTotal_quantity(rs.getInt("total_quantity"));
            admindetail.setStatus(rs.getString("products.status"));
            detailArrayList.add(admindetail);
        }
        return detailArrayList;
    }

    public int getMaxID() throws SQLException {
        String sql = "select max(id)  from log";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }
    public int getProduct_ID(String productname) throws SQLException {
        String sql = "select id from products where product_name=?";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        preparedStatement.setString(1, productname);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("id");
        }
        return rows_affected;
    }
    public void insertInventoryDetail(AdminProduct adminProduct) throws SQLException{
        String sql="Insert into inventory_detail(id,product_id,quantity,remaining) values(?,?,?,?)";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        preparedStatement.setInt(1, getMaxID()+1);
        preparedStatement.setInt(2, adminProduct.getProduct_id());
        preparedStatement.setInt(3,adminProduct.getQuantity());
        preparedStatement.setInt(4,adminProduct.getQuantity());
        preparedStatement.executeUpdate();
    }
    public void insertInventory() throws SQLException{
        String sql="Insert into inventory values(?,?,?)";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, getMaxID()+1);
        pr.setTimestamp(2,new Timestamp(new Date().getTime()));
        pr.setString(3,"ADMIN");
        pr.executeUpdate();
    }
    public static void main(String[] args) throws SQLException {
        InventoryAdminDAO inventoryAdminDAO = new InventoryAdminDAO();
        System.out.println(inventoryAdminDAO.getListInventoryDetail());
        System.out.println(inventoryAdminDAO.getMaxID());
        System.out.println("Thêm dữ liệu thành công");
    }
}
