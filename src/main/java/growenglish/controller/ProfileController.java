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
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "D:/growenglish/uploads";
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        UserDAO userDao = null;
        try {
            userDao = new UserDAO();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        user.setFullName(fullName);
        user.setBirthYear(birthYear);
        user.setAvatarUrl(avatarUrl);
        boolean isUpdated = userDao.updateUser(user);
        if (isUpdated) {
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("avatar", avatarUrl);
            response.sendRedirect("index.jsp?status=success");
        } else {
            response.sendRedirect("index.jsp?status=error");
        }
    }
}

