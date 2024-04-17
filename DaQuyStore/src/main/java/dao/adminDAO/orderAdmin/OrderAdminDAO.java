package dao.adminDAO.orderAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminOrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderAdminDAO extends AbsAdminDAO<AdminOrderDetail> {
    @Override
    public ArrayList select(AdminOrderDetail obj) throws SQLException {

        return null;
    }

    @Override
    public void add(AdminOrderDetail obj) {

    }

    @Override
    public void delete(AdminOrderDetail obj) throws SQLException {
        String sql="Delete from order_details where name=?";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,"");
        pr.executeUpdate();
    }

    @Override
    public void filter(AdminOrderDetail obj) throws SQLException {
        String sql="Select ... from order_details where created_at=?";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,"");
        ResultSet rs= pr.executeQuery();
        while(rs.next()){

        }

    }

    @Override
    public void findbyName(AdminOrderDetail obj,String input) throws SQLException {
        String sql="Select quantity_total,total_price from order_details where name=?";
        PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,input);
        ResultSet rs=pr.executeQuery();
        while(rs.next()){

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
    public void callDelete(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public void callFilter(AdminOrderDetail obj) throws SQLException {

    }
}
