package growenglish.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // --- BẠN CẦN THAY ĐỔI CÁC THÔNG TIN DƯỚI ĐÂY CHO ĐÚNG VỚI MÁY CỦA BẠN ---

    // FIX 1: TÊN SERVER - Đây là phần quan trọng nhất.
    // Hãy mở SQL Server Management Studio (SSMS) và xem tên server bạn dùng để đăng nhập.
    // Nó có thể là "MAYANO", "TÊN-MÁY-TÍNH\\SQLEXPRESS", hoặc chỉ là "localhost".
    private final static String serverName = "DESKTOP-EETEBS6"; // <--- THAY BẰNG TÊN SERVER CỦA BẠN

    private final static String port = "1433"; // Cổng mặc định của SQL Server
    private final static String dbName = "GrowEnglish";
    
    // FIX 2: THÔNG TIN ĐĂNG NHẬP
    // Nếu bạn đăng nhập vào SSMS mà không cần gõ username/password (dùng Windows Authentication),
    // hãy để 2 dòng dưới đây trống.
    private final static String username = "sa"; // <--- ĐIỀN USERNAME (nếu có)
    private final static String password = "123456"; // <--- ĐIỀN MẬT KHẨU (nếu có)
    
    // --- HẾT PHẦN CẦN SỬA ---
    
    private final static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:sqlserver://" + serverName + ":" + port + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;";
        
        Class.forName(driverClass);

        // FIX 3: CHỌN ĐÚNG CÁCH KẾT NỐI
        // Nếu bạn dùng Windows Authentication (không cần username/password)
        if (username == null || username.isEmpty()) {
            return DriverManager.getConnection(url); 
        }
        // Nếu bạn dùng SQL Server Authentication (có username/password)
        else {
            return DriverManager.getConnection(url, username, password);
        }
    }
}