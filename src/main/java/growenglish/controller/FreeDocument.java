package growenglish.controller;

import growenglish.dao.FreeDocumentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

<<<<<<< HEAD
@WebServlet(name = "FreeDocument", value = "/FreeDocument")
public class FreeDocument extends HttpServlet {
=======
// Giữ nguyên URL mapping của bạn
@WebServlet(name = "FreeDocument", value = "/FreeDocument")
public class FreeDocument extends HttpServlet {

>>>>>>> e18aefb (update)
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();
        List<growenglish.model.FreeDocument> documentList = freeDocumentDAO.getAllFreeDocuments();
        request.setAttribute("listDocs", documentList);
=======
        // 1. Khởi tạo DAO
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();
        
        // 2. Gọi DAO để lấy danh sách tài liệu
        List<growenglish.model.FreeDocument> documentList = freeDocumentDAO.getAllFreeDocuments();

        // 3. FIX: Đặt danh sách vào request với một cái tên nhất quán, ví dụ "listDocs"
        request.setAttribute("listDocs", documentList);

        // 4. Chuyển tiếp đến trang JSP để hiển thị
        // FIX: Đảm bảo tên file JSP là chính xác
>>>>>>> e18aefb (update)
        request.getRequestDispatcher("/freeDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
=======
        // Hiện tại chưa cần xử lý gì ở đây
>>>>>>> e18aefb (update)
        doGet(request, response);
    }
}