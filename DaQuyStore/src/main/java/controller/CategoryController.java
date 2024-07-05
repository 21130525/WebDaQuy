package controller;

import dao.CategoryDao;
import dao.userDAO.ProductDao;
import model.Category;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CategoryController" ,urlPatterns="/Category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        CategoryDao daoCate = new CategoryDao();
        ProductDao  daoProduct = new ProductDao();
        List<Category> list = null;
            list = daoCate.listCategory();
            List<Product> listProduct = daoProduct.selectAll();
            req.setAttribute("data", listProduct);
        req.setAttribute("listD",list);
        req.getRequestDispatcher("category.jsp").forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
