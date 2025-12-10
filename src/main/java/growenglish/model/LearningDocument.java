package growenglish.model;

public class LearningDocument {
<<<<<<< HEAD
    private String username;
    private int documentId;

    public LearningDocument() {
    }

=======
    private String username;        // ID của người dùng
    private int documentId;         // ID của tài liệu


    // Constructor không tham số
    public LearningDocument() {
    }

    // Constructor đầy đủ tham số
>>>>>>> e18aefb (update)
    public LearningDocument(String username, int documentId) {
        this.username = username;
        this.documentId = documentId;

    }

<<<<<<< HEAD
=======
    // Getter và Setter
>>>>>>> e18aefb (update)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    @Override
    public String toString() {
        return "LearningDocument{" +
                "username='" + username + '\'' +
                ", documentId=" + documentId +
                '}';
    }
}
