<%-- File: chat.jsp --%>
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
        #messages {
            list-style-type: none;
            margin: 0;
            padding: 0;
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
        }
        #messages li {
            padding: 8px;
            margin-bottom: 10px;
            background-color: #f1f1f1;
            border-radius: 4px;
        }
        #chatForm {
            margin-top: 20px;
        }
        #messageInput {
            width: 80%;
            padding: 10px;
        }
        #sendBtn {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<h2>Chat Room</h2>
<ul id="messages">
    <c:forEach var="message" items="${messages}">
        <li><strong>${message.username}</strong>: ${message.content}</li>
    </c:forEach>
</ul>
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
        fetch('chat', {
            method: 'POST',
            body: formData
        });
        document.getElementById("messageInput").value = '';
    };
</script>
</body>
</html>
