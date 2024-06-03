package controller.controllerUser;

import model.User;
import service.manageUser.registerAndLogin.UpdateProfileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UpdateProfileService service = UpdateProfileService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        String phoneNumber = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String birthday = req.getParameter("birthday");
        if (phoneNumber != null)
            user.setPhoneNumber(phoneNumber);
        if (address != null) {
            user.setAddress(address);
        }
        if (gender != null) {
            user.setGender(gender);
        }
        if (birthday != null) {
            Date birthdayThenPartDate = Date.valueOf(birthday);
            user.setBirthday(birthdayThenPartDate);
        }

        System.out.println( service.updateProfile(user,req.getRemoteAddr()));
        req.getRequestDispatcher("/views/user/profile.jsp").forward(req, resp);
    }

}
