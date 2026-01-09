package growenglish.controller;

import growenglish.model.Course;
import growenglish.model.PaidDocument;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Cart", value = "/Cart")
public class Cart extends HttpServlet {

    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<PaidDocument> list = (List<PaidDocument>) session.getAttribute("paidDocuments");
            List<Course> listCourses = (List<Course>) session.getAttribute("cartCourses");
            request.setAttribute("paidDocuments", list);
            request.setAttribute("cartCourses", listCourses);
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}