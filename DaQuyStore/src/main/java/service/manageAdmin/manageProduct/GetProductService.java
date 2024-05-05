package service.manageAdmin.manageProduct;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.ProductAdmin;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class GetProductService extends HttpServlet {
    public void getProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        ProductAdminDAO productAdminDAO=ProductAdminDAO.getInstance();
        ProductAdmin productAdmin =new ProductAdmin();
        Gson gson=new Gson();
        String jsonElements=gson.toJson(productAdminDAO.callSelect(productAdmin));
        JsonArray jsonArray=gson.fromJson(jsonElements, JsonArray.class);
        resp.getWriter().println(jsonArray);
    }
}
