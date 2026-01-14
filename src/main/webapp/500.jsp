<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Lỗi hệ thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
    <div class="text-center">
        <h1 class="display-1 fw-bold text-danger">500</h1>
        <p class="fs-3">Hệ thống đang gặp sự cố.</p>
        <p class="lead">Chúng tôi đang khắc phục, vui lòng quay lại sau.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Về trang chủ</a>
    </div>
</body>
</html>