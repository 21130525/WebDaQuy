package model.modelAdmin;

import java.util.Date;

public class AdminSummary {
   private int summary;
   private Date month;

    public AdminSummary() {
    }

    public int getSummary() {
        return summary;
    }

    public void setSummary(int summary) {
        this.summary = summary;
    }

    public Date getMonth() {
        return month;
    }

    public void setMonth(Date month) {
        this.month = month;
    }
}
