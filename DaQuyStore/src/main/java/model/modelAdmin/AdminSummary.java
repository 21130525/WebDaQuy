package model.modelAdmin;

import java.sql.Date;

public class AdminSummary {
   private int summary;
   private int month;

    public AdminSummary() {
    }

    public int getSummary() {
        return summary;
    }

    public void setSummary(int summary) {
        this.summary = summary;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "AdminSummary{" +
                "summary=" + summary +
                ", month=" + month +
                '}';
    }
}
