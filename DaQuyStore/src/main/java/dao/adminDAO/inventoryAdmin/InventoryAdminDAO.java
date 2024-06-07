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


    //xử lí số lượng còn lại sau khi mua hàng
    public int getInventoryRemain() throws SQLException {
        String sql="Select remaining,product_name from products join inventory_detail on products.id=inventory_detail.product_id group by product_name";
        PreparedStatement preparedStatement=DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs= preparedStatement.executeQuery();
        int rows_affected=0;
        while(rs.next()){
            rows_affected++;
        }
        return rows_affected;
    }
    /*
    hàm này dùng để lấy lên số lượng của sản phẩm
     */
    public ArrayList<AdminInventoryDetail> getListInventoryDetail() throws SQLException {
        ArrayList<AdminInventoryDetail> detailArrayList=new ArrayList<>();
        String sql="select products.id,products.product_name,sum(inventory_detail.remaining) as total_quantity,products.status from products join inventory_detail on products.id=inventory_detail.product_id group by inventory_detail.product_id";
        PreparedStatement preparedStatement=DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs= preparedStatement.executeQuery();
        while(rs.next()){
            AdminInventoryDetail admindetail=new AdminInventoryDetail();
            admindetail.setProduct_id(rs.getInt("products.id"));
            admindetail.setProduct_name(rs.getString("products.product_name"));
            admindetail.setTotal_quantity(rs.getInt("total_quantity"));
            admindetail.setStatus(rs.getString("products.status"));
            detailArrayList.add(admindetail);
        }
        return detailArrayList;
    }
    public static void main(String[] args) throws SQLException {
            InventoryAdminDAO inventoryAdminDAO=new InventoryAdminDAO();
            System.out.println(inventoryAdminDAO.getListInventoryDetail());
            System.out.println("Thêm dữ liệu thành công");
    }
}
