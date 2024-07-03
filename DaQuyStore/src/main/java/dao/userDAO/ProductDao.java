package dao.userDAO;

import connector.DAOConnection;
import model.IModel;
import model.ImageProduct;
import model.Product;
import model.Product_Detail;
import service.manageUser.product.ProductService;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductDao implements IDAO<Product> {


    private int id;
    private String category_id;
    private String product_name;
    private double price;
    private String status;
    private int sale;
    private int hot;
    private String description;
    private String information;
    private Date created_at;
    private Date updated_at;
    private Date deleted_at;
    private String img_main;
    private String img_1;
    private String img_2;
    private String img_3;
    private String img_4;

    public static ProductDao getInstance() {
        return new ProductDao();
    }

    @Override
    public boolean insert(Product product, String action, String ipAddress) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Product product, String action, String ipAddress) throws SQLException {
        return false;
    }

    @Override
    public int delete(Product p, String action, String ipAddress) throws SQLException {
        return 0;
    }

    @Override
    public Product selectById(String id, String action, String ipAddress) throws SQLException {
        return null;
    }

    //hàm này dùng để truy vấn dữ liệu chi tiết của 1 sản phẩm dựa trên tên
    public Product_Detail getInformationForPerProduct(String product_name) throws SQLException {
        String sql = "Select categories.category_name,products.product_name,products.price,products.status,products.description,products.information,product_image.img_main,product_image.img_1,product_image.img_2,product_image.img_3,product_image.img_4 from products join categories on categories.id=products.categories_id join product_image on product_image.id=products.id where product_name=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, product_name);
        ResultSet rs = pr.executeQuery();
        Product_Detail product;
        while (rs.next()) {

            //tao object
            product = new Product_Detail();
            String info = rs.getString("information");
            String sub_string_infor=info.substring(1,info.indexOf(info.length()-2));
            String[] split=sub_string_infor.split(",");
            for (int i = 0; i < split.length; i++) {
                if(split[i].contains("color")) {
                    int startIndex=split[i].indexOf(":",split[i].indexOf("color"));
                    int endIndex=split[i].length();
                    String sub_string=split[i].substring(startIndex,endIndex);
                    product.setColor(sub_string);
                }else if(split[i].contains("weight")) {

                }else if(split[i].contains("size")) {

                }else if(split[i].contains("opacity")) {

                }else if(split[i].contains("cutting_form")) {

                }
            }
        }
        return null;
    }

//    @Override
//    public Product selectById(String id, String action, String ipAddress) throws SQLException {
//        //TODO
//        Product product = null;
//        int product_id = 0, img_id = 0;
//        String category_id, name, status, description, infor;
//        String img_main = "", img_1 = "", img_2 = "", img_3 = "", img_4 = "";
//        double price;
//        Date created_at, updated_at, deleted_at;
//        int sale, hot;
//        String sql = "SELECT * FROM products p\n" +
//                "JOIN product_image i ON p.image_product = i.id  " +
//                " where p.id = ? ";
//        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
//        ps.setString(1, id);
//        ResultSet rs = ps.executeQuery();
//        if (rs.next()) {
//            product_id = rs.getInt(1);
//            category_id = rs.getString(2);
//            name = rs.getString(3);
//            price = rs.getDouble(4);
//            status = rs.getString(5);
//            sale = rs.getInt(6);
//            hot = rs.getInt(7);
//            description = rs.getString(8);
//            infor = rs.getString(9);
//            created_at = rs.getDate(10);
//            updated_at = rs.getDate(11);
//            deleted_at = rs.getDate(12);
//            img_id = rs.getInt(13);
//            if (img_id != 0) {
//                img_main = rs.getString(15);
//                img_1 = rs.getString(16);
//                img_2 = rs.getString(17);
//                img_3 = rs.getString(18);
//                img_4 = rs.getString(19);
//            }
//
//            Map<String, String> inf = ProductService.StringToMap(infor);
//            product = new Product(product_id, category_id, name, price, status, sale, hot, description, inf, created_at, updated_at, deleted_at, img_main, img_1, img_2, img_3, img_4);
//        }
//        return product;


    @Override
    public Product selectByName(String id, String action, String ipAddress) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<Product> selectAll() throws SQLException {
        return null;
    }

