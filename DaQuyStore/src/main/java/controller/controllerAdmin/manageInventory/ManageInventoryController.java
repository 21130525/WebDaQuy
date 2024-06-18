package controller.controllerAdmin.manageInventory;

import model.LogLevel;
import model.modelAdmin.AdminInventoryDetail_v2_fixed;
import model.modelAdmin.AdminLog;
import service.manageAdmin.manageInventory.GetInventoryService;
import service.manageAdmin.manageLog.GetLogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/getinventory")
public class ManageInventoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GetInventoryService getInventoryService = new GetInventoryService();
        try {
            AdminLog adminLog = new AdminLog();
            adminLog.setLevel(LogLevel.INFORM.toString());
            adminLog.setIpaddress(req.getRemoteAddr());
            adminLog.setCreated_at(new Timestamp(new Date().getTime()));
            adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
            adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
            GetLogService<AdminInventoryDetail_v2_fixed> adminLogService = new GetLogService<>();
            adminLogService.addLogInform(adminLog, new AdminInventoryDetail_v2_fixed());
            resp.getWriter().println(getInventoryService.getInventory());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
