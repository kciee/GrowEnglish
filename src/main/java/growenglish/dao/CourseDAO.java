package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    public List<Course> getAllCourses() {
        List<Course> courseList = new ArrayList<>();
        String query = "SELECT * FROM Course"; 
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                course.setShortDescription(resultSet.getString("shortDescription"));
                course.setPrice(resultSet.getDouble("price"));
                course.setImagePath(resultSet.getString("image_path")); 
                courseList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
    
    public List<Course> getCoursesByUsername(String username) {
        List<Course> courseList = new ArrayList<>();
        String query = "SELECT c.* FROM Course c " +
                       "JOIN user_courses uc ON c.id = uc.course_id " +
                       "WHERE uc.username = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
             
            statement.setString(1, username);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Course course = new Course();
                    course.setId(resultSet.getInt("id"));
                    course.setName(resultSet.getString("name"));
                    course.setShortDescription(resultSet.getString("shortDescription"));
                    course.setPrice(resultSet.getDouble("price"));
                    course.setImagePath(resultSet.getString("image_path"));
                    courseList.add(course);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
    
    public Course getCourseById(int id) {
        String query = "SELECT * FROM Course WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Course course = new Course();
                    course.setId(resultSet.getInt("id"));
                    course.setName(resultSet.getString("name"));
                    course.setShortDescription(resultSet.getString("shortDescription"));
                    course.setPrice(resultSet.getDouble("price"));
                    course.setImagePath(resultSet.getString("image_path"));
                    return course;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertCourse(Course course) {
        String sql = "INSERT INTO Course (name, shortDescription, price, image_path) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setString(2, course.getShortDescription());
            stmt.setDouble(3, course.getPrice());
            stmt.setString(4, course.getImagePath() != null ? course.getImagePath() : "assets/images/default-course.jpg");
            
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCourse(Course course) {
        String sql = "UPDATE Course SET name = ?, shortDescription = ?, price = ?, image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setString(2, course.getShortDescription());
            stmt.setDouble(3, course.getPrice());
            stmt.setString(4, course.getImagePath());
            stmt.setInt(5, course.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCourse(int id) {
        String sql = "DELETE FROM Course WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUserCourse(String username, int courseId) {
        String sql = "DELETE FROM user_courses WHERE username = ? AND course_id = ?";
        try (Connection conn = growenglish.db.DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, courseId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}