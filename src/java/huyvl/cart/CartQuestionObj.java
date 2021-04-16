/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.cart;

import huyvl.question.QuestionDTO;
import java.util.HashMap;

/**
 *
 * @author HUYVU
 */
public class CartQuestionObj {

    private HashMap<String, QuestionDTO> question;

    public HashMap<String, QuestionDTO> getQuestion() {
        return question;
    }

    public void addQuestionToCart(QuestionDTO dto) {
        if (this.question == null) {
            this.question = new HashMap<>();
        }

        if (this.question.containsKey(dto.getQuestionID())) {
            return;
        }

        this.question.put(dto.getQuestionID(), dto);
    }

    public void removedQuestion(String questionID) {
        if (this.question == null) {
            return;
        }

        if (this.question.containsKey(questionID)) {
            this.question.remove(questionID);
            if (this.question == null) {
                return;
            }
        }
    }
}
