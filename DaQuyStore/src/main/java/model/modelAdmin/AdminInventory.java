package model.modelAdmin;
import java.util.Date;

public class AdminInventory {
    private int id;
    private Date date;
    private AdminUsers user;

    public AdminInventory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public AdminUsers getUser() {
        return user;
    }

    public void setUser(AdminUsers user) {
        this.user = user;
    }
}
