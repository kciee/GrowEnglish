package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Order> getOrdersByUsername(String username) {
	    List<Order> list = new ArrayList<>();
	    String sql = "SELECT * FROM orders WHERE username = ? ORDER BY order_date DESC";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, username);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Order o = new Order();
	            o.setId(rs.getInt("id"));
	            o.setUsername(rs.getString("username"));
	            o.setTotalPrice(rs.getDouble("total_price"));
	            o.setStatus(rs.getString("status"));
	            o.setOrderDate(rs.getTimestamp("order_date"));
	            list.add(o);
	        }
	    } catch (Exception e) { e.printStackTrace(); }
	    return list;
	}
	
	public List<Order> getAllOrders() {
	    List<Order> list = new ArrayList<>();
	    String sql = "SELECT * FROM orders ORDER BY order_date DESC";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            Order o = new Order();
	            o.setId(rs.getInt("id"));
	            o.setUsername(rs.getString("username"));
	            o.setTotalPrice(rs.getDouble("total_price"));
	            o.setStatus(rs.getString("status"));
	            o.setOrderDate(rs.getTimestamp("order_date"));
	            list.add(o);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public boolean updateOrderStatus(int id, String status) {
	    String sql = "UPDATE orders SET status = ? WHERE id = ?";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, status);
	        ps.setInt(2, id);
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}