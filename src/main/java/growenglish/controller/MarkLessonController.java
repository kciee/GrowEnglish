package growenglish.controller;

import growenglish.dao.LessonProgressDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mark-lesson")
public class MarkLessonController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        int lessonId = Integer.parseInt(req.getParameter("lessonId"));
        LessonProgressDAO dao = new LessonProgressDAO();
        dao.markLessonCompleted(user.getUsername(), lessonId);
        
        resp.setStatus(HttpServletResponse.SC_OK);
    }
}