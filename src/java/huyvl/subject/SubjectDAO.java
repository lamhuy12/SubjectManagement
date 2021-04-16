/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.subject;

import huyvl.registration.RegistrationDTO;
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
public class SubjectDAO implements Serializable {

    private Connection con;
    private PreparedStatement stm;
    private ResultSet rs;

    public SubjectDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    private List<SubjectDTO> subjectList;

    public List<SubjectDTO> getSubjectList() {
        return subjectList;
    }

    public void searchSubject(String searchSub) throws Exception, NamingException, SQLException {
        try {
            con = DBHelper.makeConnection();
            String sql = "select subID, Name "
                    + "from Subject "
                    + "where Name like ?";

            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchSub + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                String subID = rs.getString("subID");
                String name = rs.getString("Name");
                SubjectDTO dto = new SubjectDTO(subID, name);

                if (subjectList == null) {
                    this.subjectList = new ArrayList<>();
                }

                subjectList.add(dto);
            }
        } finally {
            closeConnection();
        }
    }

    public List<SubjectDTO> getListSubject() throws Exception {
        String sql = "select subID, Name from Subject";
        List<SubjectDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String subID = rs.getString("subID");
                String name = rs.getString("Name");
                SubjectDTO dto = new SubjectDTO(subID, name);

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

}
