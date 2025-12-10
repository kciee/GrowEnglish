<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán thành công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { 
        	background-color: #f9f9f9; 
        	font-family: 'Segoe UI', sans-serif; 
        }
        
        .main-content {
            margin-left: 90px;
            width: calc(100% - 90px);
            padding: 40px 60px;
            min-height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .success-card {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            max-width: 600px;
            width: 100%;
        }

        .icon-box {
            width: 80px; height: 80px;
            background: #d4edda;
            color: #28a745;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 40px;
            margin: 0 auto 20px;
        }

        .btn-home {
            background-color: #fb9400;
            color: white;
            padding: 12px 40px;
            border-radius: 50px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-home:hover { background-color: #e08600; color: white; }
    </style>
</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="success-card">
            <div class="icon-box">
                <i class="fas fa-check"></i>
            </div>
            <h2 class="fw-bold mb-3 text-dark">Thanh toán thành công!</h2>
            <p class="text-muted mb-4">
                Cảm ơn bạn đã đăng ký khóa học/tài liệu.<br>
                Bạn có thể bắt đầu học ngay bây giờ.
            </p>
            
            <div class="d-flex gap-3 justify-content-center">
                <a href="${pageContext.request.contextPath}/learningDocuments" class="btn btn-outline-secondary rounded-pill px-4">
                    Vào học ngay
                </a>
                <a href="${pageContext.request.contextPath}/home" class="btn-home">
                    Về trang chủ
                </a>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>