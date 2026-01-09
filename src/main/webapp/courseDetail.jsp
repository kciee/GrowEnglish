<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>${course.name}</title>
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
            min-height: 100vh;
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
        .btn-enroll:hover { 
        	background-color: #e08600; 
        	color: white; 
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <a href="${pageContext.request.contextPath}/courses" class="text-decoration-none text-muted mb-3 d-inline-block">
            <i class="fas fa-arrow-left"></i> Quay lại danh sách
        </a>

        <c:if test="${not empty course}">
            <div class="row">
                <div class="col-lg-8">
                    <div class="course-header d-flex align-items-center">
                        <img src="assets/images/Card.svg" alt="Course" style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;" 
                             onerror="this.src='https://via.placeholder.com/100'">
                        <div class="ms-4">
                            <h2 class="fw-bold mb-2">${course.name}</h2>
                            <p class="text-muted mb-0">${course.shortDescription}</p>
                        </div>
                    </div>

                    <ul class="nav nav-pills mb-4" id="courseTab" role="tablist">
                        <li class="nav-item"><button class="nav-link active" onclick="switchTab('overview', this)">Tổng quan</button></li>
                        <li class="nav-item"><button class="nav-link" onclick="switchTab('curriculum', this)">Lộ trình</button></li>
                        <li class="nav-item"><button class="nav-link" onclick="switchTab('schedule', this)">Lịch học</button></li>
                    </ul>

                    <div class="content-box" id="tabContent">
                        <h4 class="fw-bold mb-3">Tổng quan khóa học</h4>
                        <p>${course.shortDescription}</p>
                        <hr>
                        <p>Chào mừng bạn đến với khóa học <strong>${course.name}</strong>.</p>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="course-sidebar text-center">
                        <h3 class="fw-bold text-warning mb-3">$${course.price}</h3>
                        
                        <a href="${pageContext.request.contextPath}/add-course?id=${course.id}" class="btn btn-primary w-100">
                            <i class="fas fa-cart-plus"></i> Đăng ký ngay
                        </a>
                        <hr>
                        <div class="text-start">
                            <p class="mb-2"><strong>Mã khóa học:</strong> #${course.id}</p>
                            <p class="mb-2"><strong>Ngôn ngữ:</strong> Tiếng Anh</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        // Lấy tên khóa học từ Java bỏ vào biến Javascript để làm nội dung động cho các Tab
        const courseName = "${course.name}"; 

        function switchTab(tabName, btnElement) {
            document.querySelectorAll('.nav-link').forEach(btn => btn.classList.remove('active'));
            btnElement.classList.add('active');
            const contentDiv = document.getElementById('tabContent');
            let html = '';

            if (tabName === 'overview') {
                html = `
                    <h4 class="fw-bold mb-3">Tổng quan khóa học</h4>
                    <p>Khóa học <strong>` + courseName + `</strong> được thiết kế chuyên biệt để giúp bạn nâng cao kỹ năng.</p>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Cam kết chất lượng</li>
                        <li class="mb-2"><i class="fas fa-check text-success me-2"></i> Giáo trình chuẩn quốc tế</li>
                    </ul>`;
            } else if (tabName === 'curriculum') {
                html = `
                    <h4 class="fw-bold mb-3">Lộ trình học tập: ` + courseName + `</h4>
                    <div class="alert alert-info">Lộ trình được cá nhân hóa cho học viên.</div>
                    <ul class="list-group">
                        <li class="list-group-item">Giai đoạn 1: Nền tảng căn bản</li>
                        <li class="list-group-item">Giai đoạn 2: Tăng tốc kỹ năng</li>
                        <li class="list-group-item">Giai đoạn 3: Về đích và Luyện đề</li>
                    </ul>`;
            } else if (tabName === 'schedule') {
                html = `
                    <h4 class="fw-bold mb-3">Lịch học</h4>
                    <p>Lịch học linh hoạt 2-4-6 hoặc 3-5-7.</p>
                `;
            }
            contentDiv.innerHTML = html;
        }
    </script>
</body>
</html>