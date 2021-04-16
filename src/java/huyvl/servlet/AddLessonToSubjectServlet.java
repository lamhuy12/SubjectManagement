/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.servlet;

import huyvl.cart.CartLessonObj;
import huyvl.history.HistoryDAO;
import huyvl.lesson.LessonDAO;
import huyvl.lesson.LessonDTO;
import huyvl.lessonDetail.LessonDetailDAO;
import huyvl.subject.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HUYVU
 */
@WebServlet(name = "AddLessonToSubjectServlet", urlPatterns = {"/AddLessonToSubjectServlet"})
public class AddLessonToSubjectServlet extends HttpServlet {

    private final String SUBJECT_PAGE = "subject.jsp";

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String url = SUBJECT_PAGE;

        try {
            HttpSession session = request.getSession(false);
            CartLessonObj cartObj = (CartLessonObj) session.getAttribute("CARTLESSON");
//        HashMap<LessonDTO, String> compCart = (HashMap<LessonDTO, String>) session.getAttribute("COMPCART");

            HashMap<String, ArrayList<String>> cart = cartObj.getCart();
            HashMap<String, LessonDTO> listLesson = cartObj.getListLesson();

            Iterator it = listLesson.keySet().iterator();
            while (it.hasNext()) {
                String lessonID = (String) it.next();
                LessonDAO lessonDAO = new LessonDAO();

                try {

                    if (lessonDAO.findPrimaryKey(lessonID) == null) {
                        LessonDTO dto = listLesson.get(lessonID);
                        lessonDAO.AddLessontoDB(dto.getLessonID(), dto.getName(), dto.getTheory(), dto.getExam(), dto.getTest());
                    }
                } catch (Exception e) {
                }
            }

            it = cart.keySet().iterator();
            while (it.hasNext()) {
                String lessonID = (String) it.next();
                ArrayList<String> listSubID = cart.get(lessonID);

                for (String subID : listSubID) {
                    LessonDetailDAO lessonDetailDAO = new LessonDetailDAO();

                    try {
                        if (!lessonDetailDAO.checkExit(lessonID, subID)) {
                            lessonDetailDAO.addLessonDetail(lessonID, subID);
                        }
                    } catch (Exception e) {
                    }
                }
            }

            HistoryDAO historyDAO = new HistoryDAO();
            boolean history = historyDAO.history("AddLessonToSubject", new Date());

            session.removeAttribute("CARTLESSON");
            session.removeAttribute("COMPCART");

        } catch (NamingException ex) {
            log("AddLessonToSubject_NamingException: " + ex.getMessage());
        } catch (SQLException ex) {
            log("AddLessonToSubject_SQLException: " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
