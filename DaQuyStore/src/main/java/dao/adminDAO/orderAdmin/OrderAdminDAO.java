package dao.adminDAO.orderAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminOrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderAdminDAO extends AbsAdminDAO<AdminOrderDetail> {
    public static OrderAdminDAO getInstance(){
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
        String sql = "Update  order_details set status_deleted='da xoa' where status_deleted='chua xoa' and id=?";
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

    @Override
    public void findbyName(AdminOrderDetail obj, String input) throws SQLException {
        String sql = "Select quantity_total,total_price from order_details where name=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, input);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {

        }
        pr.close();
        rs.close();
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
        String sql = "Select id,status from orders where status='waiting'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail = new AdminOrderDetail(rs.getInt("id"), rs.getString("status"));
            list.add(adminOrderDetail);
        }
        return list;
    }

}
