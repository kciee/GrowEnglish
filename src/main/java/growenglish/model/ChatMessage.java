package growenglish.model;

import java.sql.Timestamp;

public class ChatMessage {
<<<<<<< HEAD
    private String username;
    private String content;
    private Timestamp timestamp;

    public ChatMessage(String username, String content) {
        this.username = username;
        this.content = content;
        this.timestamp = new Timestamp(System.currentTimeMillis());
    }

=======
    private String username; // Tên người gửi
    private String content;  // Nội dung tin nhắn
    private Timestamp timestamp; // Thời gian gửi tin nhắn

    // Constructor
    public ChatMessage(String username, String content) {
        this.username = username;
        this.content = content;
        this.timestamp = new Timestamp(System.currentTimeMillis()); // Thời gian hiện tại khi tạo tin nhắn
    }

    // Getters và Setters
>>>>>>> e18aefb (update)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

<<<<<<< HEAD
=======
    // Override toString để in ra thông tin tin nhắn
>>>>>>> e18aefb (update)
    @Override
    public String toString() {
        return "ChatMessage{" +
                "username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
