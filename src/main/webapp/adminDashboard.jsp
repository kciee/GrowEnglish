<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        .dashboard-box {
            width: 250px;
            height: 120px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin: 20px;
            padding: 15px;
            display: inline-block;
            vertical-align: top;
            background: #f5f5f5;
        }
        .dashboard-title {
            font-size: 18px;
            font-weight: bold;
        }
        .dashboard-value {
            font-size: 24px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h1>Thống kê tổng quan</h1>
<div class="dashboard-box">
    <div class="dashboard-title">Tổng người dùng</div>
    <div class="dashboard-value">${totalUsers}</div>
</div>
<div class="dashboard-box">
    <div class="dashboard-title">Tổng khoá học</div>
    <div class="dashboard-value">${totalCourses}</div>
</div>
<div class="dashboard-box">
    <div class="dashboard-title">Tài liệu</div>
    <div class="dashboard-value">${totalDocuments}</div>
</div>
<div class="dashboard-box">
    <div class="dashboard-title">Bài kiểm tra</div>
    <div class="dashboard-value">${totalQuizzes}</div>
</div>
<div class="dashboard-box">
    <div class="dashboard-title">Đơn hàng</div>
    <div class="dashboard-value">${totalOrders}</div>
</div>
<div class="dashboard-box">
    <div class="dashboard-title">Doanh thu</div>
    <div class="dashboard-value">${totalRevenue} VNĐ</div>
</div>
</body>
</html>
