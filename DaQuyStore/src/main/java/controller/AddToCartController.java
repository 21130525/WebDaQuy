package controller;

import com.google.gson.Gson;
import dao.userDAO.ProductDao;
import filter.CartResponse;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PrintWriter out;
    CartResponse cartResponse;
    long totalCartValue = 0;
    String jsonResponse;
    Gson gson = new Gson();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String id = request.getParameter("id");
        Cart cart = (Cart) request.getSession().getAttribute("cart-list");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart-list", cart);
        }
        Product product = null;
        try {
            product = ProductDao.getInstance().selectById(id, "get product", request.getRemoteAddr());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (product == null) {
            // reponse {"reponseCode":?,"message":"?","totalCartValue":?}
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();
            cartResponse = new CartResponse(HttpServletResponse.SC_BAD_REQUEST, "Sản phẩm không tồn tại", totalCartValue); // Giỏ hàng rỗng
            jsonResponse = new Gson().toJson(cartResponse);
            out.print(jsonResponse);
            out.flush();
            return;
        }
        if (cart == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // reponse {"reponseCode":?,"message":"?","totalCartValue":?}
            out = response.getWriter();
            cartResponse = new CartResponse(HttpServletResponse.SC_UNAUTHORIZED, "Người dùng chưa đăng nhập", totalCartValue); // Giỏ hàng rỗng
            jsonResponse = new Gson().toJson(cartResponse);
            out.print(jsonResponse);
            out.flush();
            return;
        }else {
            product.setQuantity(1);
            cart.put(id, product);
            request.getSession().setAttribute("cart-list", cart);
            // Lấy tổng giá trị giỏ hàng
            long totalCartValue = (long) cart.total();
            // Gửi về JSON response
            //reponse {"reponseCode":?,"message":"?","totalCartValue":?}
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Tạo một đối tượng JSON để chứa thông báo thành công và tổng giá trị giỏ hàng
            cartResponse = new CartResponse(HttpServletResponse.SC_OK, "Thêm vào giỏ hàng thành công", totalCartValue);
            String jsonResponse = gson.toJson(cartResponse);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();
            out.print(jsonResponse);
            out.flush();

        }
    }
}