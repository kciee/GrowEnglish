<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Admin Dashboard - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { 
            min-height: 100vh; 
            display: flex; 
            background-color: #f8f9fa; 
        }
        
        .sidebar {
            width: 250px;
            background: #212529;
            color: white;
            flex-shrink: 0;
            padding-top: 20px;
        }
        
        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
            padding: 12px 20px;
            display: block;
            transition: 0.3s;
        }
        
        .sidebar a:hover, .sidebar a.active {
            background: #343a40;
            color: #fff;
            border-left: 4px solid #ffc107;
        }
        .sidebar i { 
            width: 25px; 
            text-align: center; 
            margin-right: 10px; 
        }
        
        .sidebar .brand {
            text-align: center; 
            font-size: 22px; 
            font-weight: bold; 
            color: white; 
            margin-bottom: 30px;
        }
        
        .content { 
            flex-grow: 1; 
            padding: 30px; 
            overflow-y: auto; 
        }
        
        .stat-card {
            background: white; 
            border-radius: 10px; 
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05); 
            border-left: 5px solid;
        }
        
        .text-value { 
            font-size: 28px; 
            font-weight: bold; 
            margin-top: 5px; 
        }

        .chart-box {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-top: 25px;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="brand"><i class="fas fa-leaf text-warning"></i> GrowEnglish</div>
    
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">
        <i class="fas fa-home"></i> Tổng quan
    </a>
    
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Quản lý nội dung</div>
    <a href="${pageContext.request.contextPath}/admin/courses"><i class="fas fa-graduation-cap"></i> Khóa học</a>
    <a href="${pageContext.request.contextPath}/admin/documents"><i class="fas fa-book"></i> Tài liệu (Free)</a>
    <a href="${pageContext.request.contextPath}/admin/paid-documents"><i class="fas fa-file-invoice-dollar me-2"></i> Tài liệu (Paid)</a>
    <a href="${pageContext.request.contextPath}/admin/quizzes"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <h2 class="mb-4">Chào mừng trở lại, Admin! 👋</h2>
    
    <div class="row g-4">
        <div class="col-md-3">
            <div class="stat-card" style="border-color: #0d6efd;">
                <div class="text-muted small text-uppercase fw-bold">Thành viên</div>
                <div class="text-value text-primary">${totalUsers}</div>
                <i class="fas fa-users float-end text-black-50 fa-2x" style="margin-top: -35px;"></i>
            </div>
        </div>
        
        <div class="col-md-3">
            <div class="stat-card" style="border-color: #198754;">
                <div class="text-muted small text-uppercase fw-bold">Doanh thu</div>
                <div class="text-value text-success">$${totalRevenue}</div>
                <i class="fas fa-dollar-sign float-end text-black-50 fa-2x" style="margin-top: -35px;"></i>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card" style="border-color: #ffc107;">
                <div class="text-muted small text-uppercase fw-bold">Khóa học</div>
                <div class="text-value text-warning">${totalCourses}</div>
                <i class="fas fa-graduation-cap float-end text-black-50 fa-2x" style="margin-top: -35px;"></i>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card" style="border-color: #dc3545;">
                <div class="text-muted small text-uppercase fw-bold">Bài kiểm tra</div>
                <div class="text-value text-danger">${totalQuizzes}</div>
                <i class="fas fa-clipboard-check float-end text-black-50 fa-2x" style="margin-top: -35px;"></i>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="chart-box">
                <h5 class="fw-bold mb-4"><i class="fas fa-chart-line text-primary me-2"></i>Doanh thu 7 ngày qua</h5>
                <div style="height: 350px;"><canvas id="revenueChart"></canvas></div>
            </div>
        </div>
        
        <div class="col-lg-4">
            <div class="chart-box text-center">
                <h5 class="fw-bold mb-4"><i class="fas fa-chart-pie text-warning me-2"></i>Cơ cấu sản phẩm</h5>
                <div style="height: 280px;"><canvas id="mixChart"></canvas></div>
                <div class="mt-4 small text-muted">Tỷ lệ Khóa học / Tài liệu</div>
            </div>
        </div>
    </div>
</div>

<script>
    const revCtx = document.getElementById('revenueChart').getContext('2d');
    new Chart(revCtx, {
        type: 'line',
        data: {
            labels: [<c:forEach var="l" items="${chartLabels}" varStatus="s">'${l}'${!s.last ? ',' : ''}</c:forEach>],
            datasets: [{
                label: 'Doanh thu ($)',
                data: [<c:forEach var="v" items="${chartValues}" varStatus="s">${v}${!s.last ? ',' : ''}</c:forEach>],
                borderColor: '#0d6efd',
                backgroundColor: 'rgba(13, 110, 253, 0.1)',
                borderWidth: 3,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: { 
                y: { beginAtZero: true, grid: { borderDash: [5, 5] } },
                x: { grid: { display: false } }
            }
        }
    });
    new Chart(document.getElementById('mixChart'), {
        type: 'doughnut',
        data: {
            labels: ['Khóa học', 'Tài liệu VIP'],
            datasets: [{
                data: [${totalCourses}, ${totalDocuments}],
                backgroundColor: ['#ffc107', '#212529'],
                borderWidth: 2,
                borderColor: '#fff'
            }]
        },
        options: {
            cutout: '70%',
            plugins: { legend: { position: 'bottom' } }
        }
    });
</script>

</body>
</html>