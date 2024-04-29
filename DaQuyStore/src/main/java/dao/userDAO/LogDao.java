package dao.userDAO;

import com.google.gson.Gson;
import connector.DAOConnection;
import model.IModel;
import model.Log;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

public class LogDao  {

    public static void insert(IModel user,String action) throws SQLException {
        Gson gson = new Gson();
        String jsonBefore = gson.toJson(user.getDataBefore());
        String jsonAfter = gson.toJson(user.getDataAfter());
        Log log = new Log("",action,"info",user.getTable(),jsonBefore,jsonAfter,Date.valueOf( LocalDate.now()),Date.valueOf( LocalDate.now()));
        insertLog(log);


    }

    public static <T extends IModel> void update(T t) {
    }

    public static void selectById(String id) {

    }

    public static void selectByName(String name,String action) throws SQLException {
        Log log = new Log("",action,"info","user",null,null,Date.valueOf( LocalDate.now()),Date.valueOf( LocalDate.now()));
        insertLog(log);
    }
    private static void insertLog(Log log) throws SQLException {
        Connection dao = DAOConnection.getConnection();
        String sql = "insert into log(ip,level,action,address,priviousValue,currentValue,createAt,updateAt) values(?,?,?,?,?,?,?,?)";
        PreparedStatement pre = dao.prepareStatement(sql);
        pre.setString(1, log.getIp());
        pre.setString(2, log.getLevel());
        pre.setString(3, log.getAction());
        pre.setString(4, log.getAddress());
        pre.setString(5, log.getPreviousValue());
        pre.setString(6,log.getCurrentValue());
        pre.setDate(7,log.getCreated_at());
        pre.setDate(8,log.getUpdated_at());
        pre.execute();
    }
}
