/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.lesson;

import java.io.Serializable;

/**
 *
 * @author HUYVU
 */
public class LessonDTO implements Serializable {

    private String lessonID;
    private String name;
    private String theory;
    private String exam;
    private String test;

    public LessonDTO() {
    }

    public LessonDTO(String lessonID, String name, String theory, String exam, String test) {
        this.lessonID = lessonID;
        this.name = name;
        this.theory = theory;
        this.exam = exam;
        this.test = test;;
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

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the theory
     */
    public String getTheory() {
        return theory;
    }

    /**
     * @param theory the theory to set
     */
    public void setTheory(String theory) {
        this.theory = theory;
    }

    /**
     * @return the exam
     */
    public String getExam() {
        return exam;
    }

    /**
     * @param exam the exam to set
     */
    public void setExam(String exam) {
        this.exam = exam;
    }

    /**
     * @return the test
     */
    public String getTest() {
        return test;
    }

    /**
     * @param test the test to set
     */
    public void setTest(String test) {
        this.test = test;
    }

    @Override
    public String toString() {
        return "LessonDTO{" + "lessonID=" + lessonID + ", name=" + name + ", theory=" + theory + ", exam=" + exam + ", test=" + test + '}';
    }
}
