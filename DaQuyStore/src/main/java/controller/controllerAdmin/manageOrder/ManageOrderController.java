package controller.controllerAdmin.manageOrder;

import service.manageAdmin.manageOrder.GetOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ManageOrderController", urlPatterns = {"/addorder", "/deleteorder", "/getorder_waiting", "/updateorder", "/filterorder", "/findorder"})
public class ManageOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI();
        if(action.endsWith("/getorder_waiting")){
            GetOrderService getOrderService=new GetOrderService();
            try {
             resp.getWriter().println(getOrderService.getAsJsonArrayStatusWaiting());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
