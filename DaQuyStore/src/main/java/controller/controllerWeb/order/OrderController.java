package controller.controllerWeb.order;

import dao.userDAO.ProductDao;
import jakarta.mail.*;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@WebServlet("/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
//        lay san pham
        String id = req.getParameter("id");
        ProductDao dao = ProductDao.getInstance();
        Product p;
        try {
            p = dao.selectById(id,"get product",req.getRemoteAddr());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        lay so luong san pham
        String numStr = req.getParameter("num");
        int num = Integer.parseInt(numStr);

//        lay danh sach thanh toan
        Map<Product, Integer> listOrder = (Map<Product, Integer>) session.getAttribute("listOrder");
        if(listOrder == null) {
            listOrder = new HashMap<>();
        }
        session.setAttribute("listOrder", listOrder);
        if (p != null) {
            listOrder.put(p, num);
        }
        req.setAttribute("totalPrice", TotalPrice(listOrder));
        req.getRequestDispatcher( "views/web/order/order.jsp").forward(req, resp);
    }

    private double TotalPrice(Map<Product, Integer> listOrder) {
        double total = 0;

        for(Product p : listOrder.keySet()) {
            total +=  (p.getPrice() * listOrder.get(p));
        }
        return total;
    }


}
