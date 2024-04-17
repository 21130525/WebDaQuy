package controller.controllerUser;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.mail.internet.AddressException;
import controller.controllerUser.google.GoogleInfo;
import controller.controllerUser.google.TokenGoogle;
import model.User;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.manageUser.security.EncryptAndDencrypt;
import service.manageUser.registerAndLogin.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns={ "/loginWeb" ,"/loginGoogle","/loginFaceBook"})
public class LoginController  extends HttpServlet {
    EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();
    LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/loginWeb".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginWeb"
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/login.jsp");
            dispatcher.forward(req, resp);
        } else if ("/loginGoogle".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginGoogle"
            try {
                loginGoogle(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/loginFaceBook".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginFaceBook"
        } else {
            // Xử lý khi không phân biệt được URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            loginWeb(req, resp);
        } catch (SQLException | AddressException e) {
            throw new RuntimeException(e);
        }
    }

    protected void loginWeb(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, AddressException {
        String idUser = "";
        String username = request.getParameter("username");
        String pass =request.getParameter("password");
        HttpSession session = request.getSession(true);
        if (username == null || pass == null) {
            request.setAttribute("notify", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("/home").forward(request, response);
        } else {
            User user = loginService.checkLogin(username, pass,"web");
            if (user != null) {
                if (session != null) {
                    if (user.getRole().equals("admin")) {
                        session.setAttribute("username", username);
                        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request, response);
                    } else if (user.getRole().equals("user")) {
                        session.setAttribute("idUser", idUser);
                        session.setAttribute("username", username);
                        session.setAttribute("avatar", user.getAvatar());
                        response.sendRedirect(request.getContextPath()+ "/views/index.jsp");
                    }
                }
            } else {
                request.setAttribute("notify", "Tài khoản hoặc mật khẩu không tồn tại");
                request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            }

        }
    }

    private void loginGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        String token =  getToken(code);
        GoogleInfo user = getUserInfo(token);
        System.out.println(user);
        User account = loginService.checkLogin(user.getEmail(),user.getId(),"google");
        System.out.println(account);
        if(account != null) {
            session.setAttribute("username", account.getUsername());
            session.setAttribute("avatar", account.getAvatar());
            req.getRequestDispatcher("/home").forward(req,resp);
        }else{
            req.getRequestDispatcher("/error").forward(req,resp);
        }
    }
    public  String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(TokenGoogle.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", TokenGoogle.GOOGLE_CLIENT_ID_LOGIN)
                        .add("client_secret", TokenGoogle.GOOGLE_CLIENT_SECRET_LOGIN)
                        .add("redirect_uri", TokenGoogle.GOOGLE_REDIRECT_URI_LOGIN).add("code", code)
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
