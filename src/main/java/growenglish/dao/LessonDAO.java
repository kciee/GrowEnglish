package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Lesson;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LessonDAO {
    public List<Lesson> getLessonsByCourseId(int courseId) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM lessons WHERE course_id = ? ORDER BY order_index ASC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(
                    rs.getInt("id"),
                    rs.getInt("course_id"),
                    rs.getString("title"),
                    rs.getString("video_url"),
                    rs.getString("content"),
                    rs.getInt("order_index")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void insertLesson(Lesson l) {
        String sql = "INSERT INTO lessons (course_id, title, video_url, content, order_index) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, l.getCourseId());
            ps.setString(2, l.getTitle());
            ps.setString(3, l.getVideoUrl());
            ps.setString(4, l.getContent());
            ps.setInt(5, l.getOrderIndex());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteLesson(int id) {
        String sql = "DELETE FROM lessons WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    public boolean checkAccess(String username, int courseId) {
        String sql = "SELECT COUNT(*) FROM user_courses WHERE username = ? AND course_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1) > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }
}