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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        if (user == null) { response.sendRedirect("login.jsp"); return; }
        List<PaidDocument> cartDocs = (List<PaidDocument>) session.getAttribute("paidDocuments");
        List<Course> cartCourses = (List<Course>) session.getAttribute("cartCourses");
        double totalPrice = 0;
        if (cartDocs != null) for (PaidDocument d : cartDocs) totalPrice += d.getPrice();
        if (cartCourses != null) for (Course c : cartCourses) totalPrice += c.getPrice();
        Connection conn = null;
        try {
            conn = growenglish.db.DatabaseConnection.getConnection();
            conn.setAutoCommit(false);
            String sqlOrder = "INSERT INTO orders (username, total_price, status, order_date) VALUES (?, ?, 'success', GETDATE())";
            PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setString(1, user.getUsername());
            psOrder.setDouble(2, totalPrice);
            psOrder.executeUpdate();
            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = -1;
            if (rs.next()) orderId = rs.getInt(1);
            String sqlDetail = "INSERT INTO order_details (order_id, product_id, product_type, price) VALUES (?, ?, ?, ?)";
            String sqlAccessCourse = "INSERT INTO user_courses (username, course_id) VALUES (?, ?)";
            String sqlAccessDoc = "INSERT INTO learning_documents (username, DocumentId, type) VALUES (?, ?, 'paid')";
            PreparedStatement psDetail = conn.prepareStatement(sqlDetail);
            PreparedStatement psCourse = conn.prepareStatement(sqlAccessCourse);
            PreparedStatement psDoc = conn.prepareStatement(sqlAccessDoc);
            if (cartDocs != null) {
                for (PaidDocument doc : cartDocs) {
                    psDetail.setInt(1, orderId); psDetail.setInt(2, doc.getId());
                    psDetail.setString(3, "document"); psDetail.setDouble(4, doc.getPrice());
                    psDetail.addBatch();
                    psDoc.setString(1, user.getUsername()); psDoc.setInt(2, doc.getId());
                    psDoc.addBatch();
                }
            }
            if (cartCourses != null) {
                for (Course c : cartCourses) {
                    psDetail.setInt(1, orderId); psDetail.setInt(2, c.getId());
                    psDetail.setString(3, "course"); psDetail.setDouble(4, c.getPrice());
                    psDetail.addBatch();
                    psCourse.setString(1, user.getUsername()); psCourse.setInt(2, c.getId());
                    psCourse.addBatch();
                }
            }
            psDetail.executeBatch();
            psDoc.executeBatch();
            psCourse.executeBatch();
            conn.commit();
            session.removeAttribute("paidDocuments");
            session.removeAttribute("cartCourses");
            response.sendRedirect("ThanhToanThanhCong.jsp");
        } catch (Exception e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            e.printStackTrace();
            response.sendRedirect("cart.jsp?error=system_error");
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}