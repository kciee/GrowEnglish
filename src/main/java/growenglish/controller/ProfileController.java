package growenglish.controller;

import growenglish.dao.UserDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet(name = "ProfileController", value = "/updateProfile")
@MultipartConfig
public class ProfileController extends HttpServlet {
<<<<<<< HEAD
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "D:/growenglish/uploads";
=======

    private static final long serialVersionUID = 1L;

>>>>>>> e18aefb (update)
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String fullName = request.getParameter("fullName");
        int birthYear = Integer.parseInt(request.getParameter("birthYear"));
        Part avatarPart = request.getPart("avatar");
        String avatarUrl = user.getAvatarUrl();
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + "uploads";
        File uploadDir = new File(savePath);
        if (!uploadDir.exists()) {
        	uploadDir.mkdir();
        }
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String fileName = user.getUsername() + "_avatar_" + avatarPart.getSubmittedFileName();
            String filePath = savePath + File.separator + fileName;
            avatarUrl = "uploads" + "/" + fileName;
            avatarPart.write(filePath);
        }
=======
        // Lấy thông tin người dùng từ session
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp"); // Chuyển hướng nếu chưa đăng nhập
            return;
        }

        // Lấy thông tin từ form
        String fullName = request.getParameter("fullName");
        int birthYear = Integer.parseInt(request.getParameter("birthYear"));

        // Xử lý upload file avatar
        Part avatarPart = request.getPart("avatar");
        String avatarUrl = null;
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String fileName = user.getUsername() + "_avatar_" + avatarPart.getSubmittedFileName();
            avatarUrl = "uploads" + File.separator + fileName;
            avatarPart.write(uploadPath + File.separator + fileName);
        }

        // Cập nhật thông tin người dùng
>>>>>>> e18aefb (update)
        UserDAO userDao = null;
        try {
            userDao = new UserDAO();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
<<<<<<< HEAD
        user.setFullName(fullName);
        user.setBirthYear(birthYear);
        user.setAvatarUrl(avatarUrl);
        boolean isUpdated = userDao.updateUser(user);
        if (isUpdated) {
            request.getSession().setAttribute("user", user);
=======

        user.setFullName(fullName);
        user.setBirthYear(birthYear);
        if (avatarUrl != null) {
            user.setAvatarUrl(avatarUrl);
        }

        boolean isUpdated = userDao.updateUser(user);
        if (isUpdated) {
            // Cập nhật lại session với ảnh đại diện mới
            request.getSession().setAttribute("user", user);
            // Cập nhật lại avatar trong session
>>>>>>> e18aefb (update)
            request.getSession().setAttribute("avatar", avatarUrl);
            response.sendRedirect("index.jsp?status=success");
        } else {
            response.sendRedirect("index.jsp?status=error");
        }
    }
}

