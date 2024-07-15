package model;

import java.util.Collection;
import java.util.TreeMap;

public class Cart extends Product {
    TreeMap<String, Product> data;

    public Cart() {
        this.data = new TreeMap<>();
    }

    public Product get(String id) {
        return data.get(id);
    }

    public int getQuantity_cart() {
        int count = 0;
        for (String id : data.keySet()) {
            count += data.get(id).getQuantity();
        }
        return count;
    }

    public int put(String id, Product pd) {
        if (data.containsKey(id)) {
            Product temp = data.get(id);
            temp.setQuantity(temp.getQuantity() + pd.getQuantity());
            data.put(id, temp);
        } else {
            data.put(id, pd);
        }
        return data.get(id).getQuantity();
    }

    public boolean remove(String id) {
        return data.remove(id) == null;
    }

    public Collection<Product> list() {
        return data.values();
    }

    public TreeMap<String, Product> getData() {
        return data;
    }

    public double total() {
        double sum = 0;
        for (Product p : data.values()) {
            sum += (p.getQuantity() * p.getPrice());
        }
        return sum;
    }

    public void clear() {
        data.clear();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "data=" + data +
                '}';
    }
}
