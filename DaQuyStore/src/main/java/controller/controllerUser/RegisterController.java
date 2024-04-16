package controller.controllerUser;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import controller.controllerUser.google.GoogleInfo;
import controller.controllerUser.google.TokenGoogle;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import service.EncryptAndDencrypt;
import service.user.LoginService;
import service.user.RegisterService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/register","/registerGoogle","/registerFacebook"})
public class RegisterController extends HttpServlet {
    private RegisterService registerService = new RegisterService();
    private LoginService loginService = new LoginService();
    private EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/register".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/register"
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/register.jsp");
            dispatcher.forward(req, resp);
        } else if ("/registerGoogle".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginGoogle"
            try {
                registerGoogle(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/registerFacebook".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginFaceBook"

        } else {
            // Xử lý khi không phân biệt được URL
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String username = request.getParameter("user");
                String password = encryptAndDencrypt.encrypt( request.getParameter("pass"));
                String email = request.getParameter("email");
                //kiểm tra user namme và email
                try {
                    checkRegister(request,response,username,email);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                // đang ky
                try {
                    registerWeb(request,response,username,password,email);
                } catch (SQLException e) {
                        throw new RuntimeException(e);
                }
    }
    /*
    * đăng ký tài khoản trên web
    * */
    private void registerWeb(HttpServletRequest request, HttpServletResponse response,String username,String password,String email) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        checkRegister(request, response, username, email);
        String code = registerService.createActivationCode(username,password,email);
        sendEmail(request,response,code,email);
    }

    /*
    * gửi email
    * */
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

    /*
    * Đăng ký tài khoản google
    * */
    private void registerGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        HttpSession session = req.getSession(false);
        String code = req.getParameter("code");
        String token =  getToken(code);
        GoogleInfo user = getUserInfo(token);
        checkRegister(req,resp,user.getEmail(),user.getEmail());
        // email: username; id: password;
        User u = new User(user.getEmail(),encryptAndDencrypt.encrypt(user.getId()),user.getEmail(),"google",user.getPicture(),user.getFamily_name()+" "+user.getGiven_name());
        if(registerService.insertUser(u)){
            System.out.println(u);
            session.setAttribute("username", u.getUsername());
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/home");
            requestDispatcher.forward(req, resp);
        }
    }

    public  String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(TokenGoogle.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", TokenGoogle.GOOGLE_CLIENT_ID_REGISTER)
                        .add("client_secret", TokenGoogle.GOOGLE_CLIENT_SECRET_REGISTER)
                        .add("redirect_uri", TokenGoogle.GOOGLE_REDIRECT_URI_REGISTER).add("code", code)
                        .add("grant_type", TokenGoogle.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        return jobj.get("access_token").toString().replaceAll("\"", "");
    }

    public  GoogleInfo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = TokenGoogle.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, GoogleInfo.class);
    }

}
