/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyvl.history;

import java.util.Date;

/**
 *
 * @author HUYVU
 */
public class HistoryDTO {
    private String notification;
    private String dateOfChange;

    public HistoryDTO() {
    }

    public HistoryDTO(String notification, String dateOfChange) {
        this.notification = notification;
        this.dateOfChange = dateOfChange;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getDateOfChange() {
        return dateOfChange;
    }

    public void setDateOfChange(String dateOfChange) {
        this.dateOfChange = dateOfChange;
    }
    
    
}
