package filter;

public class CartResponse {
    private int reponseCode;
    private String message;
    private long totalCartValue;

    public CartResponse(int reponseCode,String message, long totalCartValue) {
        this.reponseCode=reponseCode;
        this.message = message;
        this.totalCartValue = totalCartValue;
    }

    public int getReponseCode() {
        return reponseCode;
    }

    public void setReponseCode(int reponseCode) {
        this.reponseCode = reponseCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getTotalCartValue() {
        return totalCartValue;
    }

    public void setTotalCartValue(long totalCartValue) {
        this.totalCartValue = totalCartValue;
    }
}
