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

<<<<<<< HEAD
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
=======
@WebServlet("/learn-course")
public class LearnCourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            int courseId = Integer.parseInt(request.getParameter("id"));
            LessonDAO lessonDAO = new LessonDAO();
            CourseDAO courseDAO = new CourseDAO();
            boolean hasBought = lessonDAO.hasUserBoughtCourse(user.getUsername(), courseId);
            if (!hasBought && !"admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("course-detail?id=" + courseId + "&error=not_bought");
                return;
            }
            Course course = courseDAO.getCourseById(courseId);
            List<Lesson> lessons = lessonDAO.getLessonsByCourseId(courseId);
            String currentLessonIdParam = request.getParameter("lessonId");
            Lesson currentLesson = null;
            if (lessons != null && !lessons.isEmpty()) {
                if (currentLessonIdParam != null) {
                    int currentLessonId = Integer.parseInt(currentLessonIdParam);
                    for (Lesson l : lessons) {
                        if (l.getId() == currentLessonId) {
                            currentLesson = l;
                            break;
                        }
                    }
                } else {
                    currentLesson = lessons.get(0);
                }
            }
            request.setAttribute("course", course);
            request.setAttribute("lessons", lessons);
            request.setAttribute("currentLesson", currentLesson);
            request.getRequestDispatcher("learnCourse.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
>>>>>>> de6321bd66fb65117a93e23529a15a50e37af601
    }
}