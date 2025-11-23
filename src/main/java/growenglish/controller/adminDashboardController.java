package growenglish.controller;

import growenglish.dao.AdminStatsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/admin/dashboard")
public class adminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private AdminStatsDAO statsDAO;

    @Override
    public void init() {
        statsDAO = new AdminStatsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int totalUsers = statsDAO.countUsers();
        int totalCourses = statsDAO.countCourses();
        int totalDocuments = statsDAO.countDocuments();
        int totalQuizzes = statsDAO.countQuizzes();
        int totalOrders = statsDAO.countOrders();
        double totalRevenue = statsDAO.sumRevenue();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalCourses", totalCourses);
        request.setAttribute("totalDocuments", totalDocuments);
        request.setAttribute("totalQuizzes", totalQuizzes);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalRevenue", totalRevenue);

        request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
    }
}
