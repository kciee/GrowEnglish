package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.FreeDocument;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FreeDocumentDAO {
<<<<<<< HEAD
    public FreeDocument getFreeDocumentById(int id) {
        FreeDocument freeDocument = null;
        String query = "SELECT id, title, description, image_path, video_or_word FROM free_documents WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
=======

    // FIX: Đã xóa constructor và biến databaseConnection không cần thiết.
    // Chúng ta sẽ sử dụng phương thức static DatabaseConnection.getConnection() để nhất quán.

    public FreeDocument getFreeDocumentById(int id) {
        FreeDocument freeDocument = null;
        // FIX: Sửa lại tên cột cho khớp với CSDL
        String query = "SELECT id, title, description, image_path, video_or_word FROM free_documents WHERE id = ?";

        // FIX: Chuyển sang dùng try-with-resources để tự động đóng kết nối, an toàn hơn.
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    freeDocument = new FreeDocument();
                    freeDocument.setId(resultSet.getInt("id"));
                    freeDocument.setTitle(resultSet.getString("title"));
                    freeDocument.setDescription(resultSet.getString("description"));
<<<<<<< HEAD
=======
                    // FIX: Sửa lại tên cột khi lấy dữ liệu ("image_path" thay vì "imagePath")
>>>>>>> e18aefb (update)
                    freeDocument.setImagePath(resultSet.getString("image_path"));
                    freeDocument.setVideoOrWord(resultSet.getString("video_or_word"));
                }
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi truy vấn FreeDocument: " + e.getMessage());
            e.printStackTrace();
        }
        return freeDocument;
    }

    public List<FreeDocument> getAllFreeDocuments() {
        List<FreeDocument> documentList = new ArrayList<>();
<<<<<<< HEAD
        String query = "SELECT id, title, description, image_path, video_or_word FROM free_documents";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
=======
        // Câu lệnh này đã đúng
        String query = "SELECT id, title, description, image_path, video_or_word FROM free_documents";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

>>>>>>> e18aefb (update)
            while (resultSet.next()) {
                FreeDocument document = new FreeDocument();
                document.setId(resultSet.getInt("id"));
                document.setTitle(resultSet.getString("title"));
                document.setDescription(resultSet.getString("description"));
<<<<<<< HEAD
=======
                // Các tên cột này đã đúng
>>>>>>> e18aefb (update)
                document.setImagePath(resultSet.getString("image_path"));
                document.setVideoOrWord(resultSet.getString("video_or_word"));
                documentList.add(document);
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi truy vấn dữ liệu từ bảng free_documents: " + e.getMessage());
            e.printStackTrace();
        }
        return documentList;
    }

    public boolean insertFreeDocument(FreeDocument document) {
<<<<<<< HEAD
        String query = "INSERT INTO free_documents (title, description, image_path, video_or_word) VALUES (?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======
        // FIX: Sửa lại tên cột trong câu lệnh INSERT (dùng chữ thường và dấu gạch dưới)
        String query = "INSERT INTO free_documents (title, description, image_path, video_or_word) VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setString(1, document.getTitle());
            statement.setString(2, document.getDescription());
            statement.setString(3, document.getImagePath());
            statement.setString(4, document.getVideoOrWord());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("Lỗi khi thêm tài liệu miễn phí: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateFreeDocument(FreeDocument document) {
<<<<<<< HEAD
        String query = "UPDATE free_documents SET title = ?, description = ?, image_path = ?, video_or_word = ? WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======
        // FIX: Sửa lại tên cột trong câu lệnh UPDATE (dùng chữ thường và dấu gạch dưới)
        String query = "UPDATE free_documents SET title = ?, description = ?, image_path = ?, video_or_word = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection(); // Sử dụng static method
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setString(1, document.getTitle());
            statement.setString(2, document.getDescription());
            statement.setString(3, document.getImagePath());
            statement.setString(4, document.getVideoOrWord());
            statement.setInt(5, document.getId());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("Lỗi khi cập nhật tài liệu miễn phí: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFreeDocument(int id) {
<<<<<<< HEAD
        String query = "DELETE FROM free_documents WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
=======
        // FIX: Sửa lại tên cột trong câu lệnh DELETE (dùng chữ thường)
        String query = "DELETE FROM free_documents WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection(); // Sử dụng static method
             PreparedStatement statement = connection.prepareStatement(query)) {

>>>>>>> e18aefb (update)
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("Lỗi khi xóa tài liệu miễn phí: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}