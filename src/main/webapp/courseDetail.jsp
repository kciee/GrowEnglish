<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết khóa học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { background-color: #f9f9f9; font-family: 'Segoe UI', sans-serif; }
        .main-content {
            margin-left: 350px;
            width: calc(100% - 350px);
            padding: 40px 60px;
            min-height: 100vh;
            padding-bottom: 20px;
        }

        .course-header {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }
        
        .nav-pills .nav-link {
            color: #555;
            font-weight: 600;
            border-radius: 50px;
            padding: 10px 25px;
            margin-right: 10px;
        }
        .nav-pills .nav-link.active {
            background-color: #fb9400 !important;
            color: white !important;
        }

        .content-box {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
            min-height: 300px;
        }

        .course-sidebar {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 20px;
        }
        
        .btn-enroll {
            background-color: #fb9400;
            color: white;
            font-weight: bold;
            border-radius: 50px;
            width: 100%;
            padding: 12px;
            border: none;
            transition: 0.3s;
        }
        .btn-enroll:hover { background-color: #e08600; color: white; }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <a href="${pageContext.request.contextPath}/courses" class="text-decoration-none text-muted mb-3 d-inline-block">
    <i class="fas fa-arrow-left"></i> Quay lại danh sách
</a>

        <div class="row">
            <div class="col-lg-8">
                <div class="course-header d-flex align-items-center">
                    <img src="assets/images/Card.svg" alt="Course" style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;" 
                         onerror="this.src='https://via.placeholder.com/100'">
                    <div class="ms-4">
                        <h2 class="fw-bold mb-2">IELTS Intermediate</h2>
                        <p class="text-muted mb-0">Khóa học chuyên sâu giúp bạn chinh phục band điểm 6.5+</p>
                        <div class="d-flex gap-3 mt-2 text-sm text-muted">
                            <span><i class="far fa-clock"></i> 3 tháng</span>
                            <span><i class="far fa-user"></i> 150 học viên</span>
                        </div>
                    </div>
                </div>

                <ul class="nav nav-pills mb-4" id="courseTab" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active" onclick="switchTab('overview', this)">Tổng quan</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" onclick="switchTab('curriculum', this)">Lộ trình</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" onclick="switchTab('schedule', this)">Lịch học</button>
                    </li>
                </ul>

                <div class="content-box" id="tabContent">
                    <h4 class="fw-bold mb-3">Tổng quan khóa học</h4>
                    <p>Khóa học được thiết kế dành cho các bạn đã có nền tảng tiếng Anh cơ bản, muốn nâng cao kỹ năng để thi IELTS.</p>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Cam kết đầu ra 6.5+</li>
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Giảng viên 8.0 IELTS</li>
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Chấm chữa bài chi tiết</li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="course-sidebar text-center">
                    <h3 class="fw-bold text-warning mb-3">$199.00</h3>
                    <button class="btn btn-enroll mb-3">Đăng ký ngay</button>
                    <hr>
                    <div class="text-start">
                        <p class="mb-2"><strong>Mã khóa học:</strong> IELTS-02</p>
                        <p class="mb-2"><strong>Trình độ:</strong> Trung cấp</p>
                        <p class="mb-0"><strong>Ngôn ngữ:</strong> Tiếng Anh</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        function switchTab(tabName, btnElement) {
            document.querySelectorAll('.nav-link').forEach(btn => btn.classList.remove('active'));
            btnElement.classList.add('active');
            const contentDiv = document.getElementById('tabContent');
            let html = '';
            if (tabName === 'overview') {
                html = `
                    <h4 class="fw-bold mb-3">Tổng quan khóa học</h4>
                    <p>Khóa học được thiết kế dành cho các bạn đã có nền tảng tiếng Anh cơ bản, muốn nâng cao kỹ năng để thi IELTS.</p>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Cam kết đầu ra 6.5+</li>
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Giảng viên 8.0 IELTS</li>
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Chấm chữa bài chi tiết 1-1</li>
                    </ul>`;
            } else if (tabName === 'curriculum') {
                html = `
                    <h4 class="fw-bold mb-3">Lộ trình học tập</h4>
                    <div class="alert alert-info">Lộ trình chi tiết gồm 24 buổi học.</div>
                    <ul class="list-group">
                        <li class="list-group-item">Buổi 1-6: Listening & Reading Foundation</li>
                        <li class="list-group-item">Buổi 7-12: Writing Task 1 & Speaking Part 1</li>
                        <li class="list-group-item">Buổi 13-20: Nâng cao kỹ năng chuyên sâu</li>
                        <li class="list-group-item">Buổi 21-24: Luyện đề và Thi thử</li>
                    </ul>`;
            } else if (tabName === 'schedule') {
                html = `
                    <h4 class="fw-bold mb-3">Lịch khai giảng</h4>
                    <table class="table table-bordered">
                        <thead class="table-light"><tr><th>Lớp</th><th>Thời gian</th><th>Ngày bắt đầu</th></tr></thead>
                        <tbody>
                            <tr><td>IELTS-K12</td><td>19:00 - 21:00 (2-4-6)</td><td>15/10/2023</td></tr>
                            <tr><td>IELTS-K13</td><td>18:00 - 20:00 (3-5-7)</td><td>20/10/2023</td></tr>
                        </tbody>
                    </table>`;
            }
            contentDiv.innerHTML = html;
        }
    </script>
</body>
</html>