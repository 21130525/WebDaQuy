package dao.adminDAO.inventoryAdmin;

import connector.DAOConnection;
import model.modelAdmin.AdminInventoryDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryAdminDAO {
    public static InventoryAdminDAO getInstance() {
        return new InventoryAdminDAO();
    }

    public List<AdminInventoryDetail> getListInventoryDetail() throws SQLException {
        List<AdminInventoryDetail> list = new ArrayList<>();
        String sql = "select inventory_detail.id,inventory_detail.quantity,inventory_detail.price,products.product_name,inventories.date FROM products join inventory_detail on products.id=inventory_detail.product_id join inventories on inventory_detail.id=inventories.id";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminInventoryDetail adminInventoryDetail = null;
        while (rs.next()) {
            adminInventoryDetail = new AdminInventoryDetail();
            adminInventoryDetail.setId(rs.getInt("inventory_detail.id"));
            adminInventoryDetail.setQuantity(rs.getInt("inventory_detail.quantity"));
            adminInventoryDetail.setPrice(rs.getFloat("inventory_detail.price"));
            adminInventoryDetail.setName(rs.getString("products.product_name"));
            adminInventoryDetail.setDate(rs.getDate("inventories.date"));
            list.add(adminInventoryDetail);
        }
        return list;
    }

    public boolean deleteInventory(int id) throws SQLException {
        String sql = "Update inventory_detail set status_deleted='đã xóa' where id=? and status_deleted='chưa xóa'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        int rows = pr.executeUpdate();
        if (rows == 1) {
            return true;
        } else {
            return false;
        }
    }


    //xử lí số lượng còn lại sau khi mua hàng
    public int getListInventoryRemain() throws SQLException {
        String sql="Select remaining,product_name from products join inventory_detail on products.id=inventory_detail.product_id group by product_name";
        PreparedStatement preparedStatement=DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs= preparedStatement.executeQuery();
        int rows_affected=0;
        while(rs.next()){
            rows_affected++;
        }
        return rows_affected;
    }
    public static void main(String[] args) throws SQLException {
//        List<AdminInventoryDetail> list = InventoryAdminDAO.getInstance().getListInventoryDetail();
//        for (AdminInventoryDetail adminInventoryDetail : list) {
//            System.out.println(adminInventoryDetail);
//        }
        InventoryAdminDAO inventoryAdminDAO=new InventoryAdminDAO();
        System.out.println(inventoryAdminDAO.getListInventoryRemain());
    }
}
