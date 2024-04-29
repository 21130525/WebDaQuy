package dao.userDAO;

import model.IModel;

import java.sql.SQLException;
import java.util.ArrayList;

public abstract   class AbsDAO<T extends IModel> implements IDAO<T>{

    @Override
    public boolean insert(T t) throws SQLException {
        LogDao.insert(t,"register");
        return true;
    }

    @Override
    public boolean update(T t) throws SQLException {
        LogDao.update(t);
        return true;
    }

    @Override
    public int delete(String id) throws SQLException {
        return 0;
    }

    @Override
    public T selectById(String id) throws SQLException {
        LogDao.selectById(id);
        return null;
    }

    @Override
    public T selectByName(String name) throws SQLException {

        LogDao.selectByName(name,"login");
        return null;
    }

    @Override
    public ArrayList<T> selectAll() throws SQLException {
        return null;
    }
}
