package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.LearningDocument;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LearningDocumentDAO {
    public void add(LearningDocument learningDocument) {
        String sql = "INSERT INTO learning_documents (username, DocumentId, type) VALUES (?, ?, ?)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, learningDocument.getUsername());
            preparedStatement.setInt(2, learningDocument.getDocumentId());
            preparedStatement.setString(3, learningDocument.getType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Lỗi khi thêm LearningDocument: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<LearningDocument> getIdDocumentByUsername(String username) {
        String sql = "SELECT username, DocumentId, type FROM learning_documents WHERE username = ?";
        List<LearningDocument> learningDocuments = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                LearningDocument document = new LearningDocument();
                document.setUsername(resultSet.getString("username"));
                document.setDocumentId(resultSet.getInt("DocumentId"));
                document.setType(resultSet.getString("type"));
                learningDocuments.add(document);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy danh sách DocumentId: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return learningDocuments;
    }
}