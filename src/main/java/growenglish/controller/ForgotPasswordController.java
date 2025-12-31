package growenglish.controller;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import growenglish.dao.UserDAO;
import growenglish.model.EmailUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        UserDAO dao = new UserDAO();
        
        if (dao.checkEmailExist(email)) {
            String newPass = "Grow" + (int)(Math.random() * 10000);
            String hashedPass = BCrypt.hashpw(newPass, BCrypt.gensalt());
            dao.updatePasswordByEmail(email, hashedPass);
            try {
                EmailUtility.sendEmail(email, "Cấp lại mật khẩu GrowEnglish", 
                    "Mật khẩu mới của bạn là: " + newPass + "\nVui lòng đăng nhập và đổi lại ngay.");
                req.setAttribute("message", "Mật khẩu mới đã được gửi vào email của bạn!");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "Lỗi gửi mail. Vui lòng thử lại.");
            }
        } else {
            req.setAttribute("error", "Email không tồn tại trong hệ thống!");
        }
        req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);
    }
}
