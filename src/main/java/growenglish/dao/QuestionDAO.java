package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Question;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
<<<<<<< HEAD
    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT id, quiz_id, text FROM questions WHERE quiz_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======

    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> questions = new ArrayList<>();
        // FIX: Sửa lại tên bảng và cột
        String query = "SELECT id, quiz_id, text FROM questions WHERE quiz_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setInt(1, quizId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Question question = new Question();
<<<<<<< HEAD
=======
                    // FIX: Sửa lại tên cột khi lấy dữ liệu
>>>>>>> e18aefb (update)
                    question.setQuestionId(resultSet.getInt("id"));
                    question.setQuizId(resultSet.getInt("quiz_id"));
                    question.setQuestionText(resultSet.getString("text"));
                    questions.add(question);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }
}