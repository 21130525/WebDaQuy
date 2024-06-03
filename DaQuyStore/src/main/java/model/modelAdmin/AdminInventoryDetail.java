package model.modelAdmin;

import java.util.Date;

public class AdminInventoryDetail {
    private int id;
    private int product_id;
    private int quantity;
    private float price;
    private AdminInventory adminInventory;
    private String name;
    private Date date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public AdminInventoryDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public AdminInventory getAdminInventory() {
        return adminInventory;
    }

    public void setAdminInventory(AdminInventory adminInventory) {
        this.adminInventory = adminInventory;
    }

    @Override
    public String toString() {
        return "AdminInventoryDetail{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", date=" + date +
                '}';
    }
}
