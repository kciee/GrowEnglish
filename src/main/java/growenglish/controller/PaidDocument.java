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
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 6;
        
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        PaidDocumentDAO dao = new PaidDocumentDAO();
        List<growenglish.model.PaidDocument> paidDocuments = dao.getPaidDocumentsByPage(page, pageSize);
        int totalDocs = dao.getTotalPaidDocumentsCount();
        int totalPages = (int) Math.ceil((double) totalDocs / pageSize);

        request.setAttribute("paidDocuments", paidDocuments);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("paidDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
