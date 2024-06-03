package controller.controllerAdmin.manageLog;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import model.modelAdmin.AdminLog;
import service.manageAdmin.manageLog.GetLogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/log")
public class ManageLogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GetLogService getLogService=new GetLogService();
        try {
            ArrayList<AdminLog> list=getLogService.getLogList();
            Gson gson=new Gson();
            String json=gson.toJson(list);
            JsonArray jsonArray= JsonParser.parseString(json).getAsJsonArray();
            resp.getWriter().println(jsonArray);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
