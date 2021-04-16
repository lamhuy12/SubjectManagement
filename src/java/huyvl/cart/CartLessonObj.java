/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.cart;

import huyvl.lesson.LessonDTO;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author HUYVU
 */
public class CartLessonObj {

    private String teacherName;
    private HashMap<String, ArrayList<String>> cart;
    private HashMap<String, LessonDTO> listLesson;

    public CartLessonObj(String teacherName) {
        this.teacherName = teacherName;
    }

    public CartLessonObj() {
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public HashMap<String, ArrayList<String>> getCart() {
        return cart;
    }

    public HashMap<String, LessonDTO> getListLesson() {
        return listLesson;
    }

    public void setListLesson(HashMap<String, LessonDTO> listLesson) {
        this.listLesson = listLesson;
    }

    public void setCart(HashMap<String, ArrayList<String>> cart) {
        this.cart = cart;
    }

    public void addLessonToCart(LessonDTO dto, String subID) {
        if (cart == null) {
            cart = new HashMap<>();
        }

        if (listLesson == null) {
            listLesson = new HashMap<>();
        }

        if (cart.containsKey(dto.getLessonID())) {
            ArrayList<String> listSubID = this.cart.get(dto.getLessonID());
            if (!listSubID.contains(subID)) {
                listSubID.add(subID);
            }
            cart.put(dto.getLessonID(), listSubID);
        } else {
            ArrayList<String> listSubID = new ArrayList<>();
            listSubID.add(subID);
            cart.put(dto.getLessonID(), listSubID);
            listLesson.put(dto.getLessonID(), dto);
        }
    }

    public void removeCart(String lessonID, String subID) {
        if (this.listLesson == null) {
            return;
        }

        if (listLesson.containsKey(lessonID)) {
            this.cart.get(lessonID).remove(subID);
        }
        
    }
}
