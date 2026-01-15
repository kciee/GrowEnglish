package growenglish.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final static String serverName = "DESKTOP-2P01EAA\\MSSQLSERVER01"; 
    private final static String dbName = "GrowEnglish";
    private final static String username = "sa"; 
    private final static String password = "123456"; 
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://" + serverName 
                   + ";databaseName=" + dbName
                   + ";encrypt=true;trustServerCertificate=true;";

        return DriverManager.getConnection(url, username, password);
    }
    
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