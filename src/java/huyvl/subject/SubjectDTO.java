/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.subject;

import huyvl.lesson.LessonDTO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author HUYVU
 */
public class SubjectDTO implements Serializable {

    private String subID;
    private String subjectName;

    private List<LessonDTO> listLesson;

    public List<LessonDTO> getListLesson() {
        return listLesson;
    }

    public SubjectDTO() {
    }

    public SubjectDTO(String subID, String subjectName) {
        this.subID = subID;
        this.subjectName = subjectName;
    }

    /**
     * @return the subID
     */
    public String getSubID() {
        return subID;
    }

    /**
     * @param subID the subID to set
     */
    public void setSubID(String subID) {
        this.subID = subID;
    }

    /**
     * @return the subjectName
     */
    public String getSubjectName() {
        return subjectName;
    }

    /**
     * @param subjectName the subjectName to set
     */
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    /**
     * @param listLesson the listLesson to set
     */
    public void setListLesson(List<LessonDTO> listLesson) {
        this.listLesson = listLesson;
    }

    
    
}
