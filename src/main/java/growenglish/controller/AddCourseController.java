package growenglish.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import growenglish.dao.CourseDAO;
import growenglish.model.Course;
import growenglish.model.User;

@WebServlet("/add-course")
public class AddCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AddCourseController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String idParam = request.getParameter("id");
		if (idParam != null) {
			int id = Integer.parseInt(idParam);
			CourseDAO dao = new CourseDAO();
			Course course = dao.getCourseById(id);
			if (course != null) {
				List<Course> cartCourses = (List<Course>) session.getAttribute("cartCourses");
				if (cartCourses == null) {
					cartCourses = new ArrayList<>();
				}
				boolean exists = false;
				for (Course c : cartCourses) {
					if (c.getId() == course.getId()) {
						exists = true;
						break;
					}
				}
				if (!exists) {
					cartCourses.add(course);
				}
				session.setAttribute("cartCourses", cartCourses);
			}
		}
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
