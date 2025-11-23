package growenglish.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import growenglish.db.DatabaseConnection;
import growenglish.model.Order;

public class OrderDAO {
	public boolean insertOrder(Order order) {
		String sql = "INSERT INTO orders (username, total_price, [status]) VALUES (?, ?, ?)";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setString(1, order.getUsername());
				stmt.setDouble(2, order.getTotalPrice());
				stmt.setString(3, order.getStatus());
				int rowsAffected = stmt.executeUpdate();
				return rowsAffected > 0;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
	}
}
