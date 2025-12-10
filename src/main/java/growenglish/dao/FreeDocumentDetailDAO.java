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
<<<<<<< HEAD
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, documentId);
            ResultSet resultSet = statement.executeQuery();
=======

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, documentId);
            ResultSet resultSet = statement.executeQuery();

>>>>>>> e18aefb (update)
            if (resultSet.next()) {
                detail = new FreeDocumentDetail();
                detail.setDocumentId(resultSet.getInt("DocumentId"));
                detail.setContent(resultSet.getString("Content"));
            }
<<<<<<< HEAD
        } catch (Exception e) {
            e.printStackTrace();
        }
=======

        } catch (Exception e) {
            e.printStackTrace();
        }

>>>>>>> e18aefb (update)
        return detail;
    }
}
