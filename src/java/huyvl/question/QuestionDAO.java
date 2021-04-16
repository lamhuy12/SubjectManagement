/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.question;

import huyvl.servlet.GetListQuestionServlet;
import huyvl.subject.SubjectDTO;
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
public class QuestionDAO implements Serializable {

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

    public List<QuestionDTO> getListQuestion() throws Exception {
        String sql = "select QuestionID, Question, lessonID from Question";
        List<QuestionDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String questionID = rs.getString("QuestionID");
                String question = rs.getString("Question");
                String lessonID = rs.getString("lessonID");
                QuestionDTO dto = new QuestionDTO(questionID, question, lessonID);

                if (list == null) {
                    list = new ArrayList();
                }
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public QuestionDTO findPrimaryKey(String questionID) throws Exception {
        QuestionDTO dto = null;

        try {
            con = DBHelper.makeConnection();
            String sql = "select Question, lessonID "
                    + "from Question "
                    + "where QuestionID =?";
            stm = con.prepareStatement(sql);
            stm.setString(1, questionID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String question = rs.getString("Question");
                String lessonID = rs.getString("lessonID");
                dto = new QuestionDTO(questionID, question, lessonID);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean addQuestionToDB(String questionID, String question, String lessonID) throws SQLException, NamingException {
        boolean check = false;
        try {
            con = DBHelper.makeConnection();
            String sql = "insert into Question(QuestionID, Question, lessonID) "
                    + "values(?,?,?)";
            
            stm = con.prepareStatement(sql);
            stm.setString(1, questionID);
            stm.setString(2, question);
            stm.setString(3, lessonID);
            check = stm.executeUpdate() >0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean checkExist(String questionID, String lessonID) throws SQLException, NamingException{
        try {
            con = DBHelper.makeConnection();
            String sql = "select QuestionID from Question where QuestionID = ? and lessonID = ?";
            
            stm = con.prepareStatement(sql);
            stm.setString(1, questionID);
            stm.setString(2, lessonID);
            rs = stm.executeQuery();
            if(rs.next()){
                return true;
            }
        } finally {
            closeConnection();
        }
        
        return false;
    }
    
    List<QuestionDTO> questionList;

    public List<QuestionDTO> getQuestionList() {
        return questionList;
    }
    
    
    public void searchQuestionByLessonID(String lessonID) throws SQLException, NamingException {
        try {
            con =DBHelper.makeConnection();
            String sql = "select QuestionID, Question "
                    + "from Question "
                    + "where lessonID =?";
            
            stm = con.prepareStatement(sql);
            stm.setString(1, lessonID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String questionID = rs.getString("QuestionID");
                String question = rs.getString("Question");
                QuestionDTO dto = new QuestionDTO(questionID, question, lessonID);
                
                if (this.questionList == null) {
                    this.questionList = new ArrayList<>();
                }
                
                this.questionList.add(dto);
            }
        } finally {
            closeConnection();
        }
    }
    
    public boolean updateQuestion(String questionID)
            throws SQLException, NamingException, Exception {

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Question "
                        + "set Question "
                        + "  where QuestionID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, questionID);
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
}
