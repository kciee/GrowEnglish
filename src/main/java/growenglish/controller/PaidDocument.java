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
        int pageSize = 8;
        double min = 0;
        double max = 0;
        String sort = "newest";
        try {
            if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
            if (request.getParameter("min") != null) min = Double.parseDouble(request.getParameter("min"));
            if (request.getParameter("max") != null) max = Double.parseDouble(request.getParameter("max"));
            if (request.getParameter("sort") != null) sort = request.getParameter("sort");
        } catch (NumberFormatException e) { }
        PaidDocumentDAO dao = new PaidDocumentDAO();
        List<growenglish.model.PaidDocument> paidDocuments = dao.getPaidDocumentsByPage(page, pageSize, min, max, sort);
        request.setAttribute("paidDocuments", paidDocuments);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", 10);
        request.setAttribute("currentSort", sort);
        request.setAttribute("currentMin", min > 0 ? (int)min : "");
        request.setAttribute("currentMax", max > 0 ? (int)max : "");
        request.getRequestDispatcher("paidDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
