package dao;

import java.sql.SQLException;
import java.util.ArrayList;

public interface DAOInterface<T> {
    public boolean insert(T t) throws SQLException;
    public boolean update(T t)throws SQLException;
    public int delete(String id)throws SQLException;
    public T selectById(String id)throws SQLException;

    public ArrayList<T> selectAll()throws SQLException;

}