package model.modelAdmin;

public class AdminInventoryDetail {
    private int id;
    private int product_id;
    private int quantity;
    private float price;
    private AdminInventory adminInventory;

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
}
