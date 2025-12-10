package growenglish.controller;

import growenglish.dao.ChatDAO;
import growenglish.model.ChatMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String content = request.getParameter("content");
<<<<<<< HEAD
        ChatMessage message = new ChatMessage(username, content);
        ChatDAO.saveMessage(message);
=======

        // Tạo tin nhắn mới và lưu vào cơ sở dữ liệu
        ChatMessage message = new ChatMessage(username, content);
        ChatDAO.saveMessage(message);

        // Chuyển hướng về lại trang chat để hiển thị tin nhắn
>>>>>>> e18aefb (update)
        response.sendRedirect("chat.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        List<ChatMessage> messages = ChatDAO.getAllMessages();
=======
        // Lấy tất cả tin nhắn từ cơ sở dữ liệu
        List<ChatMessage> messages = ChatDAO.getAllMessages();

        // Gửi danh sách tin nhắn đến trang chat.jsp
>>>>>>> e18aefb (update)
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }
}

