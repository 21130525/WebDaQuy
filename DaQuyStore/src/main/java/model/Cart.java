package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class Cart implements Serializable {
    //    public static ArrayList<Product> products=new ArrayList<>();
//    public static void  addProduct(Product product){
//        products.add(product);
//    }
//    public static void removeProduct(Product product){
//        products.remove(product);
//    }
    public List<Items> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public List<Items> getItems() {
        return items;
    }

    public void setItems(List<Items> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Items getItemById(int id) {
        for (Items i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Items item) {
        if (getItemById(item.getProduct().getId()) != null) {
            Items i = getItemById(item.getProduct().getId());
            i.setQuantity(i.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double price = 0;
        for (Items i : items) {
            price += (i.getQuantity() * i.getPrice());
        }
        return price;
    }
    private Product getProductById(int id, List<Product> list){
        for(Product p : list){
            if(p.getId()==id){
                return p;
            }
        }
        return null;

    }
    public Cart(String txt , List<Product> list){
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split(",");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    Items ite = new Items(p,quantity,p.getPrice());
                    addItem(ite);
                }
            }
        }catch (NumberFormatException e){

        }
    }

}
