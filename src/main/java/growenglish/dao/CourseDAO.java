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
<<<<<<< HEAD
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
=======
        String query = "SELECT * FROM Course"; // Thay đổi tên bảng và các cột tùy theo cơ sở dữ liệu của bạn

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id")); // Đảm bảo cột "id" tồn tại trong bảng Courses
                course.setName(resultSet.getString("name")); // Đảm bảo cột "name" tồn tại
                course.setShortDescription(resultSet.getString("shortDescription")); // Cột mô tả ngắn
                course.setPrice(resultSet.getDouble("price")); // Cột giá

                courseList.add(course);
            }

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
<<<<<<< HEAD
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
=======
>>>>>>> e18aefb (update)
}
