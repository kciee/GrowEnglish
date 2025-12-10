package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Answer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO {

    public List<Answer> getAnswersByQuestionId(int questionId) {
        List<Answer> answers = new ArrayList<>();
<<<<<<< HEAD
        String query = "SELECT id, question_id, text, is_correct FROM answers WHERE question_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======
        // FIX: Sửa lại tên bảng và cột
        String query = "SELECT id, question_id, text, is_correct FROM answers WHERE question_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setInt(1, questionId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Answer answer = new Answer();
<<<<<<< HEAD
=======
                    // FIX: Sửa lại tên cột khi lấy dữ liệu
>>>>>>> e18aefb (update)
                    answer.setAnswerId(resultSet.getInt("id"));
                    answer.setQuestionId(resultSet.getInt("question_id"));
                    answer.setAnswerText(resultSet.getString("text"));
                    answer.setCorrect(resultSet.getBoolean("is_correct"));
                    answers.add(answer);
                }
            }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answers;
    }

    public boolean isCorrectAnswer(int answerId) {
<<<<<<< HEAD
=======
        // FIX: Sửa lại tên bảng và cột
>>>>>>> e18aefb (update)
        String query = "SELECT is_correct FROM answers WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, answerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getBoolean("is_correct");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}