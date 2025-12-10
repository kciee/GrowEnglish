<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="currentURI" value="${pageContext.request.requestURI}" />

<style>
	
    .sidebar {
        position: fixed;
        background-color: #FFF4E5;
        width: 350px;
        height: 100vh;
        padding-top: 60px;
        padding-left: 15px;
        padding-right: 15px;
        padding-bottom: 20px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        left: 0;
        top: 0;
        bottom: 0;
        z-index: 1000;
    }
    .logo {
        font-weight: bold;
        font-size: 1.8rem;
        margin-bottom: 1.5rem;
        color: black;
        text-decoration: none;
        display: block;
    }
    .menu-item {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 15px 0;
        text-decoration: none;
        color: black;
        padding: 10px 15px;
        border-radius: 10px;
        transition: all 0.3s;
    }
    .menu-item:hover {
        background-color: #ffe0b2;
        color: #e65100;
    }
    
    .menu-item.active {
        background-color: #fb9400 !important;
        color: white !important;
        font-weight: bold;
        box-shadow: 0 4px 6px rgba(251, 148, 0, 0.3);
    }
    
    .menu-item.active .icon {
        filter: brightness(0) invert(1);
    }

    .icon {
        flex-shrink: 0;
        width: 24px;
        height: 24px;
    }
    
    .app-bar {
        position: fixed;
        top: 0;
        right: 0;
        width: calc(100% - 350px);
        padding: 15px 40px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 20px;
        z-index: 999;
        background: transparent;
    }
    .avatar {
        height: 40px;
        width: 40px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #fb9400;
    }
    .btn-login-nav {
        background: #fb9400;
        color: white;
        padding: 8px 20px;
        border-radius: 20px;
        text-decoration: none;
        font-weight: bold;
    }
</style>

<div class="sidebar">
    <a href="${pageContext.request.contextPath}/home" class="logo">
        <img src="assets/images/GE.png" alt="Logo" style="width: 60px; height: auto; margin-right: 10px;">
        G - English
    </a>
    
    <nav>
        <a href="${pageContext.request.contextPath}/home" 
           class="menu-item ${fn:contains(currentURI, '/home') || fn:contains(currentURI, 'index.jsp') ? 'active' : ''}">
            <img src="assets/images/Icon/home.svg" class="icon" alt="Home"> Trang chủ
        </a>

        <a href="${pageContext.request.contextPath}/FreeDocument" 
           class="menu-item ${fn:contains(currentURI, 'FreeDocument') || fn:contains(currentURI, 'free') ? 'active' : ''}">
            <img src="assets/images/Icon/tai lieu mien phi.svg" class="icon" alt="Free Doc"> Tài liệu miễn phí
        </a>

        <a href="${pageContext.request.contextPath}/PaidDocument" 
           class="menu-item ${fn:contains(currentURI, 'PaidDocument') || fn:contains(currentURI, 'paid') ? 'active' : ''}">
            <img src="assets/images/Icon/tai lieu tra phi.svg" class="icon" alt="Paid Doc"> Tài liệu trả phí
        </a>

        <a href="${pageContext.request.contextPath}/courses" 
           class="menu-item ${fn:contains(currentURI, 'course') ? 'active' : ''}">
            <img src="assets/images/Icon/khoa hoc online.svg" class="icon" alt="Course"> Khóa học
        </a>

        <a href="${pageContext.request.contextPath}/quizList" 
           class="menu-item ${fn:contains(currentURI, 'quiz') ? 'active' : ''}">
            <img src="assets/images/Icon/News.svg" class="icon" alt="Quiz"> Bài kiểm tra
        </a>
        
        <a href="${pageContext.request.contextPath}/learningDocuments" 
           class="menu-item ${fn:contains(currentURI, 'learning') ? 'active' : ''}">
            <img src="assets/images/Icon/Book.svg" class="icon" alt="My Doc"> Tài liệu của tôi
        </a>

        <a href="${pageContext.request.contextPath}/profile.jsp" 
           class="menu-item ${fn:contains(currentURI, 'profile') ? 'active' : ''}">
            <img src="assets/images/Icon/quan ly tai khoan.svg" class="icon" alt="Profile"> Quản lý tài khoản
        </a>

        

        <a href="${pageContext.request.contextPath}/Logout" class="menu-item">
            <img src="assets/images/Icon/Logout.svg" class="icon" alt="Logout"> Đăng xuất
        </a>
    </nav>
</div>

<div class="app-bar">
    <a href="${pageContext.request.contextPath}/Cart"> <img class="icon-shop" src="assets/images/Icon/Shop.svg" alt="Cart"> </a>
    <a href="${pageContext.request.contextPath}/chat.jsp"> <img class="icon-chat" src="assets/images/Icon/Chat.svg" alt="Chat"> </a>
    <img class="icon-noti" src="assets/images/Icon/Noti.svg" alt="Noti">
    
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <div style="text-align: right; line-height: 1.2;">
                <h5 style="margin:0; font-weight:bold; font-size:16px;">${sessionScope.user.fullName}</h5>
                <small style="color: gray;">Học viên</small>
            </div>
            <a href="${pageContext.request.contextPath}/profile.jsp">
                <img class="avatar" src="${not empty sessionScope.user.avatarUrl ? sessionScope.user.avatarUrl : 'assets/images/avatar.jpg'}">
            </a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/login.jsp" class="btn-login-nav">Đăng nhập</a>
        </c:otherwise>
    </c:choose>
</div>