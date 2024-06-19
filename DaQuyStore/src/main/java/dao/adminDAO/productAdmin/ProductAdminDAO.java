package dao.adminDAO.productAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.ProductAdmin;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

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
        pr.setInt(1, id);
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

    public ArrayList findbyName(ProductAdmin obj, String name) {

        return null;
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

    //xử lí cập nhật thông tin sản phẩm cho từng trường hợp
    public void updateProductName(String name, int id) throws SQLException {
        String sql = "Update products set product_name=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, name);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductPrice(int price, int id) throws SQLException {
        String sql = "Update products set price=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, price);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductStatus(String status, int id) throws SQLException {
        String sql = "Update products set status=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, status);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();

    }

    public void updateProductSale(int sale, int id) throws SQLException {
        String sql = "Update products set sale=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, sale);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductColor(String color, int id) throws SQLException {
        String sql = "Update products set color=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, color);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductDescription(String description, int id) throws SQLException {
        String sql = "Update products set description=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, description);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    //cập nhật thông tin về ảnh của sản phẩm
//id của ảnh bằng id của sản phẩm
    public void updateProductImageMain(String imagemain, int id) throws SQLException {
        String sql = "Update product_image set img_main=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, imagemain);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage1(String image_1, int id) throws SQLException {
        String sql = "Update product_image set img_1=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_1);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage2(String image_2, int id) throws SQLException {
        String sql = "Update product_image set img_2=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_2);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage3(String image_3, int id) throws SQLException {
        String sql = "Update product_image set img_3=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_3);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage4(String image_4, int id) throws SQLException {
        String sql = "Update product_image set img_4=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_4);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    /*
    các hàm thêm log cho chức năng cập nhật,thêm,xóa sản phẩm,truy vấn

     */
    public void addLogWarningForUpdate(AdminLog log) throws SQLException {
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

    public void addLogALertForAdd(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.ALERT.toString());
        ps.executeUpdate();
    }

    public int getMaxID() throws SQLException {
        String sql = "select max(id) from log";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int index = 0;
        while (rs.next()) {
            index = rs.getInt("id");
        }
        return index;
    }

    /*
    hàm xử lí việc truy vấn ảnh hiển thị lên
     */
    public ArrayList<ProductAdmin> getAllImages() throws SQLException {
        ArrayList<ProductAdmin> list = new ArrayList<>();
        String sql = "Select id,img_main,img_1,img_2,img_3,img_4 from product_image";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            ProductAdmin p = new ProductAdmin();
            p.setId(rs.getInt("id"));
            p.setImg_main(rs.getString("img_main"));
            p.setImg_1(rs.getString("img_1"));
            p.setImg_2(rs.getString("img_2"));
            p.setImg_3(rs.getString("img_3"));
            p.setImg_4(rs.getString("img_4"));
            list.add(p);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();

        System.out.println(productAdminDAO.callDelete(new ProductAdmin(), 25));
    }
}
