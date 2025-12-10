package growenglish.controller;

import growenglish.dao.AnswerDAO;
import growenglish.dao.UserAnswerDAO;
<<<<<<< HEAD
import growenglish.model.Quiz;
import growenglish.dao.QuizDAO;
=======
>>>>>>> e18aefb (update)
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;
<<<<<<< HEAD
import java.util.List;
import java.util.HashMap;
@WebServlet(name = "SubmitQuizServlet", value = "/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
=======

@WebServlet(name = "SubmitQuizServlet", value = "/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {

>>>>>>> e18aefb (update)
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
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
=======
        // Lấy user từ session
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            // Nếu user chưa đăng nhập, chuyển hướng về trang login
            response.sendRedirect("login.jsp");
            return;
        }

        String username = user.getUsername(); // Lấy username từ đối tượng User trong session

        // Lấy danh sách câu trả lời từ request
        Map<String, String[]> parameterMap = request.getParameterMap();
        int correctAnswers = 0;
        int totalQuestions = 0;

        UserAnswerDAO userAnswerDAO = new UserAnswerDAO(); // DAO để lưu câu trả lời
        AnswerDAO answerDAO = new AnswerDAO(); // DAO để kiểm tra đáp án đúng

>>>>>>> e18aefb (update)
        for (String key : parameterMap.keySet()) {
            if (key.startsWith("question_")) {
                totalQuestions++;
                int questionId = Integer.parseInt(key.split("_")[1]);
                int answerId = Integer.parseInt(parameterMap.get(key)[0]);
<<<<<<< HEAD
                boolean isCorrect = answerDAO.isCorrectAnswer(answerId);
                userAnswerDAO.saveUserAnswer(username, questionId, answerId, isCorrect);
=======

                // Kiểm tra đáp án đúng
                boolean isCorrect = answerDAO.isCorrectAnswer(answerId);

                // Lưu câu trả lời của user vào bảng user_answers
                userAnswerDAO.saveUserAnswer(username, questionId, answerId, isCorrect);

                // Nếu đúng, tăng số lượng câu trả lời đúng
>>>>>>> e18aefb (update)
                if (isCorrect) {
                    correctAnswers++;
                }
            }
        }
<<<<<<< HEAD
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
=======

        // Tính điểm
        double score = (double) correctAnswers / totalQuestions * 100;

        // Gửi dữ liệu kết quả về trang kết quả
        request.setAttribute("score", score);
        request.setAttribute("correctAnswers", correctAnswers);
        request.setAttribute("totalQuestions", totalQuestions);
>>>>>>> e18aefb (update)
        request.getRequestDispatcher("quizResult.jsp").forward(request, response);
    }
}

