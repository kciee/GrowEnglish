package growenglish.controller;

import growenglish.dao.QuizDAO;
import growenglish.model.Quiz;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/quizzes")
public class AdminQuizController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuizDAO quizDAO;

    @Override
    public void init() {
        quizDAO = new QuizDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Quiz> list = quizDAO.getAllQuizzes();
        req.setAttribute("quizzes", list);
        req.getRequestDispatcher("/adminQuizzes.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            quizDAO.deleteQuiz(id);
        } else {
            String name = req.getParameter("name");
            String desc = req.getParameter("description");
            
            if ("create".equals(action)) {
                Quiz newQuiz = new Quiz(0, name, desc);
                quizDAO.insertQuiz(newQuiz);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Quiz quiz = new Quiz(id, name, desc);
                quizDAO.updateQuiz(quiz);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/quizzes");
    }
}