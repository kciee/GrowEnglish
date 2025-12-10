package growenglish.model;

public class LearningDocument {
    private String username;
    private int documentId;

    public LearningDocument() {
    }

    public LearningDocument(String username, int documentId) {
        this.username = username;
        this.documentId = documentId;

    }

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

    @Override
    public String toString() {
        return "LearningDocument{" +
                "username='" + username + '\'' +
                ", documentId=" + documentId +
                '}';
    }
}