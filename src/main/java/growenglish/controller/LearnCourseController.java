package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.dao.LessonDAO;
import growenglish.model.Course;
import growenglish.model.Lesson;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/learn")
public class LearnCourseController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        LessonDAO lessonDAO = new LessonDAO();
        CourseDAO courseDAO = new CourseDAO();
        boolean hasAccess = lessonDAO.checkAccess(user.getUsername(), courseId);
        if (!hasAccess && !"admin".equals(user.getRole())) {
            resp.sendRedirect("course-detail?id=" + courseId + "&error=not_paid");
            return;
        }
        Course course = courseDAO.getCourseById(courseId);
        req.setAttribute("course", course);
        List<Lesson> lessons = lessonDAO.getLessonsByCourseId(courseId);
        req.setAttribute("lessons", lessons);
        String currentLessonId = req.getParameter("lessonId");
        Lesson currentLesson = null;
        if (!lessons.isEmpty()) {
            if (currentLessonId == null) {
                currentLesson = lessons.get(0);
            } else {
                int id = Integer.parseInt(currentLessonId);
                for (Lesson l : lessons) {
                    if (l.getId() == id) {
                        currentLesson = l;
                        break;
                    }
                }
            }
        }
        req.setAttribute("currentLesson", currentLesson);

        req.getRequestDispatcher("/learnCourse.jsp").forward(req, resp);
    }
}