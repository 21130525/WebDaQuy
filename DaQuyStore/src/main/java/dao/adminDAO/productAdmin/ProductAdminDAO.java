package dao.adminDAO.productAdmin;

import dao.adminDAO.AbsAdminDAO;
import model.modelAdmin.AdminProduct;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductAdminDAO extends AbsAdminDAO<AdminProduct> {
    public static ProductAdminDAO getInstance(){
        return new ProductAdminDAO();
    }
    @Override
    public ArrayList<AdminProduct> callSelect(AdminProduct obj) throws SQLException {
    return null;
    }

    @Override
    public void callAdd(AdminProduct obj) throws SQLException {

    }

    @Override
    public void callDelete(AdminProduct obj) throws SQLException {

    }

    @Override
    public void callFilter(AdminProduct obj) throws SQLException {

    }

    @Override
    public ArrayList select(AdminProduct obj) throws SQLException {
      return null;
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

    @Override
    public void findbyCreatedat(AdminProduct obj) {

    }
}
