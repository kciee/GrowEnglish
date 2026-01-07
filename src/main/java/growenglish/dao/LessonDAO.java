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
                Lesson lesson = new Lesson();
                lesson.setId(rs.getInt("id"));
                lesson.setCourseId(rs.getInt("course_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setVideoUrl(rs.getString("video_url"));
                lesson.setContent(rs.getString("content"));
                lesson.setOrderIndex(rs.getInt("order_index"));
                list.add(lesson);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean hasUserBoughtCourse(String username, int courseId) {
        String sql = "SELECT COUNT(*) FROM user_courses WHERE username = ? AND course_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}