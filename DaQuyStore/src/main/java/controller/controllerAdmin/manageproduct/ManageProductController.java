package controller.controllerAdmin.manageproduct;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import service.manageproduct.AddProductService;
import service.manageproduct.DeleteProductService;
import service.manageproduct.GetProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="ManageProductController",urlPatterns = {"/addproduct_admin","/deleteproduct_admin","/filterproduct_admin","/updateproduct_admin","/findproduct_admin","/getproduct_admin"})
public class ManageProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.endsWith("/addproduct_admin")) {
            // Xử lý thêm sản phẩm
            try {
                AddProductService addProductService=new AddProductService();
                addProductService.add(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (url.endsWith("/deleteproduct")) {
            // Xử lý xóa sản phẩm
            DeleteProductService deleteProductService=new DeleteProductService();
            deleteProductService.delete(req,resp);
        } else if (url.endsWith("/filterproduct")) {
            // Xử lý lọc sản phẩm
        } else if (url.endsWith("/updateproduct")) {
            // Xử lý cập nhật sản phẩm
        } else if (url.endsWith("/findproduct")) {
            // Xử lý tìm kiếm sản phẩm
        } else if (url.endsWith("/getproduct_admin")) {
            // Xử lý lấy thông tin sản phẩm
            try {
                GetProductService getProductService=new GetProductService();
                getProductService.getProduct(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            // URL không hợp lệ
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
