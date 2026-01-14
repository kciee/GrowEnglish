package growenglish.dao;

import growenglish.db.DatabaseConnection;
import growenglish.model.PaidDocument;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PaidDocumentDAO {
    public List<PaidDocument> getAllPaidDocuments() {
        List<PaidDocument> documentList = new ArrayList<>();
        String query = "SELECT * FROM paid_documents ORDER BY Id DESC";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                documentList.add(mapResultSetToDocument(resultSet));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return documentList;
    }

    public List<PaidDocument> getPaidDocumentsByPage(int page, int pageSize, double min, double max, String sort) {
        List<PaidDocument> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        StringBuilder sql = new StringBuilder("SELECT * FROM paid_documents WHERE 1=1 ");
        if (max > 0) {
            sql.append(" AND Price BETWEEN ? AND ? ");
        }
        sql.append(" ORDER BY ");
        if ("price_asc".equals(sort)) {
            sql.append("Price ASC");
        } else if ("price_desc".equals(sort)) {
            sql.append("Price DESC");
        } else {
            sql.append("Id DESC");
        }
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (max > 0) {
                ps.setDouble(paramIndex++, min);
                ps.setDouble(paramIndex++, max);
            }
            ps.setInt(paramIndex++, offset);
            ps.setInt(paramIndex++, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToDocument(rs));
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return list;
    }

    public int getTotalPaidDocumentsCount(double min, double max) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM paid_documents WHERE 1=1 ");
        if (max > 0) {
            sql.append(" AND Price BETWEEN ? AND ? ");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            
            if (max > 0) {
                ps.setDouble(1, min);
                ps.setDouble(2, max);
            }
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return 0;
    }
    
    public int getTotalPaidDocumentsCount() {
        return getTotalPaidDocumentsCount(0, 0);
    }

    public PaidDocument getPaidDocumentById(int id) {
        String query = "SELECT * FROM paid_documents WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToDocument(resultSet);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertPaidDocument(PaidDocument doc) {
        String query = "INSERT INTO paid_documents (Title, Description, ImagePath, VideoOrWord, Price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, doc.getTitle());
            statement.setString(2, doc.getDescription());
            statement.setString(3, doc.getImagePath());
            statement.setString(4, doc.getVideoOrWord());
            statement.setDouble(5, doc.getPrice());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePaidDocument(PaidDocument doc) {
        String query = "UPDATE paid_documents SET Title = ?, Description = ?, ImagePath = ?, VideoOrWord = ?, Price = ? WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, doc.getTitle());
            statement.setString(2, doc.getDescription());
            statement.setString(3, doc.getImagePath());
            statement.setString(4, doc.getVideoOrWord());
            statement.setDouble(5, doc.getPrice());
            statement.setInt(6, doc.getId());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePaidDocument(int id) {
        String query = "DELETE FROM paid_documents WHERE Id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private PaidDocument mapResultSetToDocument(ResultSet rs) throws Exception {
        return new PaidDocument(
            rs.getInt("Id"),
            rs.getString("Title"),
            rs.getString("Description"),
            rs.getString("ImagePath"),
            rs.getString("VideoOrWord"),
            rs.getDouble("Price")
        );
    }
}