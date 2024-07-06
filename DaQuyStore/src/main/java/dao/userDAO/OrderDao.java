package dao.userDAO;

import model.Order;

import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDao extends AbsDAO<Order> implements IDAO<Order>{
    @Override
    public boolean insert(Order order, String action, String ipAddress) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Order order, String action, String ipAddress) throws SQLException {
        return false;
    }

    @Override
    public int delete(Order order, String action, String ipAddress) throws SQLException {
        return 0;
    }

    @Override
    public Order selectById(String id, String action, String ipAddress) throws SQLException {
        return null;
    }

    @Override
    public Order selectByName(String name, String action, String ipAddress) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<Order> selectAll() throws SQLException {
        return null;
    }
}
