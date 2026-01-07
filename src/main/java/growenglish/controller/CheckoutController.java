package growenglish.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import growenglish.dao.LearningDocumentDAO;
import growenglish.dao.OrderDAO;
import growenglish.db.DatabaseConnection;
import growenglish.model.User;
import growenglish.model.Course;
import growenglish.model.LearningDocument;
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
		List<PaidDocument> cartDocs = (List<PaidDocument>) session.getAttribute("paidDocuments");
		List<Course> cartCourse = (List<Course>) session.getAttribute("cartCourses");
		boolean isDocsEmpty = (cartDocs == null || cartDocs.isEmpty());
		boolean isCourseEmpty = (cartCourse == null || cartCourse.isEmpty());
		if (isDocsEmpty && isCourseEmpty) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		double totalPrice = 0;
		if (!isDocsEmpty) {
			for (PaidDocument item : cartDocs) {
				totalPrice += item.getPrice();
			}
		}
		if (!isCourseEmpty) {
			for (Course item : cartCourse) {
				totalPrice += item.getPrice();
			}
		}
		Order order = new Order();
		order.setUsername(user.getUsername());
		order.setTotalPrice(totalPrice);
		order.setStatus("success");
		boolean isOrderSaved = orderDAO.insertOrder(order);
		if (isOrderSaved) {
			if (cartDocs != null && !cartDocs.isEmpty()) {
                LearningDocumentDAO ldDao = new LearningDocumentDAO();
                for (PaidDocument doc : cartDocs) {
                    LearningDocument ld = new LearningDocument();
                    ld.setUsername(user.getUsername());
                    ld.setDocumentId(doc.getId());
                    ldDao.add(ld); 
                }
            }
            if (cartCourse != null && !cartCourse.isEmpty()) {
                try (Connection conn = DatabaseConnection.getConnection()) {
                    String sql = "INSERT INTO user_courses (username, course_id) VALUES (?, ?)";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    for (Course c : cartCourse) {
                        ps.setString(1, user.getUsername());
                        ps.setInt(2, c.getId());
                        ps.addBatch();
                    }
                    ps.executeBatch();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
			session.removeAttribute("paidDocuments");
			session.removeAttribute("cartCourses");
			response.sendRedirect("/ThanhToanThanhCong.jsp");
		} else {
			response.sendRedirect("/cart.jsp?error=payment_failed");
		}
	}

}