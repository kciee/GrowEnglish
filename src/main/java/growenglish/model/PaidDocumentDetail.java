package growenglish.model;

public class PaidDocumentDetail {
	public int documentId;
	public String content;
	public String videoUrl;
	
	public PaidDocumentDetail() {}

	public PaidDocumentDetail(int documentId, String content, String videoUrl) {
		this.documentId = documentId;
		this.content = content;
		this.videoUrl = videoUrl;
	}

	public int getDocumentId() {
		return documentId;
	}

	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
}
