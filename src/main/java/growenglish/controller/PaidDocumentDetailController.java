package growenglish.controller;

import growenglish.dao.PaidDocumentDAO;
import growenglish.dao.PaidDocumentDetailDAO;
import growenglish.dao.ReviewDAO;
import growenglish.model.PaidDocument;
import growenglish.model.PaidDocumentDetail;
import growenglish.model.Review;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/PaidDocumentDetail")
public class PaidDocumentDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("learningDocuments");
            return;
        }
        int docId = Integer.parseInt(idParam);
        PaidDocumentDetailDAO detailDAO = new PaidDocumentDetailDAO();
        PaidDocumentDAO docDAO = new PaidDocumentDAO();
        boolean isOwner = detailDAO.checkUserOwnership(user.getUsername(), docId);
        if (!isOwner && !"admin".equalsIgnoreCase(user.getRole())) {
            request.setAttribute("error", "Bạn chưa mua tài liệu này!");
            request.getRequestDispatcher("403.jsp").forward(request, response);
            return;
        }
        PaidDocument docInfo = docDAO.getPaidDocumentById(docId);
        PaidDocumentDetail docDetail = detailDAO.getDetailById(docId);
        if (docInfo != null) {
            request.setAttribute("docInfo", docInfo);
            request.setAttribute("docDetail", docDetail);
            ReviewDAO reviewDAO = new ReviewDAO();
            List<Review> reviews = reviewDAO.getReviewsByDocId(docId);
            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("paidDocumentDetail.jsp").forward(request, response);
        } else {
            response.sendError(404, "Không tìm thấy tài liệu.");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            int docId = Integer.parseInt(request.getParameter("id"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            
            ReviewDAO reviewDAO = new ReviewDAO();
            reviewDAO.addReview(user.getUsername(), docId, rating, comment);
            
            response.sendRedirect("PaidDocumentDetail?id=" + docId);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}