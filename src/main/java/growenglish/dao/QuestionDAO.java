package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Question;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    public List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT id, quiz_id, text FROM questions WHERE quiz_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, quizId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Question question = new Question();
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
    
    public int insertQuestion(Question question) {
        String sql = "INSERT INTO questions (quiz_id, text) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { 
            stmt.setInt(1, question.getQuizId());
            stmt.setString(2, question.getQuestionText());
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); 
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean deleteQuestion(int id) {
        String sql = "DELETE FROM questions WHERE id = ?";
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