package growenglish.model;

public class FreeDocument {
<<<<<<< HEAD
    private int id;
    private String title;
    private String description;
    private String imagePath;
    private String videoOrWord;

    public FreeDocument() {
    }

=======
    private int id;              // Mã ID tài liệu
    private String title;        // Tiêu đề tài liệu
    private String description;  // Mô tả chi tiết tài liệu
    private String imagePath;    // Đường dẫn hình ảnh
    private String videoOrWord;  // Kiểu tài liệu (Video hoặc Word)

    // Constructor mặc định
    public FreeDocument() {
    }

    // Constructor đầy đủ tham số
>>>>>>> e18aefb (update)
    public FreeDocument(int id, String title, String description, String imagePath, String videoOrWord) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imagePath = imagePath;
        this.videoOrWord = videoOrWord;
    }

<<<<<<< HEAD
=======
    // Getter và Setter cho các thuộc tính
>>>>>>> e18aefb (update)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getVideoOrWord() {
        return videoOrWord;
    }

    public void setVideoOrWord(String videoOrWord) {
        this.videoOrWord = videoOrWord;
    }

    @Override
    public String toString() {
        return "FreeDocument{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", videoOrWord='" + videoOrWord + '\'' +
                '}';
    }
}
