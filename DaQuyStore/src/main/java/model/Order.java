package model;

import java.util.Date;

public class Order {
    private int id;
    private int idUser;
    private Date created_at;
    private Date updated_at;
    private double total_price;
    private String status;

    public Order(int id, int idUser, Date created_at, Date updated_at, double total_price, String status) {
        this.id = id;
        this.idUser = idUser;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.total_price = total_price;
        this.status = status;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
