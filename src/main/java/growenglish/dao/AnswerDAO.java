package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Answer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO {

    public List<Answer> getAnswersByQuestionId(int questionId) {
        List<Answer> answers = new ArrayList<>();
        String query = "SELECT id, question_id, text, is_correct FROM answers WHERE question_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, questionId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Answer answer = new Answer();
                    answer.setAnswerId(resultSet.getInt("id"));
                    answer.setQuestionId(resultSet.getInt("question_id"));
                    answer.setAnswerText(resultSet.getString("text"));
                    answer.setCorrect(resultSet.getBoolean("is_correct"));
                    answers.add(answer);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answers;
    }

    public boolean isCorrectAnswer(int answerId) {
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
    
    public void insertAnswer(Answer answer) {
        String sql = "INSERT INTO answers (question_id, text, is_correct) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, answer.getQuestionId());
            stmt.setString(2, answer.getAnswerText());
            stmt.setBoolean(3, answer.isCorrect());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}