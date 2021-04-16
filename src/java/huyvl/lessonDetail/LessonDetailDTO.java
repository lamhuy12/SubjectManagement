/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.lessonDetail;

/**
 *
 * @author HUYVU
 */
public class LessonDetailDTO {
    private String lessonID;
    private String subID;

    public LessonDetailDTO(String lessonID, String subID) {
        this.lessonID = lessonID;
        this.subID = subID;
    }

    public LessonDetailDTO() {
    }

    public String getLessonID() {
        return lessonID;
    }

    public void setLessonID(String lessonID) {
        this.lessonID = lessonID;
    }

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
}
