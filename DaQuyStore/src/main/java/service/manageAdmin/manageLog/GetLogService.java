package service.manageAdmin.manageLog;

import dao.adminDAO.adminLog.LogAdminDAO;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminOrderDetail;
import model.modelAdmin.AdminUsers;
import model.modelAdmin.ProductAdmin;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetLogService<T> {
    public ArrayList<AdminLog> getLogList() throws SQLException {
        ArrayList<AdminLog> list = LogAdminDAO.getInstance().getListLog();
        return list;
    }

    public void addLogInform(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUsers) {
            UserAdminDAO.getInstance().addLogInformForSelect(adminLog);
        }
    }

    public void addLogAlert(AdminLog adminLog, T obj) throws SQLException {

    }

    public void addLogDanger(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUsers) {
            UserAdminDAO.getInstance().addLogDangerForDelete(adminLog);
        }
    }

    public void addLogWarning(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUsers) {
            UserAdminDAO.getInstance().addLogWarningForUpdateRole(adminLog);
        }else if(obj instanceof ProductAdmin){
            ProductAdminDAO.getInstance().addLogWarningForUpdate(adminLog);
        }
    }
}

