package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    public void addReview(String username, int docId, int rating, String comment) {
        String sql = "INSERT INTO reviews (username, document_id, rating, comment) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setInt(2, docId);
            ps.setInt(3, rating);
            ps.setString(4, comment);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Review> getReviewsByDocId(int docId) {
        List<Review> list = new ArrayList<>();
        String sql = "SELECT r.*, u.avatar_url FROM reviews r " +
                     "JOIN users u ON r.username = u.username " +
                     "WHERE r.document_id = ? ORDER BY r.created_at DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, docId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("avatar_url"),
                    rs.getInt("document_id"),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getTimestamp("created_at")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}