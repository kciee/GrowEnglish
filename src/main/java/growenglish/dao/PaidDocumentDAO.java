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
<<<<<<< HEAD
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                PaidDocument document = new PaidDocument();
=======

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            // Duyệt qua từng dòng dữ liệu trong ResultSet
            while (resultSet.next()) {
                PaidDocument document = new PaidDocument();

>>>>>>> e18aefb (update)
                document.setId(resultSet.getInt("Id"));
                document.setTitle(resultSet.getString("Title"));
                document.setDescription(resultSet.getString("Description"));
                document.setImagePath(resultSet.getString("ImagePath"));
                document.setVideoOrWord(resultSet.getString("VideoOrWord"));
                document.setPrice(resultSet.getDouble("Price"));
<<<<<<< HEAD
                documentList.add(document);
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi truy vấn dữ liệu từ bảng paid_documents: " + e.getMessage());
        }
        return documentList;
    }
    
    public boolean insertPaidDocument(PaidDocument document) {
        String query = "INSERT INTO paid_documents (Title, Description, ImagePath, VideoOrWord, Price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======

                documentList.add(document);
            }

        } catch (Exception e) {
            System.err.println("Lỗi khi truy vấn dữ liệu từ bảng paid_documents: " + e.getMessage());
        }

        return documentList;
    }


    public boolean insertPaidDocument(PaidDocument document) {
        String query = "INSERT INTO paid_documents (Title, Description, ImagePath, VideoOrWord, Price) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setString(1, document.getTitle());
            statement.setString(2, document.getDescription());
            statement.setString(3, document.getImagePath());
            statement.setString(4, document.getVideoOrWord());
            statement.setDouble(5, document.getPrice());
<<<<<<< HEAD
            return statement.executeUpdate() > 0;
=======

            return statement.executeUpdate() > 0;

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            System.err.println("Lỗi khi thêm tài liệu trả phí: " + e.getMessage());
            return false;
        }
    }

<<<<<<< HEAD
    public boolean updatePaidDocument(PaidDocument document) {
        String query = "UPDATE paid_documents SET Title = ?, Description = ?, ImagePath = ?, VideoOrWord = ?, Price = ? WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======

    public boolean updatePaidDocument(PaidDocument document) {
        String query = "UPDATE paid_documents SET Title = ?, Description = ?, ImagePath = ?, VideoOrWord = ?, Price = ? WHERE Id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setString(1, document.getTitle());
            statement.setString(2, document.getDescription());
            statement.setString(3, document.getImagePath());
            statement.setString(4, document.getVideoOrWord());
            statement.setDouble(5, document.getPrice());
            statement.setInt(6, document.getId());
<<<<<<< HEAD
            return statement.executeUpdate() > 0;
=======

            return statement.executeUpdate() > 0;

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            System.err.println("Lỗi khi cập nhật tài liệu trả phí: " + e.getMessage());
            return false;
        }
    }

<<<<<<< HEAD
    public boolean deletePaidDocument(int id) {
        String query = "DELETE FROM paid_documents WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
=======

    public boolean deletePaidDocument(int id) {
        String query = "DELETE FROM paid_documents WHERE Id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);

            return statement.executeUpdate() > 0;

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            System.err.println("Lỗi khi xóa tài liệu trả phí: " + e.getMessage());
            return false;
        }
    }

    public PaidDocument getPaidDocumentById(int id) {
        String query = "SELECT * FROM paid_documents WHERE Id = ?";
<<<<<<< HEAD
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    PaidDocument document = new PaidDocument();
=======

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    PaidDocument document = new PaidDocument();

>>>>>>> e18aefb (update)
                    document.setId(resultSet.getInt("Id"));
                    document.setTitle(resultSet.getString("Title"));
                    document.setDescription(resultSet.getString("Description"));
                    document.setImagePath(resultSet.getString("ImagePath"));
                    document.setVideoOrWord(resultSet.getString("VideoOrWord"));
                    document.setPrice(resultSet.getDouble("Price"));
<<<<<<< HEAD
                    return document;
                }
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy tài liệu trả phí theo ID: " + e.getMessage());
        }
=======

                    return document;
                }
            }

        } catch (Exception e) {
            System.err.println("Lỗi khi lấy tài liệu trả phí theo ID: " + e.getMessage());
        }

>>>>>>> e18aefb (update)
        return null;
    }
}
