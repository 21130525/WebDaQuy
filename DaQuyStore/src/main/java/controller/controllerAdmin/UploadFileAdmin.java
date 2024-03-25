package controller.controllerAdmin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 10000, maxRequestSize = 10000, maxFileSize = 10000)
@WebServlet("/admin-upload")
public class UploadFileAdmin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("file");
        String fileName = part.getSubmittedFileName();
        if(part!=null){
            File file=new File(req.getContextPath()+fileName);
            file.createNewFile();
        }
    }
}

