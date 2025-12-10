package growenglish.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogoutController", value = "/Logout")
public class LogoutController extends HttpServlet {
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
=======
        // Hủy session hiện tại
        HttpSession session = request.getSession(false); // Lấy session hiện tại, không tạo mới
        if (session != null) {
            session.invalidate(); // Hủy session
        }

        // Chuyển hướng về trang đăng nhập
>>>>>>> e18aefb (update)
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

