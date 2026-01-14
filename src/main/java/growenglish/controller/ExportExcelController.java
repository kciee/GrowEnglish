package growenglish.controller;

import growenglish.dao.OrderDAO;
import growenglish.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/export-orders")
public class ExportExcelController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/csv; charset=UTF-8");
        resp.setHeader("Content-Disposition", "attachment; filename=\"Orders_Report.csv\"");
        resp.getOutputStream().write(0xEF);
        resp.getOutputStream().write(0xBB);
        resp.getOutputStream().write(0xBF);
        PrintWriter writer = resp.getWriter();
        writer.println("ID,Khach Hang,Ngay Dat,Tong Tien,Trang Thai");
        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.getAllOrders();

        for (Order o : orders) {
            writer.println(o.getId() + "," +
                           o.getUsername() + "," +
                           o.getOrderDate() + "," +
                           o.getTotalPrice() + "," +
                           o.getStatus());
        }
    }
}