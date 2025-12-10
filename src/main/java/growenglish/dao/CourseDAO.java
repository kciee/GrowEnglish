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
}