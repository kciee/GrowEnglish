package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CourseController", value = "/courses")
public class CourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        List<Course> courseList = courseDAO.getAllCourses();
        for (Course course : courseList) {
            System.out.println(course.toString());
        }
        request.setAttribute("courseList", courseList);
        request.getRequestDispatcher("courseList.jsp").forward(request, response);
    }
}
