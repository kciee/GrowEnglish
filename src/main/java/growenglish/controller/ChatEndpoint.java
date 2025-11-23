package growenglish.controller;

import growenglish.dao.ChatDAO;
import growenglish.model.ChatMessage;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
@ServerEndpoint("/chatws")
public class ChatEndpoint {
    private static List<Session> clients = new CopyOnWriteArrayList<>();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New connection: " + session.getId());
        List<ChatMessage> messages = ChatDAO.getAllMessages();
        for (ChatMessage message : messages) {
            try {
                session.getBasicRemote().sendText(message.getUsername() + ": " + message.getContent());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
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
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Error on session " + session.getId() + ": " + throwable.getMessage());
    }
}
