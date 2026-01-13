package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.dao.LearningDocumentDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-learning-doc")
public class DeleteLearningDocController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) { response.sendRedirect("login.jsp"); return; }
        String idParam = request.getParameter("id");
        String type = request.getParameter("type");
        if (idParam != null && type != null) {
            int id = Integer.parseInt(idParam);
            String username = user.getUsername();
            if ("course".equals(type)) {
                CourseDAO courseDAO = new CourseDAO();
                courseDAO.deleteUserCourse(username, id);
                session.removeAttribute("myCourses");
            } else {
                LearningDocumentDAO dao = new LearningDocumentDAO();
                dao.deleteSpecificDoc(username, id, type);
                session.removeAttribute("listPaidDocument");
                session.removeAttribute("listFreeDocument");
            }
            response.sendRedirect("learningDocuments?status=success");
        } else {
            response.sendRedirect("learningDocuments?status=error");
        }
    }
}