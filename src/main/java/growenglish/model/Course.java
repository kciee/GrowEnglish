package growenglish.model;

public class Course {
    private int id;
    private String name;
    private String shortDescription;
    private double price;
    private String imagePath;
    
    public Course() {
    }

    public Course(int id, String name, String shortDescription, double price, String imagePath) {
        this.id = id;
        this.name = name;
        this.shortDescription = shortDescription;
        this.price = price;
        this.imagePath = imagePath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getImagePath() {
    	return imagePath;
    }
    
    public void setImagePath(String imagePath) {
    	this.imagePath = imagePath;
    }
}