package dao.adminDAO;

import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUsers;

import java.sql.SQLException;
import java.util.ArrayList;

//truyền kiểu dữ liệu cho Generic và 1 object rỗng để xử lí logic
public  abstract class AbsAdminDAO<T> implements IDAOAdmin<T> {
    @Override
    public ArrayList select(T obj) throws SQLException {
        if(obj instanceof AdminUsers){
            ArrayList<AdminUsers> arrayList= UserAdminDAO.getInstance().select((AdminUsers) obj);
            return arrayList;
        }
        return null;
    }

    @Override
    public void add(T obj) {

    }

    @Override
    public void delete(T obj) {

    }

    @Override
    public void filter(T obj) {

    }

    @Override
    public void findbyCreatedat(T obj) {

    }

}
