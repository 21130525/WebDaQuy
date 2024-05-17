package controller.controllerAdmin.manageUser;

import service.manageAdmin.manageUser.GetUserService;

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

        } else if (url.endsWith("/updateuser")) {

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
}
