package growenglish.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Giữ nguyên serverName, nó đã đúng (với 2 dấu \\)
    private final static String serverName = "DESKTOP-2P01EAA\\MSSQLSERVER01"; 
    
    // SỬA: XÓA HOÀN TOÀN BIẾN PORT
    // private final static String port = "1433"; // <-- XÓA DÒNG NÀY
    
    private final static String dbName = "GrowEnglish";
    
    // Giữ nguyên thông tin đăng nhập SQL của bạn
    private final static String username = "sa"; 
    private final static String password = "123456"; 
    private final static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        
        // SỬA LỖI DUY NHẤT TẠI ĐÂY:
        // Xóa (":" + port) ra khỏi chuỗi URL.
        String url = "jdbc:sqlserver://" + serverName + ";databaseName=" + dbName 
                   + ";encrypt=true;trustServerCertificate=true;";
        
        Class.forName(driverClass);
        
        // Logic if/else của bạn bây giờ sẽ đi vào khối 'else'
        // và dùng tài khoản 'sa' để kết nối
        if (username == null || username.isEmpty()) {
            return DriverManager.getConnection(url); 
        }
        else {
            return DriverManager.getConnection(url, username, password);
        }
    }
}