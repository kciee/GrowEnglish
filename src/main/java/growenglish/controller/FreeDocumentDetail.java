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
<<<<<<< HEAD
    private static final long serialVersionUID = 1L;
	private FreeDocumentDetailDAO freeDocumentDetailDAO;
=======

    private static final long serialVersionUID = 1L;
	private FreeDocumentDetailDAO freeDocumentDetailDAO;
//    private LearningDocumentDAO learningDocumentDAO;
>>>>>>> e18aefb (update)

    @Override
    public void init() throws ServletException {
        freeDocumentDetailDAO = new FreeDocumentDetailDAO();
<<<<<<< HEAD
=======
//        learningDocumentDAO = new LearningDocumentDAO();
>>>>>>> e18aefb (update)
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String documentIdParam = request.getParameter("id");
<<<<<<< HEAD
        if (user == null) {
        	response.sendRedirect(request.getContextPath() + "/login.jsp");
        	return;
        }
        if (documentIdParam != null) {
            try {
                int documentId = Integer.parseInt(documentIdParam);
=======

        if (documentIdParam != null) {
            try {
                int documentId = Integer.parseInt(documentIdParam);

>>>>>>> e18aefb (update)
                LearningDocumentDAO learningDocumentDAO = new LearningDocumentDAO();
                LearningDocument learningDocument = new LearningDocument();
                learningDocument.setDocumentId(documentId);
                learningDocument.setUsername(user.getUsername());
<<<<<<< HEAD
                learningDocumentDAO.add(learningDocument);
                growenglish.model.FreeDocumentDetail detail = freeDocumentDetailDAO.getDocumentDetailById(documentId);
                if (detail != null) {
=======


                learningDocumentDAO.add(learningDocument);


                // Lấy thông tin chi tiết tài liệu
                growenglish.model.FreeDocumentDetail detail = freeDocumentDetailDAO.getDocumentDetailById(documentId);

                if (detail != null) {


                    // Chuyển tiếp đến trang chi tiết tài liệu
>>>>>>> e18aefb (update)
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

