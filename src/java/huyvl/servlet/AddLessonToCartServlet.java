/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.servlet;

import huyvl.cart.CartLessonObj;
import huyvl.history.HistoryDAO;
import huyvl.lesson.CreateLessonErr;
import huyvl.lesson.LessonDAO;
import huyvl.lesson.LessonDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AddLessonToCartServlet", urlPatterns = {"/AddLessonToCartServlet"})
public class AddLessonToCartServlet extends HttpServlet {

    private final String ADDLESSON_AVAIABLE = "AddLessonAvailable";
    private final String ADDLESSON_NEW = "AddLessonForm";
    private final String ADDLESSON_ERR = "addLesson.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String condition = request.getParameter("blabla");
        String url = ADDLESSON_ERR;

        try {
            HttpSession session = request.getSession();
            CartLessonObj cart = (CartLessonObj) session.getAttribute("CARTLESSON");
            if (cart == null) {
                cart = new CartLessonObj("teacher");
            }

            if (condition.equals("addAvailable")) {
                String lessonIDRaw = request.getParameter("lesson");
                String subjectIDRaw = request.getParameter("subjectID");

                String lessonID = lessonIDRaw.substring(0, lessonIDRaw.indexOf("-")).trim();
                String subjectID = subjectIDRaw.substring(0, subjectIDRaw.indexOf("-")).trim();

                LessonDAO dao = new LessonDAO();
                LessonDTO dto = dao.findPrimaryKey(lessonID);
                cart.addLessonToCart(dto, subjectID);

                url = ADDLESSON_AVAIABLE;

                HistoryDAO historyDAO = new HistoryDAO();
                boolean history = historyDAO.history("AddAvailableLessonToCart", new Date());
            } else if (condition.equals("addNew")) {
                String lessonIDNew = request.getParameter("txtLessonID");
                String nameNew = request.getParameter("txtLessonName");
                String theoryNew = request.getParameter("txtTheory");
                String examNew = request.getParameter("txtExam");
                String testNew = request.getParameter("txtTest");
                String subjectNewRaw = request.getParameter("cbsubjectID");
                String subjectNew = subjectNewRaw.substring(0, subjectNewRaw.indexOf("-")).trim();

                CreateLessonErr err = new CreateLessonErr();
                boolean checkErrLesson = false;
                if (lessonIDNew.trim().length() < 1 || lessonIDNew.trim().length() > 50) {
                    checkErrLesson = true;
                    err.setLessonIDLengthErr("Chars must be from 1 to 50");
                }
                if (nameNew.trim().length() < 1 || nameNew.trim().length() > 50) {
                    checkErrLesson = true;
                    err.setLessonLengthErr("Chars must be from 1 to 50");
                }
                if (theoryNew.trim().length() < 1 || theoryNew.trim().length() > 50) {
                    checkErrLesson = true;
                    err.setTheoryLengthErr("Chars must be from 1 to 50");
                }
                if (examNew.trim().length() < 1 || examNew.trim().length() > 50) {
                    checkErrLesson = true;
                    err.setExamLengthErr("Chars must be from 1 to 50");
                }

                if (checkErrLesson == true) {
                    request.setAttribute("LESSONERR", err);
                } else {
                    LessonDTO dto = new LessonDTO(lessonIDNew, nameNew, theoryNew, examNew, testNew);
                    cart.addLessonToCart(dto, subjectNew);
                    url = ADDLESSON_NEW;

                    HistoryDAO historyDAO = new HistoryDAO();
                    boolean history = historyDAO.history("AddNewLessonToCart", new Date());
                }
            }

            session.setAttribute("CARTLESSON", cart);

        } catch (Exception e) {
            log("AddLessonToCartServlet_Exception: " + e.getMessage());
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddLessonToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddLessonToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
