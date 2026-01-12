package growenglish.model;

public class LearningDocument {
    private String username;
    private int documentId;
    private String type;

    public LearningDocument() {
    }

    public LearningDocument(String username, int documentId, String type) {
        this.username = username;
        this.documentId = documentId;
        this.type = type;
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
    
    public String getType() {
    	return type;
    }
    
    public void setType(String type) {
    	this.type = type;
    }

	@Override
	public String toString() {
		return "LearningDocument [username=" + username + ", documentId=" + documentId + ", type=" + type + "]";
	}
}