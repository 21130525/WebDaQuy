package dao.adminDAO.orderAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminOrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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


    @Override
    public void filter(AdminOrderDetail obj) throws SQLException {
        String sql = "Select ... from order_details where created_at=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, "");
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {

        }

    }

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
        String sql = "Select id,status from orders where status='chờ xác nhân'";
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
        String sql = "Select id,status from orders where status='đang giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    //status_order_request đại dien cho trang thai cua don hang duoc gui tu client xuong
    //status_current dai dien cho trang thai hien tai cua don hang
    public boolean updateStatusOrder(int id, String status_order_request, String status_current) throws SQLException {
        String sql = "Update orders set status=? where status=? and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, status_order_request);
        pr.setString(2, status_current);
        pr.setInt(3, id);
        int rows = pr.executeUpdate();
        if (rows == 1) {
            return true;
        }
        return false;
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

    public static void main(String[] args) throws SQLException {
        System.out.println(OrderAdminDAO.getInstance().updateStatusOrder(2, "đang giao", "chờ giao"));
    }
}
