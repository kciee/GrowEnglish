package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course-detail") 
public class CourseDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                CourseDAO dao = new CourseDAO();
                Course course = dao.getCourseById(id);
                if (course != null) {
                    request.setAttribute("course", course);
                    request.getRequestDispatcher("/courseDetail.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("courses");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("courses");
        }
    }
}