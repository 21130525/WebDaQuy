package dao;

import model.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoriesDao implements DAOInterface<Category>{


    @Override
    public boolean insert(Category category) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Category category) throws SQLException {
        return false;
    }

    @Override
    public int delete(String id) throws SQLException {
        return 0;
    }

    @Override
    public Category selectById(String id) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<Category> selectAll() throws SQLException {
        return null;
    }


    public  ArrayList<Category> getListCate() throws SQLException {
        String sql = "";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> arr = new ArrayList<>();
        while(rs.next()) {
            Category ct = new Category();
            ct.setId(rs.getInt(0));
            ct.setCategory_name(rs.getString("category_name"));
            ct.setImg(rs.getString("img"));
            arr.add(ct);
        }
        rs.close();
        ps.close();
        DAOConnection.getConnection().close();
        return arr;
    }

}
