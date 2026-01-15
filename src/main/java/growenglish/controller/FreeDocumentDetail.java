package growenglish.controller;

import growenglish.dao.FreeDocumentDetailDAO;
import growenglish.dao.LearningDocumentDAO;
import growenglish.model.LearningDocument;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "FreeDocumentDetail", value = "/FreeDocumentDetail")
public class FreeDocumentDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FreeDocumentDetailDAO freeDocumentDetailDAO;

    @Override
    public void init() throws ServletException {
        freeDocumentDetailDAO = new FreeDocumentDetailDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String documentIdParam = request.getParameter("id");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        if (documentIdParam != null) {
            try {
                int documentId = Integer.parseInt(documentIdParam);
                LearningDocumentDAO learningDocumentDAO = new LearningDocumentDAO();
                LearningDocument learningDocument = new LearningDocument();
                learningDocument.setDocumentId(documentId);
                learningDocument.setUsername(user.getUsername());
                learningDocument.setType("free");
                learningDocumentDAO.add(learningDocument);
                growenglish.model.FreeDocumentDetail detail = freeDocumentDetailDAO.getDocumentDetailById(documentId);
                if (detail != null) {
                    request.setAttribute("documentDetail", detail);
                    request.getRequestDispatcher("freeDocumentsDetail.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tài liệu không tồn tại");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID tài liệu không hợp lệ");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID tài liệu không được cung cấp");
        }
    }
}