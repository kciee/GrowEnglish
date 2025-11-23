package growenglish.model;

import java.sql.Timestamp;

public class ChatMessage {
    private String username;
    private String content;
    private Timestamp timestamp;

    public ChatMessage(String username, String content) {
        this.username = username;
        this.content = content;
        this.timestamp = new Timestamp(System.currentTimeMillis());
    }

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

    @Override
    public String toString() {
        return "ChatMessage{" +
                "username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
