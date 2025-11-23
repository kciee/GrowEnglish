package growenglish.model;

public class FreeDocument {
    private int id;
    private String title;
    private String description;
    private String imagePath;
    private String videoOrWord;

    public FreeDocument() {
    }

    public FreeDocument(int id, String title, String description, String imagePath, String videoOrWord) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imagePath = imagePath;
        this.videoOrWord = videoOrWord;
    }

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
