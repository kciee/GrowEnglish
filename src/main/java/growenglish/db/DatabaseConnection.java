package growenglish.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // 1. Tên server (Lưu ý dấu \\ là bắt buộc trong Java)
    private final static String serverName = "DESKTOP-2P01EAA\\MSSQLSERVER01"; 
    
    // 2. Tên Database
    private final static String dbName = "GrowEnglish";
    
    // 3. Tài khoản SQL (Bạn nhớ cấu hình user sa trong SQL Server như mình dặn nhé)
    private final static String username = "sa"; 
    private final static String password = "123456"; 

    // Hàm lấy kết nối (Dùng cho cả Web và Test)
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Khai báo Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Chuỗi kết nối
        String url = "jdbc:sqlserver://" + serverName 
                   + ";databaseName=" + dbName
                   + ";encrypt=true;trustServerCertificate=true;";

        return DriverManager.getConnection(url, username, password);
    }
    
    // ==========================================
    // ĐÂY LÀ HÀM MAIN - BẠN ĐANG THIẾU CÁI NÀY
    // ==========================================
    public static void main(String[] args) {
        System.out.println("Đang thử kết nối tới SQL Server...");
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("✅ KẾT NỐI THÀNH CÔNG!");
                System.out.println("Server: " + serverName);
                System.out.println("Database: " + dbName);
                conn.close();
            }
        } catch (Exception e) {
            System.err.println("❌ KẾT NỐI THẤT BẠI!");
            e.printStackTrace();
        }
    }
}