package growenglish.controller;

import growenglish.dao.AnswerDAO;
import growenglish.dao.QuestionDAO;
import growenglish.model.Answer;
import growenglish.model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "QuizDetailServlet", value = "/quizDetail")
public class QuizDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Servlet QuizDetailServlet được gọi!");
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> questions = questionDAO.getQuestionsByQuizId(quizId);
        if (!checkQuestionsAndAnswers(questions, quizId, request)) {
            response.getWriter().write("Có lỗi khi lấy câu hỏi và câu trả lời.");
            return;
        }
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("/quizDetail.jsp").forward(request, response);
    }
	
    private boolean checkQuestionsAndAnswers(List<Question> questions, int quizId, HttpServletRequest request) {
        if (questions == null || questions.isEmpty()) {
            System.out.println("Không có câu hỏi nào được trả về.");
            return false;
        }
        AnswerDAO answerDAO = new AnswerDAO();
        Map<Integer, List<Answer>> answersMap = new HashMap<>();
        for (Question question : questions) {
            List<Answer> answers = answerDAO.getAnswersByQuestionId(question.getQuestionId());
            if (answers == null || answers.isEmpty()) {
                System.out.println("Câu hỏi " + question.getQuestionText() + " không có câu trả lời.");
                return false;
            }
            answersMap.put(question.getQuestionId(), answers);
        }
        request.setAttribute("answersMap", answersMap);
        return true;
    }
}