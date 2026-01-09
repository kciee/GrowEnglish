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
<<<<<<< HEAD
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
=======
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
>>>>>>> de6321bd66fb65117a93e23529a15a50e37af601
        String sql = "SELECT COUNT(*) FROM user_courses WHERE username = ? AND course_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
<<<<<<< HEAD
            if (rs.next()) return rs.getInt(1) > 0;
        } catch (Exception e) { e.printStackTrace(); }
=======
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
>>>>>>> de6321bd66fb65117a93e23529a15a50e37af601
        return false;
    }
}