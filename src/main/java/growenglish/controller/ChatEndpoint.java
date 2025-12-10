package growenglish.controller;

import growenglish.dao.ChatDAO;
import growenglish.model.ChatMessage;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
<<<<<<< HEAD
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
@ServerEndpoint("/chatws")
public class ChatEndpoint {
    private static List<Session> clients = new CopyOnWriteArrayList<>();

=======
import java.util.ArrayList;
import java.util.List;

@ServerEndpoint("/chatws")
public class ChatEndpoint {

    private static List<Session> clients = new ArrayList<>();

    // Khi client kết nối
>>>>>>> e18aefb (update)
    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New connection: " + session.getId());
<<<<<<< HEAD
=======

        // Gửi lại các tin nhắn đã lưu trong cơ sở dữ liệu cho client mới kết nối
>>>>>>> e18aefb (update)
        List<ChatMessage> messages = ChatDAO.getAllMessages();
        for (ChatMessage message : messages) {
            try {
                session.getBasicRemote().sendText(message.getUsername() + ": " + message.getContent());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
<<<<<<< HEAD
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String username = "Unknown";
        String content = message;
        String[] parts = message.split(":", 2);
        if (parts.length == 2 && !parts[0].isEmpty() && !parts[1].isEmpty()) {
        	username = parts[0].trim();
        	content = parts[1].trim();
        } else {
        	System.err.println("Malformed message received: " + message);
        	return;
        }
        ChatMessage chatMessage = new ChatMessage(username, content);
        ChatDAO.saveMessage(chatMessage);
        String formattedMessage = username + ": " + content;
        for (Session client : clients) {
            if (client.isOpen()) {
                client.getBasicRemote().sendText(formattedMessage);
            }
        }
    }
    
=======

    // Khi client gửi tin nhắn
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        // Lưu tin nhắn vào cơ sở dữ liệu
        String username = "Unknown User";  // Bạn có thể lấy tên người dùng từ session hoặc từ client nếu đã đăng nhập
        ChatMessage chatMessage = new ChatMessage(username, message);
        ChatDAO.saveMessage(chatMessage);

        // Gửi tin nhắn đến tất cả các client đã kết nối
        for (Session client : clients) {
            if (client.isOpen()) {
                client.getBasicRemote().sendText(username + ": " + message);
            }
        }
    }

    // Khi client ngắt kết nối
>>>>>>> e18aefb (update)
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }

<<<<<<< HEAD
=======
    // Khi có lỗi
>>>>>>> e18aefb (update)
    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Error on session " + session.getId() + ": " + throwable.getMessage());
    }
}
