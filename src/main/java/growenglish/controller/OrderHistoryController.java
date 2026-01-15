package growenglish.controller;

import growenglish.dao.OrderDAO;
import growenglish.model.Order;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order-history")
public class OrderHistoryController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getOrdersByUsername(user.getUsername());
        
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("orderHistory.jsp").forward(req, resp);
    }
}