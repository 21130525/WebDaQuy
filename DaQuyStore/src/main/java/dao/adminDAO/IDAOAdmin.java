package dao.adminDAO;

import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IDAOAdmin<T> {


    public ArrayList select(T obj) throws SQLException;

    public void add(T obj) throws SQLException;

    public void delete(T obj) throws SQLException;

    public void filter(T obj) throws SQLException;

    public void findbyName(T obj,String name) throws SQLException;
    public ArrayList<T> callSelect(T obj) throws SQLException;
    public void callAdd(T obj) throws SQLException;
    public void callDelete(T obj) throws SQLException;
    public void callFilter(T obj) throws SQLException;
}
