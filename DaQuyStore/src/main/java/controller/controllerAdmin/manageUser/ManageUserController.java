package controller.controllerAdmin.manageUser;

import com.google.gson.Gson;
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
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (url.endsWith("/getuser")) {
            GetUserService getUserService = new GetUserService();
            try {
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
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}