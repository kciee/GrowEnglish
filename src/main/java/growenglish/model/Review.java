package growenglish.model;

import java.sql.Timestamp;

public class Review {
    private int id;
    private String username;
    private String userAvatar;
    private int documentId;
    private int rating;
    private String comment;
    private Timestamp createdAt;

    public Review() {}
    
    public Review(int id, String username, String userAvatar, int documentId, int rating, String comment, Timestamp createdAt) {
        this.id = id;
        this.username = username;
        this.userAvatar = userAvatar;
        this.documentId = documentId;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserAvatar() {
		return userAvatar;
	}
	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
}