package growenglish.dao;

import growenglish.db.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

public class LessonProgressDAO {
    public boolean markLessonCompleted(String username, int lessonId) {
        String sql = "IF NOT EXISTS (SELECT 1 FROM user_lesson_progress WHERE username = ? AND lesson_id = ?) " +
                     "BEGIN INSERT INTO user_lesson_progress (username, lesson_id) VALUES (?, ?) END";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, lessonId);
            ps.setString(3, username);
            ps.setInt(4, lessonId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Set<Integer> getCompletedLessonIds(String username, int courseId) {
        Set<Integer> completedIds = new HashSet<>();
        String sql = "SELECT ulp.lesson_id FROM user_lesson_progress ulp " +
                     "JOIN lessons l ON ulp.lesson_id = l.id " +
                     "WHERE ulp.username = ? AND l.course_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                completedIds.add(rs.getInt("lesson_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return completedIds;
    }
    
    public int getCourseProgress(String username, int courseId) {
        String sql = "SELECT " +
                     "(SELECT COUNT(*) FROM user_lesson_progress ulp JOIN lessons l ON ulp.lesson_id = l.id WHERE ulp.username = ? AND l.course_id = ?) * 100 / " +
                     "NULLIF((SELECT COUNT(*) FROM lessons WHERE course_id = ?), 0)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ps.setInt(3, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}