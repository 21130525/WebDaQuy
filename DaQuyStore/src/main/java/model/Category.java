package model;

import java.util.Date;

public class Category {
    private int id ;
    private String category_name;
    private Date create_at;
    private Date update_at;
    private Date delete_at;
    private String status;
    private String img;

    public Category(String category_name, Date create_at, Date update_at, Date delete_at, String status, String img) {
        this.category_name = category_name;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.status = status;
        this.img = img;
    }
    public Category() {

    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public Date getDelete_at() {
        return delete_at;
    }

    public void setDelete_at(Date delete_at) {
        this.delete_at = delete_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId(){return id;}

    public void setId(int id){this.id = id;}
}
