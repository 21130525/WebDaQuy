package controller.controllerUser;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import service.EncryptAndDencrypt;
import service.user.RegisterService;

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
    private EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "RegisterWeb":
                String username = request.getParameter("user");
                String password = encryptAndDencrypt.encrypt( request.getParameter("pass"));
                String email = request.getParameter("email");
                //kiểm tra user namme và email
                try {
                    checkRegister(request,response,username,email);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                // đang nhập
                try {
                    loginWeb(request,response,username,password,email);
                } catch (SQLException e) {
                        throw new RuntimeException(e);
                }
                break;
            case "RegisterGoogle":
                break;
            case "RegisterFacebook":
                break;
        }
    }


    private void loginWeb(HttpServletRequest request, HttpServletResponse response,String username,String password,String email) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        checkRegister(request, response, username, email);
        String code = registerService.createActivationCode(username,password,email);
        sendEmail(request,response,code,email);
    }

    protected void sendEmail(HttpServletRequest request, HttpServletResponse response, String code,String email) throws IOException {

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
                String url = "<a href=\"http://localhost:8080/DaQuyStore_war/verifyregister?code="+code+"\">Click vào đây để xác nhận</a>";

                message.setSubject("Xác nhận tài khoản!");
                message.setContent("<h1>Xác nhận tài khoản:</h1>" + url, "text/html;charset=utf-8");

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
