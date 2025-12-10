package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserDAO {

    public boolean insertUser(User user) {
<<<<<<< HEAD
        String sql = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getRole());
=======
        // FIX: Cập nhật câu lệnh INSERT với tên cột mới
        String sql = "INSERT INTO users (username, password, email, full_name, phone_number, birth_year, avatar_url, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getFullName());
            stmt.setString(5, user.getPhonenumber());
            stmt.setInt(6, user.getBirthYear());
            stmt.setString(7, user.getAvatarUrl());
            stmt.setString(8, user.getRole());

>>>>>>> e18aefb (update)
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
<<<<<<< HEAD
    
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
=======
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

>>>>>>> e18aefb (update)
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User(
                            resultSet.getString("username"),
                            resultSet.getString("password"),
                            resultSet.getString("email"),
                            resultSet.getString("full_name"),
                            resultSet.getString("phone_number"),
                            resultSet.getInt("birth_year"),
                            resultSet.getString("avatar_url")
                    );
                    user.setRole(resultSet.getString("role"));
                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
<<<<<<< HEAD
        return null;
    }
    
=======

        return null;
    }
>>>>>>> e18aefb (update)
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

<<<<<<< HEAD
=======
    // Phương thức helper để tránh lặp code
>>>>>>> e18aefb (update)
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User(
            rs.getString("username"),
            rs.getString("password"),
            rs.getString("email"),
            rs.getString("full_name"),
<<<<<<< HEAD
            rs.getString("phonenumber"),
=======
            rs.getString("phone_number"),
>>>>>>> e18aefb (update)
            rs.getInt("birth_year"),
            rs.getString("avatar_url")
        );
        user.setRole(rs.getString("role"));
        return user;
    }
    public boolean updateUser(User user) {
        String query = "UPDATE users SET full_name = ?, birth_year = ?, avatar_url = ? WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
            stmt.setString(1, user.getFullName());
            stmt.setInt(2, user.getBirthYear());
            stmt.setString(3, user.getAvatarUrl());
            stmt.setString(4, user.getUsername());
<<<<<<< HEAD
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
=======

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
>>>>>>> e18aefb (update)
    public void updateRole(String username, String newRole) {
        String query = "UPDATE users SET role = ? WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
<<<<<<< HEAD
            stmt.setString(1, newRole);
            stmt.setString(2, username);
            stmt.executeUpdate();
=======

            stmt.setString(1, newRole);
            stmt.setString(2, username);
            stmt.executeUpdate();

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
<<<<<<< HEAD
    
=======
>>>>>>> e18aefb (update)
    public void deleteUser(String username) {
        String query = "DELETE FROM users WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
<<<<<<< HEAD
            stmt.setString(1, username);
            stmt.executeUpdate();
=======

            stmt.setString(1, username);
            stmt.executeUpdate();

>>>>>>> e18aefb (update)
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}