package growenglish.controller;

import growenglish.dao.UserDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
=======
// FIX 1: Thêm import cho thư viện jBCrypt.
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

>>>>>>> e18aefb (update)
@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            userDAO = new UserDAO();
        } catch (Exception e) {
            throw new ServletException("Unable to initialize UserDAO", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
<<<<<<< HEAD
        try {
=======

        try {
            // Kiểm tra mật khẩu xác nhận
>>>>>>> e18aefb (update)
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
<<<<<<< HEAD
            if (userDAO.getUserByUsername(username) != null) {
=======

            // Kiểm tra xem username đã tồn tại chưa
            if (userDAO.getUserByUsername(username) != null) {
                // FIX 2: Sửa lại thông báo lỗi logic cho chính xác.
>>>>>>> e18aefb (update)
                request.setAttribute("error", "Tên đăng nhập này đã tồn tại!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
<<<<<<< HEAD
=======

            // Kiểm tra xem email đã tồn tại chưa
>>>>>>> e18aefb (update)
            User existingEmail = userDAO.getUserByEmail(email);
            if (existingEmail != null) {
                request.setAttribute("error", "Email này đã được sử dụng!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
<<<<<<< HEAD
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            User newUser = new User(username, hashedPassword, email);
            newUser.setRole("user");
            boolean isRegistered = userDAO.insertUser(newUser);
=======
            
            // FIX 3 (RẤT QUAN TRỌNG): Băm mật khẩu bằng BCrypt trước khi lưu.
            // Không bao giờ lưu mật khẩu dạng chữ!
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Thêm người dùng mới với mật khẩu đã được băm an toàn
            // FIX 4: Dùng mật khẩu đã băm (hashedPassword) để tạo người dùng mới.
            User newUser = new User(username, hashedPassword, email);
            newUser.setRole("user");
            
            boolean isRegistered = userDAO.insertUser(newUser);

>>>>>>> e18aefb (update)
            if (isRegistered) {
                request.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống! Vui lòng thử lại sau.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}