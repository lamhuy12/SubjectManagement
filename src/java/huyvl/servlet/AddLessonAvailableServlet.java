/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.servlet;

import huyvl.history.HistoryDAO;
import huyvl.lesson.LessonDAO;
import huyvl.lesson.LessonDTO;
import huyvl.subject.SubjectDAO;
import huyvl.subject.SubjectDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "AddLessonAvailableServlet", urlPatterns = {"/AddLessonAvailableServlet"})
public class AddLessonAvailableServlet extends HttpServlet {

    private final String ADDLESSON_AVAIlABLE = "addLessonAvailable.jsp";
    private final String ADDLESSON_ERROR = "addLessonErr.jsp";

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

        String url = ADDLESSON_ERROR;
        try {
            LessonDAO dao = new LessonDAO();
            List<LessonDTO> listLesson = dao.getListLesson();

            SubjectDAO subDAO = new SubjectDAO();
            List<SubjectDTO> listSubject = subDAO.getListSubject();

            if (listLesson.isEmpty()) {
                url = ADDLESSON_ERROR;
                HistoryDAO historyDAO = new HistoryDAO();
                boolean history = historyDAO.history("AddLessonError", new Date());
            } else {
                url = ADDLESSON_AVAIlABLE;
                request.setAttribute("LISTLESSON", listLesson);
                request.setAttribute("LISTSUBJECT", listSubject);
                HistoryDAO historyDAO = new HistoryDAO();
                boolean history = historyDAO.history("AddAvailableLesson", new Date());
            }
        } catch (Exception e) {
            log("AddLessonAvailable_Exception: " + e.getMessage());
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
