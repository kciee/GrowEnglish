package growenglish.model;

public class User {
    private String username;
    private String password;
    private String email;
    private String fullName;
    private int birthYear;
    private String phonenumber;
    private String avatarUrl;
<<<<<<< HEAD
    private String role = "user";

=======
    private String role = "user"; // mặc định là user

    // Constructors
>>>>>>> e18aefb (update)
    public User() {
    }

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = "user";
    }

    public User(String username, String password, String email, String fullName, String phonenumber, int birthYear, String avatarUrl) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.phonenumber = phonenumber;
        this.birthYear = birthYear;
        this.avatarUrl = avatarUrl;
        this.role = "user";
    }
    public User(String username, String password, String email, String fullName, String phonenumber, int birthYear, String avatarUrl, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.phonenumber = phonenumber;
        this.birthYear = birthYear;
        this.avatarUrl = avatarUrl;
        this.role = role;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

<<<<<<< HEAD
=======
    // Getters and Setters
>>>>>>> e18aefb (update)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
<<<<<<< HEAD
    
=======
>>>>>>> e18aefb (update)
    @Override
    public String toString() {
    	return "User{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
