package dao.adminDAO.orderAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminOrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class OrderAdminDAO extends AbsAdminDAO<AdminOrderDetail> {
    public static OrderAdminDAO getInstance() {
        return new OrderAdminDAO();
    }

    @Override
    public ArrayList select(AdminOrderDetail obj) throws SQLException {

        return null;
    }

    @Override
    public void add(AdminOrderDetail obj) {

    }

    @Override
    public boolean deletebyID(AdminOrderDetail obj, int id) throws SQLException {
        String sql = "Update  orders set status_deleted='da xoa' where status_deleted='chua xoa' and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        int rows = pr.executeUpdate();
        if (rows >= 1) {
            return true;
        } else {
            return false;
        }
    }


//    @Override
//    public void filter(AdminOrderDetail obj) throws SQLException {
//        String sql = "Select ... from order_details where created_at=?";
//        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
//        pr.setString(1, "");
//        ResultSet rs = pr.executeQuery();
//        while (rs.next()) {
//
//        }
//
//    }

    public ArrayList findbyName(AdminOrderDetail obj, String input) throws SQLException {
        String sql = "Select quantity_total,total_price from order_details where name=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, input);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {

        }
        pr.close();
        rs.close();
        return null;
    }

    @Override
    public ArrayList<AdminOrderDetail> callSelect(AdminOrderDetail obj) throws SQLException {
        return null;
    }

    @Override
    public void callAdd(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public boolean callDelete(AdminOrderDetail obj, int id) throws SQLException {
        super.deletebyID(obj, id);
        return false;
    }

    @Override
    public void callFilter(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public ArrayList callSearch(AdminOrderDetail obj, String name) throws SQLException {
        return null;
    }


    public ArrayList<AdminOrderDetail> selectByStatusWaiting() throws SQLException {
        ArrayList<AdminOrderDetail> list = new ArrayList<>();
        //lấy tạm dữ liệu là đang giao
        String sql = "Select orders.id,products.product_name,orders.created_at,status from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where status='chờ xác nhận'  ";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail> selectByStatusGiving() throws SQLException {
        ArrayList<AdminOrderDetail> list = new ArrayList<>();
        String sql = "Select orders.id,products.product_name,orders.created_at,status from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where status='đang giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail> selectByStatusForWaitingGiving() throws SQLException {
        ArrayList<AdminOrderDetail> list = new ArrayList<>();
        String sql = "Select orders.id,products.product_name,orders.created_at,status from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where status='chờ giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail> selectByStatusGived() throws SQLException {
        ArrayList<AdminOrderDetail> list = new ArrayList<>();
        String sql = "Select orders.id,products.product_name,orders.created_at,status from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where status='đã giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail> selectByStatusCanceled() throws SQLException {
        ArrayList<AdminOrderDetail> list = new ArrayList<>();
        String sql = "Select orders.id,products.product_name,orders.created_at,status from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where status='hủy'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public void updateStatusOrder(int id, String selected_status) throws SQLException {
        String sql = "Update orders set status=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, selected_status);
        pr.setInt(2, id);
        pr.executeUpdate();

    }

    public String getCurrentStatusOrder(int id) throws SQLException {
        String sql = "Select status from orders where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        String status = "";
        while (rs.next()) {
            status = rs.getString("status");
        }
        return status;
    }

    /*
    thêm hàm ghi log cho chức năng xóa,truy vấn,cập nhật trạng thái
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

    public void addLogWarningForUpdate(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.WARNING.toString());
        ps.executeUpdate();
    }

    public int getMaxID() throws SQLException {
        String sql = "Select max(id) from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }

    public static void main(String[] args) throws SQLException {
    }
}
