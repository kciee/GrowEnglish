package growenglish.controller;

import growenglish.model.Course;
import growenglish.model.PaidDocument;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Iterator;

@WebServlet("/remove-cart")
public class RemoveFromCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idParam = request.getParameter("id");
        String type = request.getParameter("type");
        if (idParam != null && type != null && session != null) {
            try {
                int id = Integer.parseInt(idParam);
                if ("course".equals(type)) {
                    List<Course> cartCourses = (List<Course>) session.getAttribute("cartCourses");
                    if (cartCourses != null) {
                        Iterator<Course> iterator = cartCourses.iterator();
                        while (iterator.hasNext()) {
                            Course c = iterator.next();
                            if (c.getId() == id) {
                                iterator.remove();
                                break; 
                            }
                        }
                        session.setAttribute("cartCourses", cartCourses); 
                    }
                }
                else if ("doc".equals(type)) {
                    List<PaidDocument> cartDocs = (List<PaidDocument>) session.getAttribute("paidDocuments");
                    if (cartDocs != null) {
                        Iterator<PaidDocument> iterator = cartDocs.iterator();
                        while (iterator.hasNext()) {
                            PaidDocument d = iterator.next();
                            if (d.getId() == id) {
                                iterator.remove();
                                break;
                            }
                        }
                        session.setAttribute("paidDocuments", cartDocs);
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("cart.jsp");
    }
}