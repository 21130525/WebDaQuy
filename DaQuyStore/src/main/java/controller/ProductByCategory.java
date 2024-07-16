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
        resp.setContentType("html/text;charset=UTF-8");
        String indexPage = req.getParameter("index");
        String category = req.getParameter("index");
        System.out.println(indexPage);

        ProductDao dao = new ProductDao();
        try {
            String pathInfo = req.getPathInfo(); // /{name}/{id}
            String name = null;
            name = req.getParameter("name");

            System.out.println(name);
            List<Product> list = null;

            list = dao.getProductByCategory(name);
            req.setAttribute("listA", list);
            req.setAttribute("name", name);
            req.getRequestDispatcher("views/web/cart/category-product.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
