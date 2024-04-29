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
    public boolean deletebyID(AdminOrderDetail obj,int id) throws SQLException {
        String sql="Delete from order_details where name=?";
        PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,"");
       int rows= pr.executeUpdate();
        if(rows>=1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public void delete(AdminOrderDetail obj) {

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
    public boolean callDelete(AdminOrderDetail obj,int id) throws SQLException {
        super.deletebyID(obj,id);
        return false;
    }

    @Override
    public void callFilter(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public ArrayList callSearch(AdminOrderDetail obj, String name) throws SQLException {
        return null;
    }
    public ArrayList<AdminOrderDetail> selectByStatus(String value) throws SQLException {
        String sql="Select id,quantity_total,total_price,created_at from order_details where status=?";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1,value);
        ResultSet rs=pr.executeQuery();
        while(rs.next()){

        }
        return null;
    }

}
