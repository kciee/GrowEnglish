package growenglish.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import growenglish.dao.CourseDAO;
import growenglish.model.Course;

@WebServlet("/course-detail")
public class CourseDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CourseDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("courseId");
		if (idParam != null) {
			try {
				int id = Integer.parseInt(idParam);
				CourseDAO dao = new CourseDAO();
				Course course = dao.getCourseById(id);
				request.setAttribute("course", course);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("courseDetailView.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
