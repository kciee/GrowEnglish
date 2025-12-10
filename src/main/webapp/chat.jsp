<<<<<<< HEAD
<%-- File: chat.jsp --%>
=======
>>>>>>> e18aefb (update)
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        #messages {
            list-style-type: none;
            margin: 0;
            padding: 0;
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        #messages li {
            padding: 8px;
            margin-bottom: 10px;
            background-color: #f1f1f1;
            border-radius: 4px;
        }
<<<<<<< HEAD
        #chatForm {
            margin-top: 20px;
        }
=======

        #chatForm {
            margin-top: 20px;
        }

>>>>>>> e18aefb (update)
        #messageInput {
            width: 80%;
            padding: 10px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        #sendBtn {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<h2>Chat Room</h2>
<<<<<<< HEAD
<ul id="messages">
=======

<!-- Hiển thị danh sách tin nhắn -->
<ul id="messages">
    <!-- Tin nhắn được thêm vào ở đây -->
>>>>>>> e18aefb (update)
    <c:forEach var="message" items="${messages}">
        <li><strong>${message.username}</strong>: ${message.content}</li>
    </c:forEach>
</ul>
<<<<<<< HEAD
<form id="chatForm">
	<input type="hidden" name="username" id="username" value="${sessionScope.user.username}" required>
    <input type="text" name="content" id="messageInput" placeholder="Enter your message" required>
    <button type="submit" id="sendBtn">Send</button>
</form>
<script>
	const wsProtocol = window.location.protocol === 'https: ' ? 'wss:' : 'ws:';
	const wsUrl = `${wsProtocol}
    const socket = new WebSocket(wsUrl);
    socket.onopen = function (event) {
        console.log("Connected to WebSocket");
    };
    socket.onmessage = function (event) {
        const message = event.data;
        const messageElement = document.createElement("li");
        const parts = message.split(':', 2);
        if (parts.length === 2)	{
        	const strong = document.createElement('strong');
        	strong.textContent = parts[0];
        	messageElement.appendChild(strong);
        	messageElement.append(': ' + parts[1]);
        } else {
        	messageElement.textContent = message;
        }
        document.getElementById("messages").appendChild(messageElement);
    };
    document.getElementById("chatForm").onsubmit = function (event) {
        event.preventDefault();
        const message = document.getElementById("messageInput").value;
        const username = document.getElementById("username").value || "Quest";
        socket.send(username + ": " + message);
        const formData = new FormData();
        formData.append("username", username);
        formData.append("content", message);
=======

<form id="chatForm" action="chat" method="post">
    <input type="text" name="username" id="username" placeholder="Enter your name" required>
    <input type="text" name="content" id="messageInput" placeholder="Enter your message" required>
    <button type="submit" id="sendBtn">Send</button>
</form>

<script>
    const socket = new WebSocket("ws://localhost:8080/your-web-app/chatws");

    // Khi kết nối WebSocket thành công
    socket.onopen = function (event) {
        console.log("Connected to WebSocket");
    };

    // Khi nhận tin nhắn từ server
    socket.onmessage = function (event) {
        const message = event.data;
        const messageElement = document.createElement("li");
        messageElement.textContent = message;
        document.getElementById("messages").appendChild(messageElement);
    };

    // Gửi tin nhắn khi form được gửi
    document.getElementById("chatForm").onsubmit = function (event) {
        event.preventDefault();
        const message = document.getElementById("messageInput").value;
        const username = document.getElementById("username").value;

        // Gửi tin nhắn qua WebSocket
        socket.send(username + ": " + message);

        // Gửi tin nhắn qua HTTP để lưu vào cơ sở dữ liệu
        const formData = new FormData();
        formData.append("username", username);
        formData.append("content", message);

>>>>>>> e18aefb (update)
        fetch('chat', {
            method: 'POST',
            body: formData
        });
<<<<<<< HEAD
=======

        // Xóa input message sau khi gửi
>>>>>>> e18aefb (update)
        document.getElementById("messageInput").value = '';
    };
</script>
</body>
</html>
