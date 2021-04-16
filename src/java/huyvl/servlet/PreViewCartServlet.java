package huyvl.servlet;

import huyvl.cart.CartLessonObj;
import huyvl.lesson.LessonDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PreViewCartServlet", urlPatterns = {"/PreViewCartServlet"})
public class PreViewCartServlet extends HttpServlet {
    
    private final String cartAddLesson = "cartAddLesson.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        CartLessonObj cartObj = (CartLessonObj) session.getAttribute("CARTLESSON");

        HashMap<LessonDTO, String> compCart = new HashMap<>();

        if (cartObj != null) {
            HashMap<String, LessonDTO> listLesson = cartObj.getListLesson();
            HashMap<String, ArrayList<String>> cart = cartObj.getCart();

            Iterator it = cart.keySet().iterator();
            while (it.hasNext()) {
                String key = (String) it.next();
                ArrayList<String> listSubID = cart.get(key);

                for (String st : listSubID) {
                    LessonDTO buff = listLesson.get(key);

                    LessonDTO dto = new LessonDTO();
                    dto.setLessonID(buff.getLessonID());
                    dto.setName(buff.getName());
                    dto.setTheory(buff.getTheory());
                    dto.setExam(buff.getExam());
                    dto.setTest(buff.getTest());

                    compCart.put(dto, st);
                }
            }
        }
        
        session.setAttribute("COMPCART", compCart);
        
        response.sendRedirect(cartAddLesson);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
