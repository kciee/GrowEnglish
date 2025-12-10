<<<<<<< HEAD
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
            margin-left: 350px;
            width: calc(100% - 350px);
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IELTS Intermediate</title>
    <link rel="stylesheet" href="styles.css">
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <style>
        /* Tùy chỉnh giao diện */
        body, html {
            margin: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        .container-fluid {
            display: flex;
            flex-direction: row; /* Sidebar và nội dung chính nằm ngang */
            min-height: 100vh;
        }

        .active {
            background-color: #ff9800;
            color: white;
            border-radius: 8px;
            padding: 10px;
        }

        .main-content {
            margin-left: 400px;
            padding-top: 50px;
        }

        .button {
            background: #fb9400;
            border-radius: 50px;
            padding: 10px 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }

        .btn-toggle {
            border: 1px solid #fb9400;
            background-color: white;
            color: #fb9400;
            font-weight: bold;
        }

        .btn-toggle.btn-orange {
            background-color: #fb9400;
            color: white;
        }

        .btn-icon img, .btn-search img {
            width: 24px;
            height: 24px;
        }

        .btn-search span {
            font-weight: bold;
        }

        .active {
            background-color: #fb9400;
            color: white;
            border-color: #fb9400;
        }

        .container-fluid.p-0 {
            margin-left: 120px; /* Dịch chuyển container sang phải */
        }

        .container {
            margin-left: 120px;
        }

        .cta-button {
            display: block;
            width: 200px;
            text-align: center;;
            background-color: #ff9800;
            color: white;
            padding: 10px;
            margin: 20px auto;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-left: auto;
            margin-right: 0;
        }

        .cta-button.active, .cta-button:hover {
            background-color: #ff1234; /* Màu cam khi chọn */
            color: #fff;
        }

        /* Navigation Buttons */
        .nav-buttons {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .tab {
            background-color: #e0e0e0;
            border: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        .tab.active, .tab:hover {
            background-color: #ff9800; /* Màu cam khi chọn */
            color: #fff;
        }

        .header-image img {
            width: 100%;
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        .buttons-container button:hover {
            background-color: #f1b800;
>>>>>>> e18aefb (update)
        }
    </style>
</head>
<body>
<<<<<<< HEAD
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
                        
                        <a href="${pageContext.request.contextPath}/add-course?id=${course.id}" class="btn btn-enroll mb-3">
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
=======
<jsp:include page="menu.jsp"></jsp:include>
<div class="container-fluid">
    <!-- Sidebar -->
    <!-- Nội dung chính -->
    <div class="main-content">
        <!-- Main Section -->
        <section class="header-section">
            <div class="header-content">
                <div class="header-image">
                    <img src="assets/images/banner1.png" alt="Student Image">
                </div>
            </div>
        </section>

        <!-- Navigation Buttons -->
        <div class="nav-buttons">
            <button class="tab active" onclick="selectTab(this)">Thông
                tin khóa học
            </button>
            <button class="tab" onclick="selectTab(this)">Lịch học</button>
            <button class="tab" onclick="selectTab(this)">Lộ trình học
                tập
            </button>
            <button class="tab" onclick="selectTab(this)">Cam kết sau
                khóa học
            </button>
        </div>

        <!-- Content Section -->
        <section class="content-section">
            <h2>Xây dựng và phát triển vốn từ vựng cần thiết tương đương
                trình độ B2</h2>
            <ul>
                <li>Nắm vững và làm chủ nền tảng kiến thức</li>
                <li>Nắm vững các cấu trúc từ vựng quan trọng để làm tốt các kỹ
                    năng Reading và Listening
                </li>
                <li>Tăng cường khả năng tự học và đánh giá khả năng tiếng Anh</li>
                <li>Làm quen với các dạng bài thi mới nhất IELTS Computer Test</li>
            </ul>

            <!-- Repeated Student Image Cards -->
            <div class="student-cards">
                <img src="assets/images/${document }" alt="Student Image"
                     style="width: 18%; height: auto;"> <img
                    src="assets/images/banner1.png" alt="Student Image"
                    style="width: 18%; height: auto;"> <img
                    src="assets/images/banner1.png" alt="Student Image"
                    style="width: 18%; height: auto;"> <img
                    src="assets/images/banner1.png" alt="Student Image"
                    style="width: 18%; height: auto;"> <img
                    src="assets/images/banner1.png" alt="Student Image"
                    style="width: 18%; height: auto;">
            </div>

            <p>
                ${documentDetail.NoiDung}"

            </p>

            <p class="price">Học phí: 6.250.000 VND / 3 tháng. Phí này đã
                gồm tài liệu. Các bài sửa Writing do giảng viên Writing 8.5 chấm
                dựa chính xác vào tiêu chí chấm thi. Ngoài ra, chúng tôi cũng hỗ
                trợ tư vấn không giới hạn mọi thứ về IELTS.</p>
            <button class="cta-button">Đăng ký ngay</button>
        </section>

    </div>
</div>

<!-- mau khi chọn -->
<script>
    // Function to change active button and update content
    function selectTab(selectedButton) {
        // Remove active class from all buttons
        document.querySelectorAll('.tab').forEach(button => {
            button.classList.remove('active');
        });

        // Add active class to the selected button
        selectedButton.classList.add('active');

        // Update content based on the button text
        const contentSection = document.querySelector('.content-section');
        const buttonText = selectedButton.textContent.trim();

        // Set content based on the button clicked
        let content = '';
        switch (buttonText) {
            case 'Thông tin khóa học':
                content = `
                    <h2>Xây dựng và phát triển vốn từ vựng cần thiết tương đương trình độ B2</h2>
                    <ul>
                        <li>Nắm vững và làm chủ nền tảng kiến thức</li>
                        <li>Nắm vững các cấu trúc từ vựng quan trọng để làm tốt các kỹ năng Reading và Listening</li>
                        <li>Tăng cường khả năng tự học và đánh giá khả năng tiếng Anh</li>
                        <li>Làm quen với các dạng bài thi mới nhất IELTS Computer Test</li>
                    </ul>
                    <button class="cta-button">Đăng ký ngay</button>
                `;
                break;
            case 'Lịch học':
                content = `
                    <h2>Lịch học</h2>
        <div class="row text-center">
            <div class="col-md-6">
                <img src="assets/images/CardTeacher.png" alt="Schedule Image 1" class="img-fluid">
            </div>
            <div class="col-md-6">
                <img src="assets/images/CardLichHoc.png" alt="Schedule Image 2" class="img-fluid">
            </div>
        </div>
                `;
                break;
            case 'Lộ trình học tập':
                content = `
                    <h2>Lộ trình học tập</h2>
                    <p>Nội dung hiện đang được cập nhật. Vui lòng quay lại sau.</p>
                `;
                break;
            case 'Cam kết sau khóa học':
                content = `
                    <h2>Cam kết sau khóa học</h2>
                    <img src="assets/images/Camketsauhoc.png" alt="Schedule Image 1" class="img-fluid">                `;
                break;
            default:
                content = `<p>Không có nội dung nào được tìm thấy.</p>`;
        }

        // Replace the content in the section
        contentSection.innerHTML = content;
    }
</script>


<!-- Footer Section -->
<jsp:include page="footer.jsp"></jsp:include>


<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
>>>>>>> e18aefb (update)
</body>
</html>