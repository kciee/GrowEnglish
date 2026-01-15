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
import java.util.List;

@WebServlet("/admin/questions")
public class AdminQuestionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuestionDAO questionDAO;
    private AnswerDAO answerDAO;

    @Override
    public void init() {
        questionDAO = new QuestionDAO();
        answerDAO = new AnswerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int quizId = Integer.parseInt(req.getParameter("quizId"));
            List<Question> list = questionDAO.getQuestionsByQuizId(quizId);
            
            req.setAttribute("questions", list);
            req.setAttribute("quizId", quizId); 
            req.getRequestDispatcher("/adminQuestions.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/quizzes");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int quizId = Integer.parseInt(req.getParameter("quizId"));

        if ("delete".equals(action)) {
            int questionId = Integer.parseInt(req.getParameter("questionId"));
            questionDAO.deleteQuestion(questionId);
        } else if ("create".equals(action)) {
            String questionText = req.getParameter("questionText");
            Question q = new Question(0, quizId, questionText);
            int questionId = questionDAO.insertQuestion(q);

            if (questionId != -1) {
                String[] answers = req.getParameterValues("answers"); 
                String correctIndexStr = req.getParameter("correctAnswer"); 
                int correctIndex = (correctIndexStr != null) ? Integer.parseInt(correctIndexStr) : 0;

                for (int i = 0; i < answers.length; i++) {
                    boolean isCorrect = (i == correctIndex);
                    Answer ans = new Answer(0, questionId, answers[i], isCorrect);
                    answerDAO.insertAnswer(ans);
                }
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/questions?quizId=" + quizId);
    }
}