/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.history;

import huyvl.lesson.LessonDTO;
import huyvl.ultites.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HUYVU
 */
public class HistoryDAO implements Serializable{
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        
        if (stm != null) {
            stm.close();
        }
        
        if (con != null) {
            con.close();
        }
    }
    
    public boolean history(String notification, Date dateOfChange) throws NamingException, SQLException {
        boolean check = false;
        con =DBHelper.makeConnection();
        
        try {
            String sql ="insert into History(Notification, DateOfChange) "
                    + "values(?,?)";
            
            stm = con.prepareStatement(sql);
            stm.setString(1, notification);
            stm.setTimestamp(2, new Timestamp(dateOfChange.getTime()));
            check = stm.executeUpdate() >0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<HistoryDTO> getListHistory() throws Exception {
        List<HistoryDTO> list = null;
        String sql = "Select Notification, DateOfChange "
                + "From History";
        try {
            con = DBHelper.makeConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String notification = rs.getString("Notification");
                String dateOfChange = rs.getString("DateOfChange");
                HistoryDTO dto = new HistoryDTO(notification, dateOfChange);

                if (list == null) {
                    list = new ArrayList<>();
                }

                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
