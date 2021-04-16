/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.question;

import java.io.Serializable;

/**
 *
 * @author HUYVU
 */
public class QuestionDTO implements Serializable{
    private String questionID;
    private String question;
    private String lessonID;

    public QuestionDTO() {
    }

    public QuestionDTO(String questionID, String question, String lessonID) {
        this.questionID = questionID;
        this.question = question;
        this.lessonID = lessonID;
    }

    /**
     * @return the questionID
     */
    public String getQuestionID() {
        return questionID;
    }

    /**
     * @param questionID the questionID to set
     */
    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    /**
     * @return the question
     */
    public String getQuestion() {
        return question;
    }

    /**
     * @param question the question to set
     */
    public void setQuestion(String question) {
        this.question = question;
    }

    /**
     * @return the lessonID
     */
    public String getLessonID() {
        return lessonID;
    }

    /**
     * @param lessonID the lessonID to set
     */
    public void setLessonID(String lessonID) {
        this.lessonID = lessonID;
    }

    
    
}
