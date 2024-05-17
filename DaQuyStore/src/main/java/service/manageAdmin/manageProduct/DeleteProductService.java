package service.manageAdmin.manageProduct;

import com.google.gson.Gson;
import dao.adminDAO.adminLog.LogAdminDAO;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.AdminLog;
import model.modelAdmin.ProductAdmin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteProductService extends HttpServlet {

    public void delete(HttpServletRequest req, HttpServletResponse resp, int id) throws ServletException, IOException, SQLException {
        ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();
        ProductAdmin productAdmin = new ProductAdmin();
        //gọi ham de lay gia tri truoc khi cap nhat trong bang product
        ProductAdmin productAdminPrev =productAdminDAO.getPrevValueByID(id);

        if (productAdminDAO.deletebyID(productAdmin,id)) {
            //goi ham de lay gia tri sau khi cap nhat trong bang product
            ProductAdmin productAdminAfter =productAdminDAO.getAfterValueByID(id);

          LogAdminDAO logAdminDAO=  LogAdminDAO.getInstance();
          //goi ham add cua logAdminDAO de them du lieu
            String chain_json = "Da xoa thanh cong";
            Gson gson = new Gson();
            AdminLog adminLog=new AdminLog(productAdminPrev.toString(), productAdminAfter.toString());

            logAdminDAO.addLogAlert(adminLog);
            resp.getWriter().println(gson.toJson(chain_json));
        } else {
            String chain_json = "Xoa that bai";
            Gson gson = new Gson();
            resp.getWriter().println(gson.toJson(chain_json));
        }


    }
}
