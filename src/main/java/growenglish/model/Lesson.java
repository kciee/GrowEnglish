package growenglish.model;

public class Lesson {
	public int id;
	public int courseId;
	public String title;
	public String videoUrl;
	public String content;
	public int orderIndex;
	
	public Lesson() {}

	public Lesson(int id, int courseId, String title, String videoUrl, String content, int orderIndex) {
		this.id = id;
		this.courseId = courseId;
		this.title = title;
		this.videoUrl = videoUrl;
		this.content = content;
		this.orderIndex = orderIndex;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}
	
	
}
