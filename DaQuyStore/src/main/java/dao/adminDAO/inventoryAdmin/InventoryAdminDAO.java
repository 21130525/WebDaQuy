package dao.adminDAO.inventoryAdmin;

import connector.DAOConnection;
import model.modelAdmin.AdminInventoryDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryAdminDAO {
    public static  InventoryAdminDAO getInstance() {
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

    public static void main(String[] args) throws SQLException {
        List<AdminInventoryDetail> list=InventoryAdminDAO.getInstance().getListInventoryDetail();
        for(AdminInventoryDetail adminInventoryDetail:list){
            System.out.println(adminInventoryDetail);
        }
    }
}
