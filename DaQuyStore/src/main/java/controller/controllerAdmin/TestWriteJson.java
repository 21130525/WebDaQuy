package controller.controllerAdmin;

import com.google.gson.Gson;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TestWriteJson {
    public static void main(String[] args) throws IOException {
        Gson gson=new Gson();
        List<Student> studentList=new ArrayList<>();
        Student st1=new Student("Hung","1.73m");
        Student st2=new Student("Tan","1.75m");
        studentList.add(st1);
        studentList.add(st2);
        String listjson=gson.toJson(studentList);
        String filename="D:\\TestJson\\data.json";
        File file=new File(filename);
        file.createNewFile();
        file.setReadable(false);
        FileWriter fileWriter=new FileWriter(filename);
        fileWriter.write(listjson);
        fileWriter.close();
        System.out.println("Da them thanh cong");

    }
}
