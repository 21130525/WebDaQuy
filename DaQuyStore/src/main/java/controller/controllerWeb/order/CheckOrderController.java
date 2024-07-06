package controller.controllerWeb.order;

import com.google.api.client.util.DateTime;
import model.Day;
import model.Order;
import model.Product;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/checkOut")
public class CheckOrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<Product,Integer> listOrder = new HashMap<>();
        if(session.getAttribute("listOrder") != null) {
            listOrder = (HashMap<Product,Integer>) session.getAttribute("listOrder");
        }else{
            // TODO trang loi
        }
        User user = (User) session.getAttribute("user");
        // lay thong tin
        String gender_nam = req.getParameter("gender_nam");
        String full_name = req.getParameter("nameCustommer");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNumber");

        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String wards = req.getParameter("wards");
        String address = req.getParameter("address");

        String note = req.getParameter("note");
        String note2 = req.getParameter("note2");
        String accept_nhantaicuahang= req.getParameter("accept_nhantaicuahang");
        System.out.println(listOrder+"\n " +
                gender_nam+full_name+email+phone + city+district+wards+address+note+note2 +accept_nhantaicuahang+"end");

        // update user

        // kiem tra thong tin

        // thanh toan
        String addressMain = address+", "+wards+", "+district+", "+city;
        Order order = new Order(user,addressMain, Day.getInstance().getNow(),listOrder,"chuan bi");
        session.setAttribute("order", order);
        req.getRequestDispatcher("views/web/payment/payment.jsp").forward(req, resp);
    }
}

