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
                courseList.add(course);
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
    				return course;
    			}
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    public boolean insertCourse(Course course) {
        String sql = "INSERT INTO Course (name, shortDescription, price) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setString(2, course.getShortDescription());
            stmt.setDouble(3, course.getPrice());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCourse(Course course) {
        String sql = "UPDATE Course SET name = ?, shortDescription = ?, price = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setString(2, course.getShortDescription());
            stmt.setDouble(3, course.getPrice());
            stmt.setInt(4, course.getId());
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
}