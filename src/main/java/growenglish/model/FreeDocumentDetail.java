package growenglish.model;

public class FreeDocumentDetail {
<<<<<<< HEAD
    private int documentId;
    private String content;
=======
    private int documentId;  // Mã ID tài liệu
    private String content;  // Nội dung chi tiết của tài liệu
>>>>>>> e18aefb (update)

    public FreeDocumentDetail() {
    }

    public FreeDocumentDetail(int documentId, String content) {
        this.documentId = documentId;
        this.content = content;
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
}
