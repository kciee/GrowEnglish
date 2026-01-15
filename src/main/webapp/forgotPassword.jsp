<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-forgot {
            max-width: 450px;
            width: 100%;
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .btn-custom {
            background-color: #ffc107;
            color: #fff;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #e0a800;
            color: #fff;
        }
    </style>
</head>
<body>

    <div class="card card-forgot p-4">
        <div class="text-center mb-4">
            <img src="assets/images/GE.png" alt="Logo" height="50" class="mb-3">
            <h4 class="fw-bold">Quên mật khẩu?</h4>
            <p class="text-muted">Nhập email của bạn để nhận mật khẩu mới.</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i> ${error}
            </div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="alert alert-success" role="alert">
                <i class="fas fa-check-circle me-2"></i> ${message}
            </div>
        </c:if>

        <form action="forgot-password" method="post">
            <div class="mb-3">
                <label for="email" class="form-label fw-bold">Email đăng ký</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="fas fa-envelope text-muted"></i></span>
                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                </div>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-custom py-2">Gửi mật khẩu mới</button>
            </div>
        </form>

        <div class="text-center mt-4">
            <a href="login.jsp" class="text-decoration-none text-secondary">
                <i class="fas fa-arrow-left me-1"></i> Quay lại đăng nhập
            </a>
        </div>
    </div>

</body>
</html>