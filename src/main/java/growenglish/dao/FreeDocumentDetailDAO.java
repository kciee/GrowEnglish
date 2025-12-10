package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.FreeDocumentDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FreeDocumentDetailDAO {
    public FreeDocumentDetail getDocumentDetailById(int documentId) {
        FreeDocumentDetail detail = null;
        String query = "SELECT * FROM free_document_details WHERE DocumentId = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, documentId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                detail = new FreeDocumentDetail();
                detail.setDocumentId(resultSet.getInt("DocumentId"));
                detail.setContent(resultSet.getString("Content"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return detail;
    }
}