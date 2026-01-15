<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> <!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Phòng Chat Cộng Đồng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { 
        	background-color: #f0f2f5; 
        	font-family: 'Segoe UI', sans-serif; 
        	overflow-y: hidden; 
       	}
        
        .main-content {
            margin-left: 90px;
            height: 100vh;
            display: flex; 
            flex-direction: column;
            transition: margin-left 0.4s;
            background-color: white;
        }

        .chat-header {
            padding: 15px 30px; 
            border-bottom: 1px solid #ddd; 
            background: white;
            display: flex; 
            align-items: center; 
            justify-content: space-between;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05); 
            z-index: 10;
        }
        .chat-title { 
        	font-size: 1.2rem; 
        	font-weight: bold; 
        	color: #333; 
        	display: flex; 
        	align-items: center; 
        	gap: 10px; 
        }

        .chat-box {
            flex: 1; 
            overflow-y: auto; 
            padding: 20px 30px;
            background-image: url('https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png');
            background-repeat: repeat; 
            background-color: #e5ddd5;
            display: flex; 
            flex-direction: column; 
            gap: 15px;
        }
        .chat-box::-webkit-scrollbar { 
        	width: 6px; 
        }
        .chat-box::-webkit-scrollbar-thumb { 
        	background-color: rgba(0,0,0,0.2); 
        	border-radius: 3px; 
        }

        .message-row { 
        	display: flex; 
        	align-items: flex-end; 
        	gap: 10px; 
        	max-width: 70%; 
        }
        
        .message-bubble {
            padding: 8px 15px;
            border-radius: 18px; 
            font-size: 15px; 
            line-height: 1.4;
            position: relative; 
            box-shadow: 0 1px 2px rgba(0,0,0,0.1); 
            word-wrap: break-word;
            min-width: 100px;
        }

        .username { 
        	font-size: 12px; 
        	margin-bottom: 2px; 
        	font-weight: bold; 
        	display: block; 
        }

        .time {
            font-size: 10px;
            display: block;
            text-align: right;
            margin-top: 4px;
            opacity: 0.6;
            font-style: italic;
        }

        .message-received { 
        	align-self: flex-start; 
        }
        .message-received .message-bubble { 
        	background-color: #ffffff; 
        	color: #333; 
        	border-bottom-left-radius: 4px; }
        .message-received .username { 
        	color: #e65100; 
        }

        .message-sent { 
        	align-self: flex-end; 
        	flex-direction: row-reverse; 
        }
        .message-sent .message-bubble { 
        	background-color: #fb9400; 
        	color: white; 
        	border-bottom-right-radius: 4px; 
        }
        .message-sent .username { 
        	display: none; 
        }
        .message-sent .time { 
        	color: #eee; 
        }

        .chat-avatar {
            width: 35px; 
            height: 35px; 
            border-radius: 50%; 
            object-fit: cover;
            border: 2px solid white; 
            box-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }

        .chat-input-area {
            padding: 15px 30px; 
            background: white; 
            border-top: 1px solid #ddd;
            display: flex; 
            align-items: center; 
            gap: 15px;
        }
        #messageInput {
            flex: 1; 
            padding: 12px 20px; 
            border-radius: 25px;
            border: 1px solid #ddd;
            background: #f0f2f5; 
            outline: none; 
            transition: 0.3s;
        }
        #messageInput:focus { 
        	border-color: #fb9400; 
        	background: white; 
        }
        #sendBtn {
            background-color: #fb9400; 
            color: white; 
            border: none; 
            width: 45px; 
            height: 45px;
            border-radius: 50%; 
            display: flex; 
            align-items: center; 
            justify-content: center;
            cursor: pointer; 
            transition: 0.2s; 
            font-size: 18px;
        }
        #sendBtn:hover { 
        	transform: scale(1.1); 
        	background-color: #e08600; 
        }
        #connectionStatus { 
        	font-size: 12px; 
        	color: red; 
        	display: none;
        	margin-left: 10px; 
        }
    </style>
