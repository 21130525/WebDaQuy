package controller.controllerAdmin.manageuser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ManageUserController", urlPatterns = {"/deleteuser", "/updateuser", "/getuser", "/finduser", "filtuser"})
public class ManageUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.endsWith("/deleteuser")) {

        } else if (url.endsWith("/updateuser")) {

        } else if (url.endsWith("/getuser")) {

        } else if (url.endsWith("/finduser")) {

        } else {

        }
    }
}
