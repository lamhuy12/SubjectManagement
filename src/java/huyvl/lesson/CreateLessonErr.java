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
public class CreateLessonErr implements Serializable{
    private String lessonIDLengthErr;
    private String lessonLengthErr;
    private String theoryLengthErr;
    private String examLengthErr;
    private String testLengthErr;
    private String lessonIDIsExisted;

    public CreateLessonErr() {
    }

    public CreateLessonErr(String lessonIDLengthErr, String lessonLengthErr, String theoryLengthErr, String examLengthErr, String testLengthErr, String lessonIDIsExisted) {
        this.lessonIDLengthErr = lessonIDLengthErr;
        this.lessonLengthErr = lessonLengthErr;
        this.theoryLengthErr = theoryLengthErr;
        this.examLengthErr = examLengthErr;
        this.testLengthErr = testLengthErr;
        this.lessonIDIsExisted = lessonIDIsExisted;
    }

    /**
     * @return the lessonIDLengthErr
     */
    public String getLessonIDLengthErr() {
        return lessonIDLengthErr;
    }

    /**
     * @param lessonIDLengthErr the lessonIDLengthErr to set
     */
    public void setLessonIDLengthErr(String lessonIDLengthErr) {
        this.lessonIDLengthErr = lessonIDLengthErr;
    }

    /**
     * @return the lessonLengthErr
     */
    public String getLessonLengthErr() {
        return lessonLengthErr;
    }

    /**
     * @param lessonLengthErr the lessonLengthErr to set
     */
    public void setLessonLengthErr(String lessonLengthErr) {
        this.lessonLengthErr = lessonLengthErr;
    }

    /**
     * @return the theoryLengthErr
     */
    public String getTheoryLengthErr() {
        return theoryLengthErr;
    }

    /**
     * @param theoryLengthErr the theoryLengthErr to set
     */
    public void setTheoryLengthErr(String theoryLengthErr) {
        this.theoryLengthErr = theoryLengthErr;
    }

    /**
     * @return the examLengthErr
     */
    public String getExamLengthErr() {
        return examLengthErr;
    }

    /**
     * @param examLengthErr the examLengthErr to set
     */
    public void setExamLengthErr(String examLengthErr) {
        this.examLengthErr = examLengthErr;
    }

    /**
     * @return the testLengthErr
     */
    public String getTestLengthErr() {
        return testLengthErr;
    }

    /**
     * @param testLengthErr the testLengthErr to set
     */
    public void setTestLengthErr(String testLengthErr) {
        this.testLengthErr = testLengthErr;
    }

    /**
     * @return the lessonIDIsExisted
     */
    public String getLessonIDIsExisted() {
        return lessonIDIsExisted;
    }

    /**
     * @param lessonIDIsExisted the lessonIDIsExisted to set
     */
    public void setLessonIDIsExisted(String lessonIDIsExisted) {
        this.lessonIDIsExisted = lessonIDIsExisted;
    }
    
    
}
