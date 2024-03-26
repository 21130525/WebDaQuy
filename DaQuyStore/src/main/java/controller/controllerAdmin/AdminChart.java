package controller.controllerAdmin;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin-chart")
public class AdminChart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        List<Student> studentList = new ArrayList<>();
        Student st1 = new Student("Hung", "1.73m");
        Student st2 = new Student("Tan", "1.75m");
        studentList.add(st1);
        studentList.add(st2);
        String listjson = gson.toJson(studentList);
        String filename = "D:\\TestJson\\data.json";
        File file = new File(filename);
        file.createNewFile();
        FileWriter fileWriter = new FileWriter(filename);
        fileWriter.write(listjson);
        fileWriter.close();
        resp.getWriter().println("Da them thanh cong du lieu");
    }
}
