<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IELTS Intermediate</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }
        .container-fluid {
            display: flex;
            flex-direction: row;
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
            margin-left: 120px;
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
            background-color: #ff1234;
            color: #fff;
        }
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
            background-color: #ff9800;
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
        }
    </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="container-fluid">
    <div class="main-content">
        <section class="header-section">
            <div class="header-content">
                <div class="header-image">
                    <img src="assets/images/banner1.png" alt="Student Image">
                </div>
            </div>
        </section>
        <div class="nav-buttons">
            <button class="tab active" onclick="selectTab(this)">Thông tin khóa học</button>
            <button class="tab" onclick="selectTab(this)">Lịch học</button>
            <button class="tab" onclick="selectTab(this)">Lộ trình học tập</button>
            <button class="tab" onclick="selectTab(this)">Cam kết sau khóa học</button>
        </div>
        <section class="content-section">
            <h2>Xây dựng và phát triển vốn từ vựng cần thiết tương đương trình độ B2</h2>
            <ul>
                <li>Nắm vững và làm chủ nền tảng kiến thức</li>
                <li>Nắm vững các cấu trúc từ vựng quan trọng để làm tốt các kỹ năng Reading và Listening</li>
                <li>Tăng cường khả năng tự học và đánh giá khả năng tiếng Anh</li>
                <li>Làm quen với các dạng bài thi mới nhất IELTS Computer Test</li>
            </ul>
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
            <p>${documentDetail.NoiDung}"</p>
            <p class="price">Học phí: 6.250.000 VND / 3 tháng. Phí này đã
                gồm tài liệu. Các bài sửa Writing do giảng viên Writing 8.5 chấm
                dựa chính xác vào tiêu chí chấm thi. Ngoài ra, chúng tôi cũng hỗ
                trợ tư vấn không giới hạn mọi thứ về IELTS.</p>
            <button class="cta-button">Đăng ký ngay</button>
        </section>
    </div>
</div>
<script>
    function selectTab(selectedButton) {
        document.querySelectorAll('.tab').forEach(button => {
            button.classList.remove('active');
        });
        selectedButton.classList.add('active');
        const contentSection = document.querySelector('.content-section');
        const buttonText = selectedButton.textContent.trim()
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
        contentSection.innerHTML = content;
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>