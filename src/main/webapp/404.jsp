<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>404 - Không tìm thấy trang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; }
        .error-code { font-size: 100px; font-weight: bold; color: #fb9400; }
        .btn-home { background: #fb9400; color: white; padding: 10px 30px; border-radius: 50px; text-decoration: none; font-weight: bold; }
        .btn-home:hover { background: #e08300; color: white; }
    </style>
</head>
<body>
    <div>
        <div class="error-code">404</div>
        <h2 class="mb-3">Oops! Trang bạn tìm không tồn tại.</h2>
        <p class="text-muted mb-5">Có vẻ như đường dẫn bị sai hoặc trang đã bị xóa.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn-home">
            <i class="fa-solid fa-house"></i> Quay về trang chủ
        </a>
    </div>
</body>
</html>