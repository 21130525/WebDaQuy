package connector;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOConnection {
    public static  Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        String url = "jdbc:mysql://localhost:3306/new";
//        genstore_isused
        String user = "root";
        String password = "";
        return DriverManager.getConnection(url, user, password);
    }

//    public static void main(String[] args) {
//        try (Connection connection = getConnection()) {
//            System.out.println("Connected to MySQL database!");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
}