//    @Override
//    public ArrayList<Product> selectAll() throws SQLException {
//        String sql = " select * from products join product_image on products.image_product = product_image.id ";
//        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
//        ResultSet rs = pst.executeQuery();
//        ArrayList<Product> products = new ArrayList<>();
//        while (rs.next()) {
//            id = rs.getInt("id");
//            category_id = rs.getString("category_id");
//            product_name = rs.getString("product_name");
//            price = rs.getDouble("price");
//            status = (rs.getString("status")==null?"":rs.getString("status"));
//            sale = rs.getInt("sale");
//            hot = rs.getInt("hot");
//            description = (rs.getString("description")==null?"":rs.getString("description"));
//            information = (rs.getString("information")==null?"":rs.getString("information"));
//            created_at = rs.getDate("created_at");
//            updated_at = (rs.getDate("updated_at")==null?null:rs.getDate("created_at"));
//            deleted_at = (rs.getDate("deleted_at")==null?null:rs.getDate("updated_at"));
//            img_main = rs.getString("img_main");
//            img_1 = rs.getString("img_1");
//            img_2 = rs.getString("img_2");
//            img_3 = rs.getString("img_3");
//            img_4 = rs.getString("img_4");
//
//            Map<String, String> info = (new ProductService()).StringToMap(information);
//            Product p = new Product(id,category_id,product_name,price,status,sale,hot,description,info,created_at,updated_at,deleted_at,img_main,img_1,img_2,img_3,img_4);
//            products.add(p);
//        }
//        rs.close();
//        pst.close();
//        DAOConnection.getConnection().close();
//        return products;
//    }

    public ArrayList<Product> getListProductPerPage(int start, int end) throws SQLException {
        String sql = " select * from products join product_image on products.image_product = product_image.id  ORDER BY products.id LIMIT " + start + "," + end;
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<Product> products = new ArrayList<>();
        while (rs.next()) {
            id = rs.getInt("id");
            category_id = rs.getString("category_id");
            product_name = rs.getString("product_name");
            price = rs.getDouble("price");
            status = (rs.getString("status") == null ? "" : rs.getString("status"));
            sale = rs.getInt("sale");
            hot = rs.getInt("hot");
            description = (rs.getString("description") == null ? "" : rs.getString("description"));
            information = (rs.getString("information") == null ? "" : rs.getString("information"));
            created_at = rs.getDate("created_at");
            updated_at = (rs.getDate("updated_at") == null ? null : rs.getDate("created_at"));
            deleted_at = (rs.getDate("deleted_at") == null ? null : rs.getDate("updated_at"));
            img_main = rs.getString("img_main");
            img_1 = rs.getString("img_1");
            img_2 = rs.getString("img_2");
            img_3 = rs.getString("img_3");
            img_4 = rs.getString("img_4");
            Map<String, String> info = (new ProductService()).StringToMap(information);
            Product p = new Product(id, category_id, product_name, price, status, sale, hot, description, info, created_at, updated_at, deleted_at, img_main, img_1, img_2, img_3, img_4);
            products.add(p);
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return products;

    }

    // Truy van cua Categories
    public List<Product> getProductByCategory(String namecategory) throws SQLException {
        String sql = "SELECT products.id,products.category_id,products.product_name,\n" +
                "products.price,products.`status`,products.sale,products.hot,\n" +
                "products.description,products.information,products.created_at,\n" +
                "products.updated_at,products.deleted_at,product_image.img_main,\n" +
                "products.status_deleted FROM products \n" +
                "INNER JOIN product_image ON products.id = product_image.id \n" +
                "INNER JOIN  categories ON products.category_id = categories.id \n" +
                " WHERE categories.category_name=?;";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setString(1, namecategory);
        ResultSet rs = ps.executeQuery();
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            id = rs.getInt("id");
            category_id = rs.getString("category_id");
            product_name = rs.getString("product_name");
            price = rs.getDouble("price");
            status = (rs.getString("status") == null ? "" : rs.getString("status"));
            sale = rs.getInt("sale");
            hot = rs.getInt("hot");
            description = (rs.getString("description") == null ? "" : rs.getString("description"));
            information = (rs.getString("information") == null ? "" : rs.getString("information"));
            created_at = rs.getDate("created_at");
            updated_at = (rs.getDate("updated_at") == null ? null : rs.getDate("created_at"));
            deleted_at = (rs.getDate("deleted_at") == null ? null : rs.getDate("updated_at"));
            img_main = rs.getString("img_main");
            String status = rs.getString("status_deleted");
            Map<String, String> info = (new ProductService()).StringToMap(information);
            Product p = new Product(id, category_id, product_name, price, status, sale, hot, description, info, created_at, updated_at, deleted_at, img_main, status);
            list.add(p);
        }
        rs.close();
        ps.close();
        DAOConnection.getConnection().close();
        return list;
    }

    //hàm kiểm tra số lượng trước khi mua hàng
    public boolean checkExistQuantityItem(String productname) throws SQLException {
        String sql = "select sum(remaining) from inventory_detail join products on inventory_detail.product_id=products.id where products.product_name=? group by product_name";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, productname);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
//        System.out.println( (new ProductDao()).selectAll());
        System.out.println(new ProductDao().getProductByCategory("Ruby"));
    }


}
