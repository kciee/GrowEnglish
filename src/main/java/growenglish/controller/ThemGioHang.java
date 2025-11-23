package growenglish.controller;

import growenglish.dao.PaidDocumentDAO;
import growenglish.model.PaidDocument;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", value = "/them-gio-hang")
public class ThemGioHang extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PaidDocumentDAO dao = new PaidDocumentDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<PaidDocument> list = (List<PaidDocument>) session.getAttribute("paidDocuments");
        if (user != null) {
            if (list == null) {
                List<PaidDocument> listPaid = new ArrayList<PaidDocument>();
                PaidDocument paidDocument = dao.getPaidDocumentById(id);
                listPaid.add(paidDocument);
                session.setAttribute("paidDocuments", listPaid);
            } else {
                PaidDocument paidDocument = dao.getPaidDocumentById(id);
                list.add(paidDocument);
                session.setAttribute("paidDocuments", list);
            }
            response.sendRedirect("PaidDocument");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

