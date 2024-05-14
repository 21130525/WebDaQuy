package controller.controllerAdmin.manageProduct;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.ProductAdmin;
import service.manageAdmin.manageProduct.DeleteProductService;
import service.manageAdmin.manageProduct.GetProductService;
import service.manageAdmin.manageProduct.SearchProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)    // 50MB
@WebServlet(name = "ManageProductController", urlPatterns = {"/addproduct_admin", "/deleteproduct_admin", "/filterproduct_admin", "/updateproduct_admin", "/findproduct_admin", "/getproduct_admin"})
public class ManageProductController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.endsWith("/addproduct_admin")) {
            // Xử lý thêm sản phẩm
            try {
                //lay cac gia tri tu form them san pham
                String productName = req.getParameter("productName");
                String price = req.getParameter("price");
                Part image_main = req.getPart("image-main");
                Part image_1 = req.getPart("image-1");
                Part image_2 = req.getPart("image-2");
                Part image_3 = req.getPart("image-3");
                Part image_4 = req.getPart("image-4");
                String link_image_main = req.getParameter("link-image-main");
                String link_image_1 = req.getParameter("link-image-1");
                String link_image_2 = req.getParameter("link-image-2");
                String link_image_3 = req.getParameter("link-image-3");
                String link_image_4 = req.getParameter("link-image-4");
                String description = req.getParameter("description");
                String product_type = req.getParameter("productType");
                // Khởi tạo một mảng byte để lưu dữ liệu từ phần tải lên
                byte[] data_image_main = new byte[(int) image_main.getSize()];
                byte[] data_image_1 = new byte[(int) image_1.getSize()];
                byte[] data_image_2 = new byte[(int) image_2.getSize()];
                byte[] data_image_3 = new byte[(int) image_3.getSize()];
                byte[] data_image_4 = new byte[(int) image_4.getSize()];
                //đưa dữ lieu anh vao mảng nhi phan
                image_main.getInputStream().read(data_image_main);
                image_1.getInputStream().read(data_image_1);
                image_2.getInputStream().read(data_image_2);
                image_3.getInputStream().read(data_image_3);
                image_4.getInputStream().read(data_image_4);
                // Khởi tạo Cloudinary object
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));

                // Upload ảnh lên Cloudinary
                cloudinary.uploader().upload(data_image_main, ObjectUtils.emptyMap());
                cloudinary.uploader().upload(data_image_1, ObjectUtils.emptyMap());
                cloudinary.uploader().upload(data_image_2, ObjectUtils.emptyMap());
                cloudinary.uploader().upload(data_image_3, ObjectUtils.emptyMap());
                cloudinary.uploader().upload(data_image_4, ObjectUtils.emptyMap());
                // Gửi thông báo thành công về client
                resp.getWriter().println("Đã gửi ảnh lên Cloudinary thành công: ");
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi gửi ảnh lên Cloudinary");
            }


        } else if (url.endsWith("/searchproduct")) {
            // Xử lý tim kiem sản phẩm
            String search = req.getParameter("search");
            SearchProductService service = new SearchProductService();
            try {
                resp.getWriter().println(service.getJSONResult(search));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            ;

        } else if (url.endsWith("/findproduct")) {
            // Xử lý tìm kiếm sản phẩm

        } else {
            // URL không hợp lệ
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.endsWith("/getproduct_admin")) {
            try {
                GetProductService getProductService = new GetProductService();
                getProductService.getProduct(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (uri.endsWith("/deleteproduct_admin")) {
            // Xử lý xóa sản phẩm
            int id = Integer.parseInt(req.getParameter("id"));
            DeleteProductService deleteProductService = new DeleteProductService();
            try {
                deleteProductService.delete(req, resp, id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else if (uri.endsWith("/updateproduct_admin")) {
            int id = Integer.parseInt(req.getParameter("id"));
            // Xử lý cập nhật sản phẩm
            ProductAdminDAO productAdminDAO=ProductAdminDAO.getInstance();

            try {
            ProductAdmin productAdmin=    productAdminDAO.selectByID(id);
                HttpSession session=req.getSession(true);
                session.setAttribute("productname",productAdmin.getProduct_name());
                session.setAttribute("price",productAdmin.getPrice());
                session.setAttribute("status",productAdmin.getStatus());
                RequestDispatcher rd=session.getServletContext().getRequestDispatcher("/views/admin/admin_form_update.jsp");
                rd.forward(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }
}