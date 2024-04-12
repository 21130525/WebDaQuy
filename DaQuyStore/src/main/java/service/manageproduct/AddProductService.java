package service.manageproduct;

import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.AdminProduct;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

public class AddProductService extends HttpServlet {
    public void add(HttpServletRequest request) throws SQLException{
        ProductAdminDAO productAdminDAO=ProductAdminDAO.getInstance();
        productAdminDAO.callSelect(new AdminProduct());
    }
}
