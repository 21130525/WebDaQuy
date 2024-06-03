package service.manageAdmin.manageOrder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import model.modelAdmin.AdminOrderDetail;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetOrderService {
    public JsonArray getAsJsonArrayStatusWaiting() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail> list = orderAdminDAO.selectByStatusWaiting();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }

    public JsonArray getAsJsonArrayStatusGiving() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail> list = orderAdminDAO.selectByStatusGiving();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }
}
