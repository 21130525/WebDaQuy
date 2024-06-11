package controller.controllerAdmin.manageOrder;

import com.google.gson.Gson;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import model.modelAdmin.AdminOrderDetail;
import service.manageAdmin.manageOrder.DeleteOrderService;
import service.manageAdmin.manageOrder.GetOrderService;
import service.manageAdmin.manageOrder.UpdateOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ManageOrderController", urlPatterns = {"/deleteorder", "/getorder_waiting", "/updateorder",  "/getorder_giving","/getorder_waitinggiving","/getorder_gived","/getorder_canceled"})
public class ManageOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI();
        if (action.endsWith("/getorder_waiting")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusWaiting());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_waitinggiving")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusForWaitingGiving());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_giving")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusGiving());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_gived")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusGived());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_canceled")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusCanceled());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/deleteorder")) {
            int id = Integer.parseInt(req.getParameter("id"));
            DeleteOrderService deleteOrderService = new DeleteOrderService();
            try {
                if (deleteOrderService.deleteOrder(id)) {
                    Gson gson = new Gson();
                    String result = "Xoa thanh cong";
                    String json = gson.toJson(result);
                    resp.getWriter().println(json);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI();
        if (action.endsWith("/updateorder")) {
            int id = Integer.parseInt(req.getParameter("id"));
            //giá trị lấy ra từ ajax
            String selected_status = req.getParameter("select");
            UpdateOrderService updateOrderService = new UpdateOrderService();
//            AdminOrderDetail adminOrderDetail = new AdminOrderDetail();

//                adminOrderDetail.setStatus(updateOrderService.getStatusCurrentOrder(id));
            try {
                if (selected_status.equals("waiting")) {
                    String translated_status = "chờ xác nhận";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    resp.getWriter().println(json);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }

        }
    }
}
