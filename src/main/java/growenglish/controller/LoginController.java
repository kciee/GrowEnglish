package growenglish.controller;

import growenglish.dao.UserDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/auth")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByUsername(username);
            System.out.println("1. Username nhập: " + username);
            System.out.println("2. Password nhập: " + password);
            if (user != null ) {
            	System.out.println("3. Hash trong DB: " + user.getPassword());
            	System.out.println("4. Độ dài Hash: " + user.getPassword());
            	boolean check = BCrypt.checkpw(password, user.getPassword());
            	System.out.println("5. Kết quả so sánh: " + check);
            } else {
            	System.out.println("3. Không tìm thấy User trong DB!");
            }
            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } else {
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại sau.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
