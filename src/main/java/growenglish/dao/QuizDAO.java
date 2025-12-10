package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Quiz;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {
<<<<<<< HEAD
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
=======

    public List<Quiz> getAllQuizzes() {
        List<Quiz> quizzes = new ArrayList<>();
        // FIX: Sửa lại tên bảng và cột
        String query = "SELECT id, name, description FROM quizzes";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // FIX: Sửa lại tên cột khi lấy dữ liệu
                int quizId = rs.getInt("id");
                String quizName = rs.getString("name");
                String description = rs.getString("description");

>>>>>>> e18aefb (update)
                quizzes.add(new Quiz(quizId, quizName, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizzes;
    }
}