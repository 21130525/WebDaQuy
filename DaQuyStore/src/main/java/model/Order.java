package model;

import java.util.Date;
import java.util.Map;

public class Order implements IModel {
    private int id;
    private User User;
    private Day created_at;
    private Day updated_at;
    private Map<Product, Integer> products;
    private double total_price;
    private String status;
    private String address;

    public Order( model.User user,String address, Day created_at,Map<Product,Integer> products, String status) {
        this.id = id;
        this.User = user;
        this.address = address;
        this.products = products;
        this.created_at = created_at;
        this.total_price = getTotalPrice(products);
        this.status = status;
    }

    private double getTotalPrice(Map<Product, Integer> products) {
        double result = 0;
        for (Map.Entry<Product, Integer> entry : products.entrySet()) {
            result += entry.getValue() * entry.getKey().getPrice();
        }
        return result;
    }

    @Override
    public String getTable() {
        return "";
    }

    @Override
    public String getDataBefore() {
        return "";
    }

    @Override
    public String getDataAfter() {
        return "";
    }
}
