package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.PaidDocumentDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaidDocumentDetailDAO {
    public PaidDocumentDetail getDetailById(int id) {
        String query = "SELECT * FROM paid_document_details WHERE DocumentId = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PaidDocumentDetail(
                    rs.getInt("DocumentId"),
                    rs.getString("Content"),
                    rs.getString("VideoUrl")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkUserOwnership(String username, int docId) {
        String query = "SELECT COUNT(*) FROM learning_documents WHERE username = ? AND DocumentId = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setInt(2, docId);
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