package controller.controllerAdmin.manageproduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ManageProductController",urlPatterns = {"/addproduct","/deleteproduct","/filterproduct","/updateproduct","/findproduct","/getproduct"})
public class ManageProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url=req.getRequestURI();

    }
}
