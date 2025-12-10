package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.ChatMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {
<<<<<<< HEAD
=======
    // Lưu tin nhắn vào cơ sở dữ liệu
>>>>>>> e18aefb (update)
    public static void saveMessage(ChatMessage message) {
        String sql = "INSERT INTO chat_messages (username, content) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, message.getUsername());
            stmt.setString(2, message.getContent());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
<<<<<<< HEAD
    
    public static List<ChatMessage> getAllMessages() {
        List<ChatMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM chat_messages ORDER BY timestamp DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
=======

    // Lấy tất cả tin nhắn từ cơ sở dữ liệu
    public static List<ChatMessage> getAllMessages() {
        List<ChatMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM chat_messages ORDER BY timestamp DESC";  // Sắp xếp theo thời gian nếu có trường 'timestamp'
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

>>>>>>> e18aefb (update)
            while (rs.next()) {
                String username = rs.getString("username");
                String content = rs.getString("content");
                messages.add(new ChatMessage(username, content));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messages;
    }
}
