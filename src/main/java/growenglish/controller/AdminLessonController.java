package growenglish.controller;

import growenglish.dao.CourseDAO;
import growenglish.dao.LessonDAO;
import growenglish.model.Lesson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/lessons")
public class AdminLessonController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseIdParam = req.getParameter("courseId");
        if (courseIdParam == null) {
            resp.sendRedirect("courses");
            return;
        }
        int courseId = Integer.parseInt(courseIdParam);
        LessonDAO lessonDAO = new LessonDAO();
        CourseDAO courseDAO = new CourseDAO();
        req.setAttribute("course", courseDAO.getCourseById(courseId));
        req.setAttribute("lessons", lessonDAO.getLessonsByCourseId(courseId));
        req.getRequestDispatcher("/adminLessons.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        LessonDAO dao = new LessonDAO();
        if ("add".equals(action)) {
            String title = req.getParameter("title");
            String videoUrl = req.getParameter("videoUrl");
            String content = req.getParameter("content");
            int orderIndex = Integer.parseInt(req.getParameter("orderIndex"));
            if (videoUrl != null) {
                if (videoUrl.contains("watch?v=")) {
                    videoUrl = videoUrl.replace("watch?v=", "embed/");
                    if (videoUrl.contains("&")) {
                        videoUrl = videoUrl.substring(0, videoUrl.indexOf("&"));
                    }
                } else if (videoUrl.contains("youtu.be/")) {
                    videoUrl = videoUrl.replace("youtu.be/", "www.youtube.com/embed/");
                }
            }

            Lesson lesson = new Lesson(0, courseId, title, videoUrl, content, orderIndex);
            dao.insertLesson(lesson);
        } else if ("delete".equals(action)) {
            int lessonId = Integer.parseInt(req.getParameter("lessonId"));
            dao.deleteLesson(lessonId);
        }
        resp.sendRedirect("lessons?courseId=" + courseId);
    }
}