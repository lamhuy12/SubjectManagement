/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.servlet;

import huyvl.history.HistoryDAO;
import huyvl.registration.PersonsCreateError;
import huyvl.registration.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HUYVU
 */
@WebServlet(name = "CreateNewAccountServlet", urlPatterns = {"/CreateNewAccountServlet"})
public class CreateNewAccountServlet extends HttpServlet {
    private final String LOGIN_PAGE="login.html";
    private final String CREATE_PAGE="createNewAccount.jsp";

    /**
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = CREATE_PAGE;

        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");

        PersonsCreateError errors = new PersonsCreateError();

        try {
            //1. Check validate of 04 users;
            boolean foundErr = false;
            if (username.trim().length() < 1 || username.trim().length() > 50) {
                foundErr = true;
                errors.setUsernameLengthErr("Username requires typing from 1 to 30 chars");
            }
            if (password.trim().length() < 1 || password.trim().length() > 50) {
                foundErr = true;
                errors.setPasswordLengthErr("Password requires typing from 1 to 30 chars");
            } else if (!password.trim().equals(confirm.trim())) {
                foundErr = true;
                errors.setConfirmNotMatched("Confirm must match password");
            }
            if (fullname.trim().length() < 1 || fullname.trim().length() > 50) {
                foundErr = true;
                errors.setFullnameLengthErr("Fullname requires typing from 1 to 50 chars");
            }

            if (foundErr) {
                //2.1 store Errors into scope
                request.setAttribute("CREATEER", errors);
            } else {
                //2.2 call DAO to insert to DB
                RegistrationDAO dao = new RegistrationDAO();
                boolean result = dao.createAccount(username, password, fullname, "user");
                
                if (result) {
                    url = LOGIN_PAGE;
                    HistoryDAO historyDAO = new HistoryDAO();
                    boolean history = historyDAO.history("CreateNewAccount", new Date());
                } //end if user register 
            } //end if Errors are occured
        } catch (NamingException ex) {
            log("CreateNewAccountServlet _ Naming " + ex.getMessage());
        } catch (SQLException ex) {
            String errMsg = ex.getMessage();
            log("CreateNewAccountServlet _ SQL: " + errMsg);
            if (errMsg.contains("duplicate")) {
                errors.setUsernameIsExisted(username + "is Existed!!!");
                request.setAttribute("CREATEER", errors);
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateNewAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateNewAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
