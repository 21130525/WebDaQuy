package controller.controllerLogin;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.User;
import service.RegisterService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String fullname = request.getParameter("fullname");
        String date = request.getParameter("date");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        boolean verify = Boolean.parseBoolean(request.getParameter("checkVerify"));
        HttpSession session = request.getSession(false);

        try {
            if (!verify) {
                session.setAttribute("username",username);
                session.setAttribute("password",password);
                session.setAttribute("email",email);
                session.setAttribute("gender",gender);
                session.setAttribute("fullname",fullname);
                session.setAttribute("date",date);
                session.setAttribute("phone",phone);
                session.setAttribute("address",address);
                checkRegister(request, response, username, email);
                sendEmail(request, response, username,email, registerService);
            }
            if (verify) {
                String Susername = (String) session.getAttribute("user");
                String Spassword = (String) session.getAttribute("pass");
                String Semail = (String) session.getAttribute("email");
                String Sgender = (String) session.getAttribute("gender");
                String Sfullname = (String) session.getAttribute("fullname");
                String Sdate = (String) session.getAttribute("date");
                String Sphone = (String) session.getAttribute("phone");
                String Saddress = (String) session.getAttribute("address");
                User user = new User(Susername, Spassword, Semail,Sgender,Sfullname,Sdate,Sphone,Saddress, "customer");
                if (registerService.insertUser(user)) {
                    request.setAttribute("announced", "Đăng ký thành công vui lòng kiểm tra email để xác nhận");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/login/login.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    request.setAttribute("announced", "Đăng ký thất bại vui long thử lại");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/login/register.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void sendEmail(HttpServletRequest request, HttpServletResponse response, String username,String email, RegisterService registerService) throws IOException {
        try {
            final String HOST_NAME = "smtp.gmail.com";
            final int SSL_PORT = 465; // Port for SSL
            // email Tân
//            final String APP_EMAIL = "ngoken102@gmail.com"; // your email
//            final String APP_PASSWORD = "hfef chqv lick rcfx"; // your password
            // email Tâm
            final String APP_EMAIL = "tamlethanh20032@gmail.com"; // your email
            final String APP_PASSWORD = "wris fjra duqq gvgp"; // your password
            final String RECEIVE_EMAIL = email;

            // Get properties object
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", HOST_NAME);
            props.put("mail.smtp.socketFactory.port", SSL_PORT);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", SSL_PORT);

            // get Session
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
                }
            });

            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(RECEIVE_EMAIL));
                String url = "<a href=\"http://localhost:8080/DaQuyStore_war/verifyregister\">Click vào đây để xác nhận</a>";

                message.setSubject("Chúc mừng! Bạn đã đăng ký thành công");
                message.setContent("<h1>Chúc mừng! Bạn đã đăng ký thành công</h1>" + url, "text/html;charset=utf-8");

                // send message
                Transport.send(message);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    protected void checkRegister(HttpServletRequest servletRequest, HttpServletResponse servletResponse, String username, String email) throws ServletException, IOException, SQLException {
        // Case 1: All fields are empty

        if (registerService.checkDuplicatedUsername(username)) {
            servletRequest.setAttribute("announced", "Tài khoản đã tồn tại");
            RequestDispatcher requestDispatcher = servletRequest.getRequestDispatcher("/views/login/register.jsp");
            requestDispatcher.forward(servletRequest, servletResponse);
        }
        if (registerService.checkDuplicatedEmail(email)) {
            servletRequest.setAttribute("announced", " email đã tồn tại");
            RequestDispatcher requestDispatcher = servletRequest.getRequestDispatcher("/views/login/register.jsp");
            requestDispatcher.forward(servletRequest, servletResponse);
        }

    }
}
