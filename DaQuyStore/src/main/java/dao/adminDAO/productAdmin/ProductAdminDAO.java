package dao.adminDAO.productAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductAdminDAO<A> extends AbsAdminDAO<AdminProduct> {
    public static ProductAdminDAO getInstance(){
        return new ProductAdminDAO();
    }
    @Override
    public ArrayList<AdminProduct> callSelect(AdminProduct obj) throws SQLException {
        ArrayList<AdminProduct> products=super.select(obj);
        return products;
    }

    @Override
    public void callAdd(AdminProduct obj) throws SQLException {

    }

    @Override
    public void callDelete(AdminProduct obj) throws SQLException {
        super.delete(obj);
    }

    @Override
    public void callFilter(AdminProduct obj) throws SQLException {

    }

    @Override
    public ArrayList select(AdminProduct obj) throws SQLException {
        ArrayList<AdminProduct> products=new ArrayList<>();
      String sql="Select product_name,price,status,sale,hot,color from products";
        PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs=pr.executeQuery();
        AdminProduct adminProduct;
        while(rs.next()){
            adminProduct=new AdminProduct(rs.getString("product_name"),rs.getInt("price"),rs.getString("status"),rs.getInt("sale"),rs.getInt("hot"),rs.getString("color"));
            products.add(adminProduct);
        }
        rs.close();
        pr.close();
        return products;
    }

    @Override
    public void add(AdminProduct obj) {

    }

    @Override
    public void delete(AdminProduct obj) {

    }

    @Override
    public void filter(AdminProduct obj) {

    }

//    @Override
//    public void findbyCreatedat(AdminProduct obj) {
//
//    }

    public static void main(String[] args) throws SQLException {
        AdminProduct adminProduct=new AdminProduct();
        System.out.println(ProductAdminDAO.getInstance().callSelect(adminProduct));

    }
}
