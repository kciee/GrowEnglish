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
	    String idStr = request.getParameter("id");
	    if (idStr == null) return;
	    int id = Integer.parseInt(idStr);
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");
	    if (user != null) {
	        growenglish.dao.PaidDocumentDetailDAO ownershipDAO = new growenglish.dao.PaidDocumentDetailDAO();
	        if (ownershipDAO.checkUserOwnership(user.getUsername(), id)) {
	            response.sendRedirect("PaidDocument?error=already_owned");
	            return;
	        }
	        PaidDocumentDAO dao = new PaidDocumentDAO();
	        List<PaidDocument> list = (List<PaidDocument>) session.getAttribute("paidDocuments");
	        if (list == null) list = new ArrayList<>();
	        boolean inCart = list.stream().anyMatch(d -> d.getId() == id);
	        if (!inCart) {
	            PaidDocument doc = dao.getPaidDocumentById(id);
	            if (doc != null) list.add(doc);
	        }
	        session.setAttribute("paidDocuments", list);
	        response.sendRedirect("PaidDocument");
	    } else {
	        response.sendRedirect("login.jsp");
	    }
	}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
