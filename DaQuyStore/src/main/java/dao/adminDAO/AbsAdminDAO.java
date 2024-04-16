package dao.adminDAO;

import dao.adminDAO.productAdmin.ProductAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminProduct;
import model.modelAdmin.AdminUsers;

import java.sql.SQLException;
import java.util.ArrayList;

import static dao.adminDAO.productAdmin.ProductAdminDAO.getInstance;

//truyền kiểu dữ liệu cho Generic và 1 object rỗng để xử lí logic
public  abstract class AbsAdminDAO<T> implements IDAOAdmin<T> {
    @Override
    public ArrayList select(T obj) throws SQLException {
        if(obj instanceof AdminUsers){
            ArrayList<AdminUsers> arrayList= UserAdminDAO.getInstance().select((AdminUsers) obj);
            return arrayList;
        }else if(obj instanceof AdminProduct){
            ArrayList<AdminProduct> arrayList= ProductAdminDAO.getInstance().select((AdminProduct) obj);
            return arrayList;
        }
        return null;
    }

    @Override
    public void add(T obj) {

    }

    @Override
    public void delete(T obj) {
        if(obj instanceof AdminUsers){

        }else if(obj instanceof AdminProduct){
            ProductAdminDAO.getInstance().delete((AdminProduct) obj);
        }
    }

    @Override
    public void filter(T obj) {

    }

    @Override
    public void findbyCreatedat(T obj) {

    }

}
