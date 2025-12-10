package growenglish.model;

public class Quiz {
    private int quizId;
    private String quizName;
    private String description;

    public Quiz() {
    }

    public Quiz(int quizId, String quizName, String description) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.description = description;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "quizId=" + quizId +
                ", quizName='" + quizName + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}