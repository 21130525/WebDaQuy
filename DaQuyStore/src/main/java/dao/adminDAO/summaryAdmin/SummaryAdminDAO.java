package dao.adminDAO.summaryAdmin;

import connector.DAOConnection;
import model.modelAdmin.AdminSummary;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SummaryAdminDAO {
    public ArrayList<AdminSummary> getListSummarybyMonth() throws SQLException {
        ArrayList<AdminSummary> list = new ArrayList<>();
        String sql = "select sum(total_price) as total,month(created_at) as month from orders group by month(created_at)";

        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminSummary adminSummary = null;
        while (rs.next()) {
            adminSummary = new AdminSummary();
            adminSummary.setSummary(rs.getInt("total"));
            adminSummary.setMonth(rs.getInt("month"));
            list.add(adminSummary);
        }
        return list;
    }

    // ham tren dung de test ham duoi dung de xu li du lieu that su
//    public ArrayList<AdminSummary> getListSummary() throws SQLException {
//        ArrayList<AdminSummary> list = new ArrayList<>();
//        String sql = "SELECT SUM(quantity_total * total_price) AS total_value " +
//                "FROM order_details " +
//                "WHERE MONTH(order_details.created_at) = 5 " +
//                "GROUP BY MONTH(order_details.created_at)";
//
//
//        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
//        ResultSet rs = pr.executeQuery();
//        AdminSummary adminSummary = null;
//        while (rs.next()) {
//            adminSummary = new AdminSummary();
//            adminSummary.setSummary(rs.getInt("total_value"));
//            list.add(adminSummary);
//        }
//        return list;
//    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new SummaryAdminDAO().getListSummarybyMonth());
    }
}
