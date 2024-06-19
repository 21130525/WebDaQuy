package controller.controllerAdmin.manageUser;

import com.google.gson.Gson;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminUsers;
import service.manageAdmin.manageLog.GetLogService;
import service.manageAdmin.manageUser.DeleteUserService;
import service.manageAdmin.manageUser.GetUserService;
import service.manageAdmin.manageUser.UpdateUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "ManageUserController", urlPatterns = {"/deleteuser", "/updateuser", "/getuser", "/finduser", "/filtuser"})
public class ManageUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.endsWith("/deleteuser")) {
            int id = Integer.parseInt(req.getParameter("id"));
            DeleteUserService deleteUserService = new DeleteUserService();
            try {
                resp.getWriter().println(deleteUserService.deleteUser(id));
                AdminUsers adminUsers=new AdminUsers();
                AdminLog adminLog=new AdminLog();
                adminLog.setLevel(LogLevel.DANGER.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setPrevValue("User có id là:"+id+"chưa xóa");
                adminLog.setCurrentValue("Đã xóa"+id );
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                GetLogService<AdminUsers> getLogService=new GetLogService<>();
                getLogService.addLogDanger(adminLog,adminUsers);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (url.endsWith("/getuser")) {
            GetUserService getUserService = new GetUserService();
            try {
                AdminUsers adminUsers=new AdminUsers();
                AdminLog adminLog=new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setPrevValue("Chưa có dữ liệu"+new Timestamp(new Date().getTime()));
                adminLog.setCurrentValue("Lấy dữ liệu"+new Timestamp(new Date().getTime()));
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                GetLogService<AdminUsers> getLogService=new GetLogService<>();
                getLogService.addLogInform(adminLog,adminUsers);
                getUserService.getUser(req, resp);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (url.endsWith("/finduser")) {

        } else {

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.endsWith("/updateuser")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String selected_role = req.getParameter("select");
            UpdateUserService updateUserService = new UpdateUserService();
            try {
                Gson gson = new Gson();
                String json = gson.toJson(updateUserService.updateRole(id, selected_role));
                resp.getWriter().println(json);
                AdminUsers adminUsers=new AdminUsers();
                AdminLog adminLog=new AdminLog();
                adminLog.setLevel(LogLevel.WARNING.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setPrevValue("User có id là:"+id+"chưa thay đổi role");
                adminLog.setCurrentValue("User có id là:"+id+"đã thay đổi role"+selected_role );
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                GetLogService<AdminUsers> getLogService=new GetLogService<>();
                getLogService.addLogWarning(adminLog,adminUsers);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}