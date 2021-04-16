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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AddQuestionToCartServlet", urlPatterns = {"/AddQuestionToCartServlet"})
public class AddQuestionToCartServlet extends HttpServlet {

    private final String QUESTION_PAGE = "GetListQuestionServlet";

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

        String questionID = request.getParameter("txtQuestionID");
        String lessonID = request.getParameter("txtLessonID");
        String url = QUESTION_PAGE;
        try {
            QuestionDAO questionDAO = new QuestionDAO();
            QuestionDTO questionDTO = questionDAO.findPrimaryKey(questionID);
            
            questionDTO.setLessonID(lessonID);

            HttpSession session = request.getSession();
            CartQuestionObj questionCart = (CartQuestionObj) session.getAttribute("QUESTIONCART");
            if (questionCart == null) {
                questionCart = new CartQuestionObj();
            }
            questionCart.addQuestionToCart(questionDTO);
            
            session.setAttribute("QUESTIONCART", questionCart);
            request.setAttribute("LEID", lessonID);
            
            HistoryDAO historyDAO = new HistoryDAO();
            boolean history = historyDAO.history("AddQuestionToCartServlet", new Date());

        } catch (Exception ex) {
            log("AddQuestionToCartServlet_Exception: " + ex.getMessage());
        } finally {
//            response.sendRedirect(url);
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
