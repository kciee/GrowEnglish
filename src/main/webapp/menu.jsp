<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<head>
    <style>
        body, html {
        	margin: 0;
        	padding: 0;
        	height: 100%;
        	font-family: Arial, sans-serif;
        }
        .sidebar {
        	position: fixed;
        	background-color: #FFF4E5;
        	width: 350px;
        	height: 100vh;
        	padding: 4.5rem;
        	display: flex;
        	flex-direction: column;
        	justify-content: flex-start;
        	left: 0;
        	top: 0;
        	bottom: 0;
        }
        .logo {
        	font-weight: bold;
        	font-size: 1.8rem;
        	margin-bottom: 1.5rem;
        }
        .menu-item {
        	display: flex;
        	align-items: center;
        	gap: 10px;
        	margin: 25px 0;
        	text-decoration: none;
        	color: black;
        }
        .menu-item:hover {
        	color: #ff9800;
        }
        .active {
        	background-color: #ff9800;
        	color: white;
        	border-radius: 8px;
        	padding: 10px;
        }
        img.icon {
        	flex-shrink: 0;
        	width: 24px;
        	height: 24px;
        }
        .app-bar {
        	position: fixed;
        	top: 0;
        	right: 0;
        	width: calc(100% - 300px);
        	padding: 10px 20px;
        	display: flex;
        	justify-content: flex-end;
        	align-items: center;
        	gap: 16px;
        	z-index: 1000;
        }
        .icon-shop, .icon-chat, .icon-noti {
        	width: 24px;
        	height: 24px;
        }
        .button {
        	background: #fb9400;
        	border-radius: 50px;
        	padding: 10px 24px;
        	display: flex;
        	align-items: center;
        	justify-content: center;
        	color: white;
        	font-weight: bold;
        	text-decoration: none;
        }
        .avatar {
        	height: 35px;
        	width: 35px;
        }
    </style>
</head>
<div class="sidebar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="assets/images/GE.png" alt="Logo" style="width: 50px; height: auto;">
        </a>
        G - English
    </div>
    <nav>
        <a href="${pageContext.request.contextPath}/home" class="menu-item ${fn:endsWith(pageContext.request.requestURI, 'home') or fn:endsWith(pageContext.request.requestURI, 'index.jsp') ? 'active' : ''}">
            <img src="assets/images/Icon/home.svg" class="icon" alt="Trang chủ"> Trang chủ
        </a>
        <a href="${pageContext.request.contextPath}/FreeDocument" class="menu-item ${fn:contains(pageContext.request.requestURI, 'FreeDocument') ? 'active' : ''}">
            <img src="assets/images/Icon/tai lieu mien phi.svg" class="icon" alt="Tài liệu miễn phí"> Tài liệu miễn phí
        </a>
        <a href="${pageContext.request.contextPath}/PaidDocument" class="menu-item ${fn:contains(pageContext.request.requestURI, 'PaidDocument') ? 'active' : ''}">
            <img src="assets/images/Icon/tai lieu tra phi.svg" class="icon" alt="Tài liệu trả phí"> Tài liệu trả phí
        </a>
        <a href="${pageContext.request.contextPath}/courses" class="menu-item ${fn:contains(pageContext.request.requestURI, 'courses') ? 'active' : ''}">
            <img src="assets/images/Icon/khoa hoc online.svg" class="icon" alt="Khóa học"> Khóa học
        </a>
        <a href="${pageContext.request.contextPath}/quizList" class="menu-item ${fn:contains(pageContext.request.requestURI, 'quizList') ? 'active' : ''}">
            <img src="assets/images/Icon/News.svg" class="icon" alt="Bài kiểm tra"> Bài kiểm tra
        </a>
        <a href="${pageContext.request.contextPath}/profile.jsp" class="menu-item ${fn:endsWith(pageContext.request.requestURI, 'profile') ? 'active' : ''}">
            <img src="assets/images/Icon/quan ly tai khoan.svg" class="icon" alt="Quản lý tài khoản"> Quản lý tài khoản
        </a>
        <a href="${pageContext.request.contextPath}/chat.jsp" class="menu-item ${fn:endsWith(pageContext.request.requestURI, 'chat.jsp') ? 'active' : ''}">
            <img src="assets/images/Icon/Chat.svg" class="icon" alt="Nhắn tin"> Nhắn tin
        </a>
        <a href="${pageContext.request.contextPath}/learningDocuments" class="menu-item ${fn:endsWith(pageContext.request.requestURI, 'learningDocuments') ? 'active' : ''}">
    		<img src="assets/images/Icon/Book.svg" class="icon" alt="Tài liệu của tôi"> Tài liệu của tôi
		</a>
		<a href="${pageContext.request.contextPath}/Logout" class="menu-item">
            <img src="assets/images/Icon/Logout.svg" class="icon" alt="Đăng xuất"> Đăng xuất
        </a>
    </nav>
</div>
<div class="app-bar">
    <a href="${pageContext.request.contextPath}/Cart"> <img class="icon-shop" src="assets/images/Icon/Shop.svg" alt="Shop Icon"> </a>
    <a href="${pageContext.request.contextPath}/chat.jsp">
        <img class="icon-chat" src="assets/images/Icon/Chat.svg" alt="Chat Icon">
    </a>
    <img class="icon-noti" src="assets/images/Icon/Noti.svg" alt="Notification Icon">
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <h5><c:out value="${sessionScope.user.username}" /></h5>
            <a href="${pageContext.request.contextPath}/profile.jsp">
                <img class="avatar"
                     src="${not empty sessionScope.user.avatarUrl ? sessionScope.user.avatarUrl : 'assets/images/avatar.jpg'}"
                     alt="Avatar">
            </a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/login.jsp" class="button">Đăng nhập</a>
        </c:otherwise>
    </c:choose>
</div>