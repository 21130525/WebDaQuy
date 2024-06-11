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
   private String product_name;
   private  int total_quantity;
   //thuộc tính biểu thị trạng thái còn hàng trong bảng
   private String status;

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

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
