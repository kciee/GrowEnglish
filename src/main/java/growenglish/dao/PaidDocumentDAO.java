package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.PaidDocument;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PaidDocumentDAO {
    public List<PaidDocument> getAllPaidDocuments() {
        List<PaidDocument> documentList = new ArrayList<>();
        String query = "SELECT * FROM paid_documents";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                PaidDocument document = new PaidDocument();
                document.setId(resultSet.getInt("Id"));
                document.setTitle(resultSet.getString("Title"));
                document.setDescription(resultSet.getString("Description"));
                document.setImagePath(resultSet.getString("ImagePath"));
                document.setVideoOrWord(resultSet.getString("VideoOrWord"));
                document.setPrice(resultSet.getDouble("Price"));
                documentList.add(document);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return documentList;
    }
    
    public boolean insertPaidDocument(PaidDocument doc) {
        String query = "INSERT INTO paid_documents (Title, Description, ImagePath, VideoOrWord, Price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, doc.getTitle());
            statement.setString(2, doc.getDescription());
            statement.setString(3, doc.getImagePath());
            statement.setString(4, doc.getVideoOrWord());
            statement.setDouble(5, doc.getPrice());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePaidDocument(PaidDocument doc) {
        String query = "UPDATE paid_documents SET Title = ?, Description = ?, ImagePath = ?, VideoOrWord = ?, Price = ? WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, doc.getTitle());
            statement.setString(2, doc.getDescription());
            statement.setString(3, doc.getImagePath());
            statement.setString(4, doc.getVideoOrWord());
            statement.setDouble(5, doc.getPrice());
            statement.setInt(6, doc.getId());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePaidDocument(int id) {
        String query = "DELETE FROM paid_documents WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public PaidDocument getPaidDocumentById(int id) {
        String query = "SELECT * FROM paid_documents WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new PaidDocument(
                    resultSet.getInt("Id"),
                    resultSet.getString("Title"),
                    resultSet.getString("Description"),
                    resultSet.getString("ImagePath"),
                    resultSet.getString("VideoOrWord"),
                    resultSet.getDouble("Price")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}