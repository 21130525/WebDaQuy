package model;


import java.util.Date;

public class Day {
    int year;
    int month;
    int day;

    int hour;
    int minute;
    int second;
    public static Day instance;
    public static Day getInstance() {
        if (instance == null) {
            instance = new Day();
        }
        return instance;
    }
    public Day() {}
    public Day(int year, int month, int day, int hour, int minute, int second) {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    public Day getNow(){
        Date currentDate = new Date();
        return new Day(currentDate.getYear(), currentDate.getMonth(), currentDate.getDate(), currentDate.getHours(), currentDate.getMinutes(), currentDate.getSeconds());
    }
}
