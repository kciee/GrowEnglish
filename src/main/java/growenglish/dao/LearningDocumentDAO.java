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
    public static void main(String[] args) {
<<<<<<< HEAD
        LearningDocumentDAO dao = new LearningDocumentDAO();
        LearningDocument document = new LearningDocument();
        document.setUsername("tunton");
        document.setDocumentId(1);
        dao.add(document);
=======
        // Tạo một đối tượng LearningDocumentDAO
        LearningDocumentDAO dao = new LearningDocumentDAO();

        // Tạo một đối tượng LearningDocument với dữ liệu mẫu
        LearningDocument document = new LearningDocument();
        document.setUsername("tunton");
        document.setDocumentId(1);

        // Gọi phương thức add để thêm bản ghi vào cơ sở dữ liệu
        dao.add(document);

        // In ra thông báo để xác nhận
>>>>>>> e18aefb (update)
        System.out.println("Đã thêm tài liệu học vào cơ sở dữ liệu.");
    }

    public void add(LearningDocument learningDocument) {
        String sql = "INSERT INTO learning_documents (username, DocumentId) VALUES (?, ?)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
<<<<<<< HEAD
        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, learningDocument.getUsername());
            preparedStatement.setInt(2, learningDocument.getDocumentId());
            preparedStatement.executeUpdate();
=======

        try {
            // Lấy kết nối từ lớp DatabaseConnection
            connection = DatabaseConnection.getConnection();

            // Chuẩn bị câu lệnh SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, learningDocument.getUsername());
            preparedStatement.setInt(2, learningDocument.getDocumentId());

            // Thực thi câu lệnh
            preparedStatement.executeUpdate();

>>>>>>> e18aefb (update)
            System.out.println("LearningDocument đã được thêm thành công!");
        } catch (SQLException e) {
            System.err.println("Lỗi khi thêm LearningDocument: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
<<<<<<< HEAD
=======
            // Đóng tài nguyên để tránh rò
            // rỉ
>>>>>>> e18aefb (update)
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
            }
        }
    }

    public List<LearningDocument> getIdDocumentByUsername(String username) {
        String sql = "SELECT username, DocumentId FROM learning_documents WHERE username = ?";
        List<LearningDocument> learningDocuments = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
<<<<<<< HEAD
        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                LearningDocument document = new LearningDocument();
                document.setUsername(resultSet.getString("username"));
                document.setDocumentId(resultSet.getInt("DocumentId"));
=======

        try {
            // Lấy kết nối từ DatabaseConnection
            connection = DatabaseConnection.getConnection();

            // Chuẩn bị câu lệnh SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);

            // Thực thi câu lệnh và nhận kết quả
            resultSet = preparedStatement.executeQuery();

            // Duyệt qua từng dòng kết quả và tạo đối tượng LearningDocument
            while (resultSet.next()) {
                LearningDocument document = new LearningDocument();
                document.setUsername(resultSet.getString("username"));
                document.setDocumentId(resultSet.getInt("document_id"));

>>>>>>> e18aefb (update)
                learningDocuments.add(document);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy danh sách DocumentId: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
<<<<<<< HEAD
=======
            // Đóng tài nguyên
>>>>>>> e18aefb (update)
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
            }
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        return learningDocuments;
    }
}
