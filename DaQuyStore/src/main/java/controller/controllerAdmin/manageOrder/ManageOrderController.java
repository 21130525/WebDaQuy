package controller.controllerAdmin.manageOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ManageOrderController", urlPatterns = {"/addorder", "/deleteorder", "/getorder", "/updateorder", "/filterorder", "/findorder"})
public class ManageOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/addorder":
                // Xử lý thêm đơn hàng
                break;
            case "/deleteorder":
                // Xử lý xóa đơn hàng
                break;
            case "/getorder":
                // Xử lý lấy thông tin đơn hàng
                break;
            case "/updateorder":
                // Xử lý cập nhật đơn hàng
                break;
            case "/filterorder":
                // Xử lý lọc đơn hàng
                break;
            case "/findorder":
                // Xử lý tìm đơn hàng
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
}