</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="chat-header">
            <div class="chat-title">
                <i class="fas fa-comments text-warning"></i> 
                Cộng đồng G-Easy
                <span id="connectionStatus">⚠ Mất kết nối!</span>
            </div>
        </div>

        <div class="chat-box" id="messages">
            <c:forEach var="msg" items="${messages}">
                <c:set var="currentUser" value="${sessionScope.user != null ? sessionScope.user.username : 'Khách'}" />
                
                <c:choose>
                    <c:when test="${currentUser == msg.username}">
                        <div class="message-row message-sent">
                            <img src="https://ui-avatars.com/api/?name=${msg.username}&background=random" class="chat-avatar" alt="Ava">
                            <div class="message-bubble">
                                <span class="username">${msg.username}</span>
                                <c:out value="${msg.content}" />
                                <span class="time">
                                    <fmt:formatDate value="${msg.timestamp}" pattern="HH:mm" />
                                </span>
                            </div>
                        </div>
                    </c:when>
                    
                    <c:otherwise>
                        <div class="message-row message-received">
                            <img src="https://ui-avatars.com/api/?name=${msg.username}&background=random" class="chat-avatar" alt="Ava">
                            <div class="message-bubble">
                                <span class="username">${msg.username}</span>
                                <c:out value="${msg.content}" />
                                <span class="time">
                                    <fmt:formatDate value="${msg.timestamp}" pattern="HH:mm" />
                                </span>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <div class="chat-input-area">
            <input type="hidden" id="username" value="${sessionScope.user != null ? sessionScope.user.username : 'Khách'}">
            <input type="text" id="messageInput" placeholder="Nhập tin nhắn..." autocomplete="off">
            <button id="sendBtn" type="button" onclick="sendMessage()">
                <i class="fas fa-paper-plane"></i>
            </button>
        </div>
    </div>

    <script>
        const wsProtocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:';
        const wsUrl = wsProtocol + "//" + window.location.host + "/GrowEnglish/chatws";
        
        console.log("Connecting to: " + wsUrl);
        const socket = new WebSocket(wsUrl);
        const chatBox = document.getElementById("messages");
        
        chatBox.scrollTop = chatBox.scrollHeight;

        socket.onopen = function (event) {
            console.log("✅ WebSocket Connected!");
            document.getElementById("connectionStatus").style.display = "none";
        };

        socket.onclose = function(event) {
            console.log("❌ WebSocket Closed.");
            document.getElementById("connectionStatus").style.display = "inline";
        };

        socket.onmessage = function (event) {
            const rawMessage = event.data;
            let sender = "Unknown";
            let content = rawMessage;
            
            if (rawMessage.indexOf(": ") !== -1) {
                const parts = rawMessage.split(": ");
                sender = parts[0];
                content = parts.slice(1).join(": ");
            }

            const myName = document.getElementById("username").value;
            const isMe = (sender === myName);

            const now = new Date();
            const timeString = now.getHours() + ":" + String(now.getMinutes()).padStart(2, '0');

            let messageHtml = "";
            if (isMe) {
                messageHtml = '<div class="message-row message-sent">' +
                              '<img src="https://ui-avatars.com/api/?name=' + sender + '&background=random" class="chat-avatar">' +
                              '<div class="message-bubble">' +
                              '<span class="username">' + sender + '</span>' + content +
                              '<span class="time">' + timeString + '</span>' + 
                              '</div></div>';
            } else {
                messageHtml = '<div class="message-row message-received">' +
                              '<img src="https://ui-avatars.com/api/?name=' + sender + '&background=random" class="chat-avatar">' +
                              '<div class="message-bubble">' +
                              '<span class="username">' + sender + '</span>' + content +
                              '<span class="time">' + timeString + '</span>' +
                              '</div></div>';
            }

            chatBox.insertAdjacentHTML('beforeend', messageHtml);
            chatBox.scrollTop = chatBox.scrollHeight;
        };

        function sendMessage() {
            const input = document.getElementById("messageInput");
            const message = input.value.trim();
            const username = document.getElementById("username").value;

            if (message !== "" && socket.readyState === WebSocket.OPEN) {
                socket.send(username + ": " + message);
                input.value = "";
                input.focus();
            }
        }

        document.getElementById("messageInput").addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendMessage();
            }
        });
    </script>

</body>
</html>