package controller.controllerAdmin.managesummary;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/admin-chart",urlPatterns = {"/admin","/action"
})
public class AdminChart extends HttpServlet {
    public AdminChart() throws FileNotFoundException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
//        Gson gson = new Gson();
//        List<Student> studentList = new ArrayList<>();
//        Student st1 = new Student("Hung", "1.73m");
//        Student st2 = new Student("Tan", "1.75m");
//        studentList.add(st1);
//        studentList.add(st2);
//        String listjson = gson.toJson(studentList);
//        String filename = "D:\\TestJson\\data.json";
//        File file = new File(filename);
//        file.createNewFile();
//        FileWriter fileWriter = new FileWriter(filename);
//        fileWriter.write(listjson);
//        fileWriter.close();
//        resp.getWriter().println("Da them thanh cong du lieu");
//    }
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet sheet=workbook.createSheet("Summary");
        XSSFRow row=null;
        Cell cell=null;
        row=sheet.createRow(0);
        cell=row.createCell(0);
        cell.setCellValue("Product Name");
        List<Product> products=new ArrayList<>();
        File file=new File("data.xlxs");
        FileOutputStream fos=new FileOutputStream(file);
        workbook.write(fos);
        }


    }


