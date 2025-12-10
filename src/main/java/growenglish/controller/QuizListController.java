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

@WebServlet(name = "TestController", value = "/quizList")
public class QuizListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizDAO quizDAO = new QuizDAO();
        List<Quiz> quizzes = quizDAO.getAllQuizzes();
        for (Quiz quiz : quizzes) {
            System.out.println(quiz.toString());
        }
<<<<<<< HEAD
        request.setAttribute("quizzes", quizzes);
        request.getRequestDispatcher("tests.jsp").forward(request, response);
=======
        // Gửi danh sách bài kiểm tra đến JSP
        request.setAttribute("quizzes", quizzes);
        request.getRequestDispatcher("tests.jsp").forward(request, response);

>>>>>>> e18aefb (update)
    }
}
