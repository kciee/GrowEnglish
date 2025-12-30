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

@WebServlet("/admin/courses")
public class AdminCourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Course> courses = courseDAO.getAllCourses();
        req.setAttribute("courses", courses);
        req.getRequestDispatcher("/adminCourses.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("create".equals(action)) {
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            Course newCourse = new Course(0, name, desc, price);
            courseDAO.insertCourse(newCourse);
            
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            Course course = new Course(id, name, desc, price);
            courseDAO.updateCourse(course);
            
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            courseDAO.deleteCourse(id);
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/courses");
    }
}