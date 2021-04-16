/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.lessonDetail;

import huyvl.ultites.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HUYVU
 */
public class LessonDetailDAO {

    private Connection con;
    private PreparedStatement stm;
    private ResultSet rs;

    public LessonDetailDAO() {
    }

    private void closeConnection() throws Exception {
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

    public boolean checkExit(String lessonID, String subID) throws Exception {

        con = DBHelper.makeConnection();
        String sql = "select lessonID from LessonDetail where lessonID = ? and subID = ?";

        try {
            stm = con.prepareStatement(sql);

            stm.setString(1, lessonID);
            stm.setString(2, subID);

            rs = stm.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }

        return false;
    }

    public boolean addLessonDetail(String lessonID, String subID) throws Exception {

        con = DBHelper.makeConnection();
        String sql = "insert LessonDetail (lessonID, subID) values (?, ?)";

        try {
            stm = con.prepareStatement(sql);

            stm.setString(1, lessonID);
            stm.setString(2, subID);

            int result = stm.executeUpdate();

            if (result == 1) {
                return true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }

        return false;
    }
}
