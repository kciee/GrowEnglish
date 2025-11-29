package growenglish.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import growenglish.dao.OrderDAO;
import growenglish.model.User;
import growenglish.model.Order;
import growenglish.model.PaidDocument;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;
    
    @Override
    public void init() {
    	orderDAO = new OrderDAO();
    }
    public CheckoutController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (session != null) ? (User) session.getAttribute("user") : null;
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		List<PaidDocument> cart = (List<PaidDocument>) session.getAttribute("paidDocuments");
		if (cart == null || cart.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		double totalPrice = 0;
		for (PaidDocument item : cart) {
			totalPrice += item.getPrice();
		}
		Order order = new Order();
		order.setUsername(user.getUsername());
		order.setTotalPrice(totalPrice);
		order.setStatus("success");
		boolean isOrderSaved = orderDAO.insertOrder(order);
		if (isOrderSaved) {
			session.removeAttribute("paidDocuments");
			response.sendRedirect(request.getContextPath() + "/ThanhToanThanhCong.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/cart.jsp?error=payment_failed");
		}
	}

}
