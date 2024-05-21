package service.manageAdmin.manageLog;

import dao.adminDAO.adminLog.LogAdminDAO;
import model.modelAdmin.AdminLog;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetLogService {
    public ArrayList<AdminLog> getLogList() throws SQLException {
        ArrayList<AdminLog> list = LogAdminDAO.getInstance().getListLog();
        return list;
    }
}
