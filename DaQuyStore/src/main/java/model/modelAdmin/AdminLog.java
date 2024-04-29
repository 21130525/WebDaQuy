package model.modelAdmin;

public class AdminLog {
    String id;
    String ipaddress;
    String prevValue;
    String currentValue;

    public AdminLog(String id, String ipaddress, String prevValue, String currentValue) {
        this.id = id;
        this.ipaddress = ipaddress;
        this.prevValue = prevValue;
        this.currentValue = currentValue;
    }

}
