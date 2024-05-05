package dao.adminDAO.productAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.ProductAdmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductAdminDAO extends AbsAdminDAO<ProductAdmin> {
    @Override
    public boolean deletebyID(ProductAdmin obj, int id) throws SQLException {
        String sql = "Update products set status_deleted='da xoa' where status_deleted='chua xoa' and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        int rows = pr.executeUpdate();
        pr.close();
        if (rows >= 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public ArrayList search(ProductAdmin obj, String name) throws SQLException {
        return super.search(obj, name);
    }

    public static ProductAdminDAO getInstance() {
        return new ProductAdminDAO();
    }

    @Override
    public ArrayList callSelect(ProductAdmin obj) throws SQLException {
        ArrayList<ProductAdmin> products = super.select(obj);
        return products;
    }

    @Override
    public void callAdd(ProductAdmin obj) throws SQLException {

    }

    @Override
    public boolean callDelete(ProductAdmin obj, int id) throws SQLException {
        return super.deletebyID(obj, id);
    }


    @Override
    public void callFilter(ProductAdmin obj) throws SQLException {

    }

    @Override
    public ArrayList callSearch(ProductAdmin obj, String name) throws SQLException {
        return null;
    }

    public ProductAdmin selectByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1,id);
        ResultSet rs = pr.executeQuery();
        ProductAdmin adminProduct = null;
        while (rs.next()) {
            adminProduct = new ProductAdmin(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        pr.close();
        rs.close();
        return adminProduct;
    }

    @Override
    public ArrayList select(ProductAdmin obj) throws SQLException {
        ArrayList<ProductAdmin> products = new ArrayList<>();
        String sql = "Select id,product_name,price,status,sale,hot from products where status_deleted='chua xoa'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        ProductAdmin adminProduct;
        while (rs.next()) {
            adminProduct = new ProductAdmin(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
            products.add(adminProduct);
        }
        rs.close();
        pr.close();
        return products;
    }

    @Override
    public void add(ProductAdmin obj) {

    }


    @Override
    public void filter(ProductAdmin obj) {

    }

    @Override
    public void findbyName(ProductAdmin obj, String name) {

    }

    public ProductAdmin getAfterValueByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        ProductAdmin adminProduct = null;
        while (rs.next()) {
            adminProduct = new ProductAdmin(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        rs.close();
        pr.close();
        return adminProduct;
    }

    public ProductAdmin getPrevValueByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        ProductAdmin adminProduct = null;
        while (rs.next()) {
            adminProduct = new ProductAdmin(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        rs.close();
        pr.close();
        return adminProduct;
    }

    public static void main(String[] args) throws SQLException {
        ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();

        System.out.println(productAdminDAO.callDelete(new ProductAdmin(), 25));
    }
}
