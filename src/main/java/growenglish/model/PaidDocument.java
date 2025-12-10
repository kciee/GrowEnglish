package growenglish.model;

public class PaidDocument {
    private int id;
    private String title;
    private String description;
    private String imagePath;
    private String videoOrWord;
    private double price;

    public PaidDocument() {
    }

    public PaidDocument(int id, String title, String description, String imagePath, String videoOrWord, double price) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imagePath = imagePath;
        this.videoOrWord = videoOrWord;
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "PaidDocument{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", videoOrWord='" + videoOrWord + '\'' +
                ", price=" + price +
                '}';
    }
}