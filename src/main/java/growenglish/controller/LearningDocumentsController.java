package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.dao.FreeDocumentDAO;
import growenglish.dao.LearningDocumentDAO;
import growenglish.dao.PaidDocumentDAO;
import growenglish.model.Course;
import growenglish.model.FreeDocument;
import growenglish.model.LearningDocument;
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

@WebServlet(name = "LearningDocumentsController", value = "/learningDocuments")
public class LearningDocumentsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        CourseDAO courseDAO = new CourseDAO();
        List<Course> myCourses = courseDAO.getCoursesByUsername(user.getUsername());
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();
        LearningDocumentDAO dao = new LearningDocumentDAO();
        PaidDocumentDAO paidDao = new PaidDocumentDAO();
        List<LearningDocument> learningDocumentList = dao.getIdDocumentByUsername(user.getUsername());
        List<FreeDocument> listFreeDocument = new ArrayList<>();
        List<PaidDocument> listPaidDocument = new ArrayList<>();
        for (LearningDocument ld : learningDocumentList) {
            String type = ld.getType();
            if ("paid".equalsIgnoreCase(type)) {
                PaidDocument paidDoc = paidDao.getPaidDocumentById(ld.getDocumentId());
                if (paidDoc != null) listPaidDocument.add(paidDoc);
            } else {
                FreeDocument freeDoc = freeDocumentDAO.getFreeDocumentById(ld.getDocumentId());
                if (freeDoc != null) listFreeDocument.add(freeDoc);
            }
        }
        session.setAttribute("myCourses", myCourses);
        session.setAttribute("listFreeDocument", listFreeDocument);
        session.setAttribute("listPaidDocument", listPaidDocument);
        request.getRequestDispatcher("learningDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}