package model.modelAdmin;

public class ProductAdmin {
    int id;
    String product_name;
    int price;
    String status;
    int sale;
    int hot;
    String color;
    public ProductAdmin(){
    }

    public ProductAdmin(int id, String product_name, int price, String status, int sale, int hot) {
        this.id=id;
        this.product_name = product_name;
        this.price = price;
        this.status = status;
        this.sale = sale;
        this.hot = hot;
        this.color = color;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
