package controller.controllerUser;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.mail.internet.AddressException;
import model.google.GoogleInfo;
import model.google.TokenGoogle;
import model.User;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.EncryptAndDencrypt;
import service.user.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns={ "/loginWeb" ,"/loginGoogle","/loginFaceBook"})
public class LoginController  extends HttpServlet {
    EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/loginWeb".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginWeb"
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/login/login.jsp");
            dispatcher.forward(req, resp);
        } else if ("/loginGoogle".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginGoogle"
            loginGoogle(req,resp);
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
        LoginService loginService = new LoginService();
        String idUser = "";
        String username = request.getParameter("username");
        String pass =request.getParameter("password");
        ArrayList<User> list = loginService.getAllUser();
        HttpSession session = request.getSession(true);
        if (username == null || pass == null) {
            request.setAttribute("notify", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("/views/login/login.jsp").forward(request, response);
        } else {
            boolean isvalid = false;
            User user = null;
            for (User u : list) {
                if (u.getUserName().equals(username) && encryptAndDencrypt.decrypt(u.getPassword()).equals(pass)) {
                    isvalid = true;
                    idUser = u.getId();
                    user = u;
                    break;
                }
            }
            if (isvalid) {
                if (session != null) {
                    if (user.getRole().equals("admin")) {

                        session.setAttribute("username", username);
                        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request, response);
                    } else if (user.getRole().equals("user")) {
                        session.setAttribute("idUser", idUser);
                        session.setAttribute("username", username);
                        response.sendRedirect(request.getContextPath()+ "/views/index.jsp");
                    }
                }
            } else {
                request.setAttribute("notify", "Tài khoản hoặc mật khẩu không tồn tại");
                request.getRequestDispatcher("/views/login/login.jsp").forward(request, response);
            }

        }
    }

    private void loginGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String code = req.getParameter("code");
        String token =  getToken(code);
        GoogleInfo user = getUserInfo(token);
        System.out.println(user);
    }
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(TokenGoogle.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", TokenGoogle.GOOGLE_CLIENT_ID)
                        .add("client_secret", TokenGoogle.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", TokenGoogle.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", TokenGoogle.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleInfo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = TokenGoogle.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GoogleInfo googlePojo = new Gson().fromJson(response, GoogleInfo.class);

        return googlePojo;
    }

}
