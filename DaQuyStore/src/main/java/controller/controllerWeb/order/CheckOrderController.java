package controller.controllerWeb.order;

import com.google.api.client.util.DateTime;
import dao.userDAO.OrderDao;
import dao.userDAO.UserDAO;
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
import java.sql.SQLException;
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
            // TODO tro loi
        }
        User user = (User) session.getAttribute("user");
        // lay thong tin
        String gender_nam = req.getParameter("gender_nam");
        String gender_nu = req.getParameter("gender_nu");
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

        // update user
        if(user==null){
//            chua dang nhap
            user = new User();
            user.setFullName(full_name);
            user.setEmail(email);
            user.setPhoneNumber(phone);
            if(gender_nam.equalsIgnoreCase("name")){
            user.setGender(gender_nam);
            }else{
                user.setGender(gender_nu);
            }
        }else{
//            da dang nhap va thay doi thong tin
            int count =0;
            if(!user.getEmail().equals(email)){
                count++;
            }
            if(!user.getFullName().equalsIgnoreCase(full_name)){
                count++;
                user.setFullName(full_name);
            }
            if(!user.getPhoneNumber().equals(phone)){
                count++;
                user.setPhoneNumber(phone);
            }
            String gender = (gender_nam.equalsIgnoreCase("nam")?gender_nam:gender_nu);
            if(!user.getGender().equalsIgnoreCase(gender)){
                count++;
                user.setGender(gender);
            }
//             thay doi thong tin
            if(count>0){
                UserDAO.getInstance().update(user,"thay doi user",req.getRemoteAddr());
            }

        }
//      tao order
        String addressMain = address+", "+wards+", "+district+", "+city;
        Day dayNow = Day.getInstance().getNow();
        Order order = new Order(user,addressMain,dayNow ,listOrder,"chuan bi");
        /**
         *  phan biet loai nhan hang
         *  - nhan hang tai cua hang
         *  - nhan hang qua ship do
         */




        // thanh toan
        try {
            OrderDao.getInstance().insert(order,"tao don hang",req.getRemoteAddr());
        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
        session.setAttribute("order", order);
        req.getRequestDispatcher("views/web/payment/payment.jsp").forward(req, resp);
    }
}

