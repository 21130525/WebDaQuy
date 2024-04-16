package service.manageproduct;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;


public class UploadImageService extends HttpServlet {
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            // Khởi tạo một mảng byte để lưu dữ liệu từ phần tải lên
            byte[] data = new byte[(int) part.getSize()];

            // Đọc dữ liệu từ phần tải lên vào mảng byte
            InputStream is = part.getInputStream();
            is.read(data);
            is.close();

            // Khởi tạo Cloudinary object
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "dvarqsigv",
                    "api_key", "312676887848818",
                    "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));

            // Upload ảnh lên Cloudinary
            cloudinary.uploader().upload(data, ObjectUtils.emptyMap());
        }
    }
}
