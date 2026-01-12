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
        List<Course> cartCourses = (List<Course>) session.getAttribute("cartCourses");
        double total = 0;
        if (cartDocs != null) for (PaidDocument d : cartDocs) total += d.getPrice();
        if (cartCourses != null) for (Course c : cartCourses) total += c.getPrice();

        if (total == 0) {
            response.sendRedirect(request.getContextPath() + "/cart.jsp?error=empty_cart");
            return;
        }
        Order order = new Order();
        order.setUsername(user.getUsername());
        order.setTotalPrice(total);
        order.setStatus("success");
        int orderId = orderDAO.insertOrder(order);

        if (orderId != -1) {
            LearningDocumentDAO ldDao = new LearningDocumentDAO();
            if (cartDocs != null && !cartDocs.isEmpty()) {
                for (PaidDocument doc : cartDocs) {
                    orderDAO.insertOrderDetail(orderId, doc.getId(), "document", doc.getPrice());

                    LearningDocument ld = new LearningDocument();
                    ld.setUsername(user.getUsername());
                    ld.setDocumentId(doc.getId());
                    ld.setType("paid");
                    ldDao.add(ld); 
                }
            }
            if (cartCourses != null && !cartCourses.isEmpty()) {
                try (Connection conn = DatabaseConnection.getConnection()) {
                    String sql = "INSERT INTO user_courses (username, course_id) VALUES (?, ?)";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    for (Course c : cartCourses) {
                        orderDAO.insertOrderDetail(orderId, c.getId(), "course", c.getPrice());
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
            response.sendRedirect(request.getContextPath() + "/ThanhToanThanhCong.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/cart.jsp?error=payment_failed");
        }
    }
}