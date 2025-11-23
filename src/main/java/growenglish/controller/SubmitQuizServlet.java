package growenglish.controller;

import growenglish.dao.AnswerDAO;
import growenglish.dao.UserAnswerDAO;
import growenglish.model.Quiz;
import growenglish.dao.QuizDAO;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;
import java.util.List;
import java.util.HashMap;
@WebServlet(name = "SubmitQuizServlet", value = "/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String timeTaken = request.getParameter("timeTaken");
        String username = user.getUsername();
        Map<String, String[]> parameterMap = request.getParameterMap();
        int correctAnswers = 0;
        int totalQuestions = 0;
        UserAnswerDAO userAnswerDAO = new UserAnswerDAO();
        AnswerDAO answerDAO = new AnswerDAO();
        for (String key : parameterMap.keySet()) {
            if (key.startsWith("question_")) {
                totalQuestions++;
                int questionId = Integer.parseInt(key.split("_")[1]);
                int answerId = Integer.parseInt(parameterMap.get(key)[0]);
                boolean isCorrect = answerDAO.isCorrectAnswer(answerId);
                userAnswerDAO.saveUserAnswer(username, questionId, answerId, isCorrect);
                if (isCorrect) {
                    correctAnswers++;
                }
            }
        }
        double score = (totalQuestions > 0) ? ((double) correctAnswers / totalQuestions * 100) : 0;
        QuizDAO quizDAO = new QuizDAO();
        List<Quiz> quizzes = quizDAO.getAllQuizzes();
        String quizTitle = "Không tìm thấy tên";
        for (Quiz q : quizzes) {
        	if (q.getQuizId() == quizId) {
        		quizTitle = q.getQuizName();
        		break;
        	}
        }
        Map<String, Object> result = new HashMap<>();
        result.put("quizTitle", quizTitle);
        result.put("timeTaken", timeTaken);
        result.put("correctAnswers", correctAnswers);
        result.put("totalQuestions", totalQuestions);
        result.put("score", (int) score);
        
        request.setAttribute("result", result);
        request.getRequestDispatcher("quizResult.jsp").forward(request, response);
    }
}

