package service.manageUser.product;

import dao.userDAO.ProductDao;
import model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class ProductService {
    public ArrayList<Product> getProductPerPage(int pageNo) throws SQLException {

        ProductDao dao = new ProductDao();
        int start = (pageNo-1)*8;
        int end = pageNo*8;
        ArrayList<Product> res = new ArrayList<>();
        res = dao.getListProductPerPage(start,end);
        return res;
    }

    public Map<String, String> StringToMap(String information) {
        return null;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new ProductService().getProductPerPage(1));
    }
}
