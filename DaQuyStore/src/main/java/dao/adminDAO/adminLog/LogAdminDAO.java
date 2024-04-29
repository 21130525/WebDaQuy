package dao.adminDAO.adminLog;
import connector.DAOConnection;
import model.Log;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogAdminDAO {
        public static  LogAdminDAO getInstance(){
                return new LogAdminDAO();
        }
        public void select(Log log){

        }
        //ham dung de them gia tri truoc va sau khi cap nhat de so sanh
        public void add(Log log) throws SQLException {
                String sql="Insert into log() values()";
                PreparedStatement pr= DAOConnection.getConnection().prepareStatement(sql);
                pr.executeUpdate();

        }
        public void delete(Log log){

        }
        public void update(Log log){

        }
}
