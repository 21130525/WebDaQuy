package dao.adminDAO;

import dao.adminDAO.productAdmin.ProductAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUsers;
import model.modelAdmin.ProductAdmin;

import java.sql.SQLException;
import java.util.ArrayList;


//truyền kiểu dữ liệu cho Generic và 1 object rỗng để xử lí logic
public  abstract class AbsAdminDAO<T> implements IDAOAdmin<T> {
    @Override
    public ArrayList select(T obj) throws SQLException {
        if(obj instanceof AdminUsers){
            ArrayList<AdminUsers> arrayList= UserAdminDAO.getInstance().select((AdminUsers) obj);
            return arrayList;
        }else if(obj instanceof ProductAdmin){
            ArrayList<ProductAdmin> arrayList= ProductAdminDAO.getInstance().select((ProductAdmin) obj);
            return arrayList;
        }
        return null;
    }

    @Override
    public void add(T obj) {

    }

    @Override
    public boolean deletebyID(T obj,int id) throws SQLException {
        if(obj instanceof AdminUsers){

        }else if(obj instanceof ProductAdmin){
         ProductAdminDAO.getInstance().deletebyID((ProductAdmin) obj,id);
        }
        return false;
    }



    @Override
    public void filter(T obj) throws SQLException {

    }

    @Override
    public void findbyName(T obj,String name) throws SQLException {

    }

    @Override
    public ArrayList search(T obj,String name) throws SQLException {
        if(obj instanceof ProductAdmin){
      ArrayList<ProductAdmin> productAdmins = ProductAdminDAO.getInstance().search((ProductAdmin) obj,name);
      return productAdmins;
        }
        return null;
    }
}
