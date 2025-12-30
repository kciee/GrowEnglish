package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Quiz;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {
    public List<Quiz> getAllQuizzes() {
        List<Quiz> quizzes = new ArrayList<>();
        String query = "SELECT id, name, description FROM quizzes";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int quizId = rs.getInt("id");
                String quizName = rs.getString("name");
                String description = rs.getString("description");
                quizzes.add(new Quiz(quizId, quizName, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizzes;
    }
    
    public boolean insertQuiz(Quiz quiz) {
        String sql = "INSERT INTO quizzes (name, description) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, quiz.getQuizName());
            stmt.setString(2, quiz.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateQuiz(Quiz quiz) {
        String sql = "UPDATE quizzes SET name = ?, description = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, quiz.getQuizName());
            stmt.setString(2, quiz.getDescription());
            stmt.setInt(3, quiz.getQuizId());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteQuiz(int id) {
        String sql = "DELETE FROM quizzes WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}