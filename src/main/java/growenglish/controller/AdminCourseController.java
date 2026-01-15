package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/admin/courses")
@MultipartConfig
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
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            courseDAO.deleteCourse(id);
        } else {
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            Part filePart = req.getPart("image"); 
            String imagePath = req.getParameter("currentImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                
                filePart.write(uploadPath + File.separator + fileName);
                imagePath = "assets/images/" + fileName; 
            }
            if (imagePath == null || imagePath.isEmpty()) {
                imagePath = "assets/images/default-course.jpg";
            }

            if ("create".equals(action)) {
                Course newCourse = new Course(0, name, desc, price, imagePath);
                courseDAO.insertCourse(newCourse);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Course course = new Course(id, name, desc, price, imagePath);
                courseDAO.updateCourse(course);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/courses");
    }
}