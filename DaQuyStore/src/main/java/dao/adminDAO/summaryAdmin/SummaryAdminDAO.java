package dao.adminDAO.summaryAdmin;

import connector.DAOConnection;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminSummary;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class SummaryAdminDAO {
    public SummaryAdminDAO getInstance() {
        return new SummaryAdminDAO();
    }

    /*
    hàm thêm log cho chức năng truy vấn doanh thu
     */
    public void addLogInformForSelect(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.INFORM.toString());
        ps.executeUpdate();
    }

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

    public int getMaxID() throws SQLException {
        String sql = "select max(id) from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }


    public static void main(String[] args) throws SQLException {
        System.out.println(new SummaryAdminDAO().getListSummarybyMonth());
    }
}
