package service.manegeAdmin.manageProduct;

import com.google.gson.Gson;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.AdminProduct;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

public class AddProductService extends HttpServlet {
    public void add(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        ProductAdminDAO<AdminProduct> productAdminDAO=ProductAdminDAO.getInstance();
        BufferedReader br=request.getReader();
        StringBuilder sb=new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
       br.close();
        String jsonString = sb.toString();
        Gson gson=new Gson();
        AdminProduct adminProduct=gson.fromJson(jsonString, AdminProduct.class);
        productAdminDAO.callAdd(adminProduct);

    }
}
