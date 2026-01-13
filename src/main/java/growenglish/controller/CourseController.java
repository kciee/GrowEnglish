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
        int page = 1;
        int pageSize = 8;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }
        CourseDAO dao = new CourseDAO();
        List<Course> courseList = dao.getCoursesByPage(page, pageSize);
        int totalCourses = dao.getTotalCourseCount();
        int totalPages = (int) Math.ceil((double) totalCourses / pageSize);
        request.setAttribute("courseList", courseList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("courseList.jsp").forward(request, response);
    }
}