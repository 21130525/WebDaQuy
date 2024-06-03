package controller;

import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductByCategory", value = "/ProductByCategory")
public class ProductByCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ProductDao dao = new ProductDao();
            String pathInfo = req.getPathInfo(); // /{name}/{id}
            String name = null;
            name = req.getParameter("name");
//            if (pathInfo != null && pathInfo.length() > 1) {
//                name = pathInfo.substring(1); // Extract the name from the URL path
//            }
            System.out.println(name);
            List<Product> list = null;

            list = dao.getProductByCategory(name);
            req.setAttribute("list", list);
            req.setAttribute("name", name);
            req.getRequestDispatcher("category-product.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
