/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.lesson;

import huyvl.ultites.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HUYVU
 */
public class LessonDAO implements Serializable {

    private Connection con;
    private PreparedStatement stm;
    private ResultSet rs;

    public LessonDAO() {
    }

    private void closeConnection() throws Exception {
        if (con != null) {
            con.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    private List<LessonDTO> lessonList;

    public List<LessonDTO> getLessonList() {
        return lessonList;
    }

    public void searchLessonBySubID(String subID) throws Exception {
        try {
            con = DBHelper.makeConnection();
            String sql = "select lessonn.lessonID, Name, Theory, Exam, Test from Lessonn join \n"
                    + "(select lessonID from LessonDetail where subID = ?) as buff\n"
                    + "on Lessonn.lessonID = buff.lessonID";

            stm = con.prepareStatement(sql);
            stm.setString(1, subID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String lessonID = rs.getString("lessonID");
                String name = rs.getString("Name");
                String theory = rs.getString("Theory");
                String exam = rs.getString("Exam");
                String test = rs.getString("Test");
                LessonDTO dto = new LessonDTO(lessonID, name, theory, exam, test);

                if (lessonList == null) {
                    this.lessonList = new ArrayList<>();
                }

                this.lessonList.add(dto);
            }
        } finally {
            closeConnection();
        }
    }

    public boolean AddLessontoDB(String lessonID, String name, String theory, String exam, String test)
            throws Exception {
        try {
            con = DBHelper.makeConnection();
            String sql = "insert into Lessonn(lessonID, Name, Theory, Exam, Test) "
                    + "values(?,?,?,?,?)";

            stm = con.prepareStatement(sql);
            stm.setString(1, lessonID);
            stm.setString(2, name);
            stm.setString(3, theory);
            stm.setString(4, exam);
            stm.setString(5, test);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }

        } finally {
            closeConnection();
        }
        return false;
    }

    public LessonDTO findPrimaryKey(String lessonID) throws Exception {
        LessonDTO dto = null;
        String sql = "Select Name, Theory, Exam, Test "
                + "From Lessonn "
                + "Where lessonID = ?";
        try {
            con = DBHelper.makeConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, lessonID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Name");
                String theory = rs.getString("Theory");
                String test = rs.getString("Test");
                String exam = rs.getString("Exam");
                dto = new LessonDTO(lessonID, name, theory, exam, test);

            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean updateLesson(String lessonID, String name, String theory, String exam, String test)
            throws SQLException, NamingException, Exception {

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Lessonn "
                        + "set Name=?, Theory =?, Exam=?, Test=? "
                        + "  where lessonID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, theory);
                stm.setString(3, exam);
                stm.setString(4, test);
                stm.setString(5, lessonID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            } 

        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean deleteLesson(String lessonID)
            throws SQLException, NamingException, Exception {
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Delete from Lessonn "
                        + "where lessonID =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, lessonID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public List<LessonDTO> getListLesson() throws Exception {
        List<LessonDTO> list = null;
        String sql = "Select lessonID, Name, Theory, Exam, Test "
                + "From Lessonn";
        try {
            con = DBHelper.makeConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String lessonID = rs.getString("lessonID");
                String name = rs.getString("Name");
                String theory = rs.getString("Theory");
                String exam = rs.getString("Exam");
                String test = rs.getString("Test");
                LessonDTO dto = new LessonDTO(lessonID, name, theory, exam, test);

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
