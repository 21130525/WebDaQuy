package controller.controllerWeb.product;

import dao.userDAO.ProductDao;
import model.Product;
import model.Product_Detail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/productDetail")
public class productDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("id");
        //lấy thông tin thông qua tên sản phẩm
        String product_name=req.getParameter("product_name");
        ProductDao dao = ProductDao.getInstance();
//        Product p;
//
//        try { p = dao.selectById(id,"get product",req.getRemoteAddr());
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        if (p != null) {
//            req.setAttribute("product", p);
//        }
        Product_Detail p;
        try {
            p=dao.getInformationForPerProduct(product_name);
            if (p!=null){
                req.setAttribute("product_detail", p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher( "views/web/product/product_details.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
