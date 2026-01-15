<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>500 - Lỗi hệ thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #fff0f0; height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; }
        .error-code { font-size: 100px; font-weight: bold; color: #dc3545; }
        .btn-retry { border: 2px solid #dc3545; color: #dc3545; padding: 10px 30px; border-radius: 50px; text-decoration: none; font-weight: bold; transition: 0.3s;}
        .btn-retry:hover { background: #dc3545; color: white; }
    </style>
</head>
<body>
    <div>
        <div class="error-code">500</div>
        <h2 class="mb-3">Hệ thống đang gặp sự cố!</h2>
        <p class="text-muted mb-5">Server đang bị quá tải hoặc gặp lỗi xử lý. Vui lòng thử lại sau.</p>
        <a href="javascript:history.back()" class="btn-retry">
            Quay lại trang trước
        </a>
    </div>
</body>
</html>