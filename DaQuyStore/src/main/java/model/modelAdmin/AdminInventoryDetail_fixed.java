package model.modelAdmin;

import java.sql.Timestamp;

/*
class này dùng để đại diện cho việc lấy số lượng sản phẩm do class AdminInventoryDetail bị lỗi khi lấy dữ liệu
 */
public class AdminInventoryDetail_fixed {

    private int product_id;
    private String product_name;
    private int total_quantity;
    private String status;
    private Timestamp created_at;
    public AdminInventoryDetail_fixed() {
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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
