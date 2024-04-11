package controller.controllerAdmin;

import javax.servlet.annotation.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-data-user")
public class AdminDataTableUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //query from database and from table users
        //almost to ajax excute
        resp.setContentType("text/html;charset=utf-8");
        Student st1=new Student("Tai","1.75m");
        Student st2=new Student("Tai","1.80m");
        resp.getWriter().println("<h1>");

    }
}
