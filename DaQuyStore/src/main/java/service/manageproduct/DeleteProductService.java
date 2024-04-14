package service.manageproduct;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.AdminProduct;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteProductService extends HttpServlet {

    public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductAdminDAO<AdminProduct> productAdminDAO = ProductAdminDAO.getInstance();
        BufferedReader br = req.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();

        Gson gson = new Gson();
        String json = sb.toString();
        AdminProduct jsonelements = gson.fromJson(json, AdminProduct.class);
        try {
            productAdminDAO.callDelete(jsonelements);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
