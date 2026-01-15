package growenglish.dao;

import growenglish.db.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminStatsDAO {
    private int count(String sql) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countUsers() {
        return count("SELECT COUNT(*) FROM users");
    }

    public int countCourses() {
        return count("SELECT COUNT(*) FROM Course");
    }

    public int countDocuments() {
    	String sql = "SELECT (SELECT COUNT(*) FROM free_documents) + (SELECT COUNT(*) FROM paid_documents)";
        return count(sql);
    }

    public int countQuizzes() {
        return count("SELECT COUNT(*) FROM quizzes");
    }

    public int countOrders() {
        return count("SELECT COUNT(*) FROM orders");
    }

    public double sumRevenue() {
        String sql = "SELECT SUM(total_price) FROM orders WHERE status = 'success'";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public Map<String, Double> getRevenueLast7Days() {
        Map<String, Double> data = new LinkedHashMap<>();
        String sql = "SELECT CAST(order_date AS DATE) as Date, SUM(total_price) as Revenue " +
                     "FROM orders WHERE order_date >= DATEADD(day, -7, GETDATE()) " +
                     "GROUP BY CAST(order_date AS DATE) ORDER BY Date ASC";
        try (Connection conn = growenglish.db.DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                data.put(rs.getString("Date"), rs.getDouble("Revenue"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return data;
    }
}