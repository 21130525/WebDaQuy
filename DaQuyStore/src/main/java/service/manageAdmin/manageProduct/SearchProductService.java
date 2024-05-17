package service.manageAdmin.manageProduct;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.ProductAdmin;

import java.sql.SQLException;
import java.util.ArrayList;

public class SearchProductService {
    public JsonArray getJSONResult( String name) throws SQLException {
        ProductAdmin productAdmin =new ProductAdmin();
     ArrayList<ProductAdmin> list= ProductAdminDAO.getInstance().callSearch(productAdmin,name);
        Gson gson=new Gson();
        String listjson=gson.toJson(list);
        JsonObject jsonObject= JsonParser.parseString(listjson).getAsJsonObject();
        JsonArray jsonArray=jsonObject.getAsJsonArray();
        return jsonArray;
    }
}
