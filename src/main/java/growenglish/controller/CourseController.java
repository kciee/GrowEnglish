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
<<<<<<< HEAD
        CourseDAO courseDAO = new CourseDAO();
        List<Course> courseList = courseDAO.getAllCourses();
        for (Course course : courseList) {
            System.out.println(course.toString());
        }
        request.setAttribute("courseList", courseList);
=======
        // Tạo đối tượng CourseDAO để lấy danh sách khóa học
        CourseDAO courseDAO = new CourseDAO();

        // Lấy danh sách khóa học từ cơ sở dữ liệu
        List<Course> courseList = courseDAO.getAllCourses();

        // In thông tin các khóa học ra console (tuỳ chọn)
        for (Course course : courseList) {
            System.out.println(course.toString());
        }

        // Gửi danh sách khóa học đến JSP
        request.setAttribute("courseList", courseList);

        // Chuyển hướng đến trang JSP để hiển thị khóa học
>>>>>>> e18aefb (update)
        request.getRequestDispatcher("courseList.jsp").forward(request, response);
    }
}
