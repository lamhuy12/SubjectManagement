/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.registration;

import huyvl.ultites.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HUYVU
 */
public class RegistrationDAO {

    private Connection con;
    private PreparedStatement stm;
    private ResultSet rs;

    public RegistrationDAO() {
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
    
    public boolean createAccount(String username, String password,
            String fullname, String role) throws SQLException, NamingException, Exception {

        try {
            //1. connect DB
            con = DBHelper.makeConnection();
            //2. Create SQL String
            if (con != null) {
                String sql = "Insert into Registrationn(Username, Password, Fullname, Role) "
                        + "Values(?,?,?,?)";
                //3. Cre Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullname);
                stm.setString(4, role);      
                //4. Excute Query
                int row = stm.executeUpdate();
                //5. process result 
                if (row > 0) {
                    return true;
                }
            } //end if connection is opened

        } finally {
            closeConnection();
        }
        return false;
    }

    public String checkLogin(String username, String password)
            throws NamingException, SQLException, Exception {
        String role = "failed";
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select Role "
                        + "from Registrationn "
                        + "where Username=? and Password=?";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();

                if (rs.next()) {
                    role = rs.getString("Role");
                }
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public String getFullname(String username) throws SQLException, NamingException, Exception {

        try {
            con = DBHelper.makeConnection();

            String sql = "select Fullname "
                    + "from Registrationn "
                    + "where Username =?";

            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();

            while (rs.next()) {
                String fullname = rs.getString("Fullname");
                return fullname;
            }
        } finally {
            closeConnection();
        }
        return null;
    }

    private List<RegistrationDTO> accountList;

    public List<RegistrationDTO> getAccountList() {
        return accountList;
    }

    public void searchByFullname(String searchValue) throws NamingException, SQLException, Exception {
        try {
            con = DBHelper.makeConnection();
            String sql = "select Username, Fullname, Role "
                    + "from Registrationn "
                    + " where Fullname like ?";

            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                String username = rs.getString("Username");
                String fullname = rs.getString("Fullname");
                String role = rs.getString("Role");
                RegistrationDTO dto = new RegistrationDTO(username, fullname, role);

                if (accountList == null) {
                    this.accountList = new ArrayList();
                }

                this.accountList.add(dto);
            }
        } finally {
            closeConnection();
        }
    }
    
    public boolean updateAccount(String username, String fullname, String role)
            throws SQLException, NamingException, Exception {

        try {
            //1. connect DB
            con = DBHelper.makeConnection();
            //2. Create SQL String
            if (con != null) {
                String sql = "Update Registrationn "
                        + "set Fullname=?, Role =? "
                        + "where Username=?";
                //3. Cre Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, fullname);
                stm.setString(2, role);
                stm.setString(3, username);
                //4. Excute Query
                int row = stm.executeUpdate();
                //5. process result 
                if (row > 0) {
                    return true;
                }
            } //end if connection is opened

        } finally {
            closeConnection();
        }
        return false;
    }
    
    public boolean deleteAccount(String username)
            throws SQLException, NamingException, Exception {
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Delete from Registrationn "
                        + "where Username =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
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
