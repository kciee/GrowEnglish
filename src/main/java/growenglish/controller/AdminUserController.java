package growenglish.controller;

import growenglish.dao.UserDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/admin/users")
public class AdminUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

    @Override
    public void init() {
        try {
            userDAO = new UserDAO();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	List<User> users = userDAO.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/adminUsers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String username = req.getParameter("username");

        if (action == null || username == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/users");
            return;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        switch (action) {
            case "delete":
                userDAO.deleteUser(username);
                break;
            case "promote":
                userDAO.updateRole(username, "admin");
                break;
            case "demote":
                userDAO.updateRole(username, "user");
                break;
            default:
                break;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
