package growenglish.controller;

import growenglish.dao.PaidDocumentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaidDocument", value = "/PaidDocument")
public class PaidDocument extends HttpServlet {
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        PaidDocumentDAO paidDocumentDAO = new PaidDocumentDAO();
        List<growenglish.model.PaidDocument> paidDocuments = paidDocumentDAO.getAllPaidDocuments();
        request.setAttribute("paidDocuments", paidDocuments);
=======
        // Lấy danh sách tài liệu trả phí từ DAO
        PaidDocumentDAO paidDocumentDAO = new PaidDocumentDAO();
        List<growenglish.model.PaidDocument> paidDocuments = paidDocumentDAO.getAllPaidDocuments();
        request.setAttribute("paidDocuments", paidDocuments);

        // Chuyển hướng đến trang JSP hiển thị tài liệu trả phí
>>>>>>> e18aefb (update)
        request.getRequestDispatcher("paidDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

