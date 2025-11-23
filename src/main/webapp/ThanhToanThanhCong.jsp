<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán Thành Công</title>
    <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/index.jsp"/>
    <style>
        body {
            font-family: Poppins, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f4f4f9;
        }
        .message-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 100px 40px;
        }
        h1 {
            color: #28a745;
            margin: 0 0 20px;
        }
        p {
            color: #555;
            font-size: 16px;
        }
        .main-content {
            margin-left: 350px;
            padding-top: 50px;
        }
    </style>
</head>
<%@include file="./menu.jsp" %>
<body>
<div class="main-content">
    <div class="message-container">
        <h1>Thanh Toán Thành Công!</h1>
        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>
        <p>Bạn sẽ được chuyển hướng về trang chủ trong 3 giây...</p>
    </div>
</div>
</body>
<%@include file="./footer.jsp" %>
</html>
