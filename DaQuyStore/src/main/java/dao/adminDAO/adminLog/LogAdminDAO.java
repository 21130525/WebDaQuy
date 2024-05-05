package dao.adminDAO.adminLog;

import connector.DAOConnection;
import dao.adminDAO.AbsLogAdminDAO;
import model.modelAdmin.AdminLog;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogAdminDAO extends AbsLogAdminDAO<AdminLog> {
        public static  LogAdminDAO getInstance(){
                return new LogAdminDAO();
        }
        public void select(AdminLog Log){

        }
        //ham dung de them gia tri truoc va sau khi cap nhat de so sanh
        public boolean add(AdminLog Log) throws SQLException {
                String sql="Insert into log(id,ip_address,prev_value,current_value,created_at) values(?,?,?,?,CURRENT_TIMESTAMP)";

                PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
                pr.setInt(1,getMaxID()+1);
                pr.setString(2,"1.2.3.4.5");
                pr.setString(3,Log.getPrevValue());
                pr.setString(4,Log.getCurrentValue());
               int rows= pr.executeUpdate();
                if(rows>=1){
                        return true;
                }else{
                        return false;
                }
        }
        public void delete(AdminLog Log){

        }
        public void update(AdminLog Log){

        }
        public int getMaxID() throws SQLException {
                String sql="Select max(id) as max_id from log";
                PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
                ResultSet rs=pr.executeQuery();
                int max=0;
                while(rs.next()){
                        max= rs.getInt("max_id");
                }
                pr.close();
                rs.close();
                return max;
        }

        public static void main(String[] args) throws SQLException {
                LogAdminDAO logAdminDAO=LogAdminDAO.getInstance();
                System.out.println(logAdminDAO.getMaxID());
                AdminLog adminLog=new AdminLog("123","123");
               System.out.println(logAdminDAO.add(adminLog));

        }
}
