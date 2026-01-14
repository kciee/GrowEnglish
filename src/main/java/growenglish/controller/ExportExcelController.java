package growenglish.controller;

import growenglish.dao.OrderDAO;
import growenglish.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet("/admin/export-orders")
public class ExportExcelController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/csv; charset=UTF-8");
        resp.setHeader("Content-Disposition", "attachment; filename=\"Orders_Report.csv\"");

        try (OutputStream out = resp.getOutputStream()) {
            out.write(0xEF);
            out.write(0xBB);
            out.write(0xBF);
            String header = "ID,Khach Hang,Ngay Dat,Tong Tien,Trang Thai\n";
            out.write(header.getBytes(StandardCharsets.UTF_8));
            OrderDAO dao = new OrderDAO();
            List<Order> orders = dao.getAllOrders();
            for (Order o : orders) {
                String line = String.format("%d,%s,%s,%.2f,%s\n",
                        o.getId(),
                        escapeCsv(o.getUsername()),
                        o.getOrderDate(),
                        o.getTotalPrice(),
                        o.getStatus());
                
                out.write(line.getBytes(StandardCharsets.UTF_8));
            }
            
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private String escapeCsv(String data) {
        if (data == null) return "";
        if (data.contains(",")) {
            return "\"" + data + "\"";
        }
        return data;
    }
}