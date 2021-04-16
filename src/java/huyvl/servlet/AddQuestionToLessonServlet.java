/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.servlet;

import huyvl.cart.CartQuestionObj;
import huyvl.history.HistoryDAO;
import huyvl.question.QuestionDAO;
import huyvl.question.QuestionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.naming.NamingException;
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
@WebServlet(name = "AddQuestionToLessonServlet", urlPatterns = {"/AddQuestionToLessonServlet"})
public class AddQuestionToLessonServlet extends HttpServlet {

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
            if (session != null) {
                CartQuestionObj cartQuestion = (CartQuestionObj) session.getAttribute("QUESTIONCART");
                if (cartQuestion != null) {
                    HashMap<String, QuestionDTO> questions = cartQuestion.getQuestion();
                    if (questions != null) {
                        QuestionDAO questionDAO = new QuestionDAO();

                        boolean result = false;
                        Iterator it = questions.keySet().iterator();
                        while (it.hasNext()) {
                            String key = (String) it.next();
                            QuestionDTO dto = questions.get(key);
                            System.out.println(dto.getLessonID() + "-" + dto.getQuestionID());
                            if (!questionDAO.checkExist(dto.getQuestionID(), dto.getLessonID())) {
                                result = questionDAO.addQuestionToDB(dto.getQuestionID(), dto.getQuestion(), dto.getLessonID());

                                HistoryDAO historyDAO = new HistoryDAO();
                                boolean history = historyDAO.history("AddQuestionToLessonServlet", new Date());
                            }
                        }
                        if (result == true) {
                            session.removeAttribute("QUESTIONCART");
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            log("AddQuestionToLessonServlet_SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddQuestionToLessonServlet_Naming " + ex.getMessage());
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
