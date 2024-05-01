package model.modelAdmin;

import java.sql.Time;
import java.sql.Timestamp;

public class AdminLog {
    String id;
    String ipaddress;
    String prevValue;
    String currentValue;
    Timestamp created_at;
    public AdminLog(){

    }
    public AdminLog(String prevValue,String currentValue){
        this.prevValue=prevValue;
        this.currentValue=currentValue;
    }
    public AdminLog(String id, String ipaddress, String prevValue, String currentValue,Timestamp created_at) {
        this.id = id;
        this.ipaddress = ipaddress;
        this.prevValue = prevValue;
        this.currentValue = currentValue;
        this.created_at=created_at;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getPrevValue() {
        return prevValue;
    }

    public void setPrevValue(String prevValue) {
        this.prevValue = prevValue;
    }

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "AdminLog{" +
                "prevValue='" + prevValue + '\'' +
                ", currentValue='" + currentValue + '\'' +
                '}';
    }
}

