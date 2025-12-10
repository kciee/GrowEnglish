package growenglish.dao;

import growenglish.db.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserAnswerDAO {
    public void saveUserAnswer(String username, int questionId, int answerId, boolean isCorrect) {
        String query = "INSERT INTO user_answers (username, question_id, answer_id, is_correct) VALUES (?, ?, ?, ?)";
<<<<<<< HEAD
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setString(1, username);
            statement.setInt(2, questionId);
            statement.setInt(3, answerId);
            statement.setBoolean(4, isCorrect);
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
