<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
=======
<%@ page import="growenglish.model.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
>>>>>>> e18aefb (update)
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
<<<<<<< HEAD
    <title>Ngân hàng đề thi</title>
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
            padding-bottom: 20px;
        }
        .custom-search-bar {
            background: white; 
            border-radius: 50px; 
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            display: flex; 
            align-items: center; 
            width: 350px; 
            border: 1px solid #eee;
        }
        .custom-search-bar input { 
        	border: none; 
        	outline: none; 
        	width: 100%; 
        	margin-left: 10px; 
        	background: transparent; 
        }
        
        .filter-group .btn { 
        	border-radius: 50px; 
        	padding: 8px 24px; 
        	font-weight: 600; 
        	margin-right: 10px; 
        	border: 1px solid #eee; 
        }
        .btn-active { 
        	background-color: #fb9400 !important; 
        	color: white !important; 
        	border-color: #fb9400 !important; 
        }
        .btn-inactive {
        	background-color: white !important; 
        	color: #666 !important; 
        }

        .quiz-card {
            border: none; 
            border-radius: 15px; 
            background: white; 
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05); 
            transition: 0.3s;
            display: flex; 
            flex-direction: column; 
            height: 100%; 
            justify-content: space-between;
        }
        .quiz-card:hover { 
        	transform: translateY(-5px); 
        	box-shadow: 0 8px 25px rgba(0,0,0,0.1); 
        }
        .icon-box {
            width: 50px; 
            height: 50px;
            background: #FFF4E5; 
            color: #fb9400;
            border-radius: 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center;
            font-size: 1.5rem; 
            margin-bottom: 15px;
=======
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Search and Filter Bar</title>
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <style>
        .primary-btn {
            background-color: #fb9400 !important;
            color: white;
            font-weight: bold;
            border-radius: 50px;
            padding: 10px 24px;
        }

        .secondary-btn {
            background-color: #ecebe9 !important;
            color: #4f4b45;
            border-radius: 50px;
            padding: 10px 24px;
        }

        .icon-btn {
            background-color: #ecebe9 !important;
            border-radius: 50%;
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-bar {
            background-color: #eaeaea;
            border-radius: 50px;
            padding: 10px 20px;
            display: flex;
            align-items: center;
        }

        .search-bar input {
            border: none;
            background: none;
            outline: none;
            width: 100%;
        }

        .main-content {
            margin-left: 380px;
            padding-top: 50px;
        }

        .header-image img {
            width: 100%;
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        .list_test {
            margin-left: 75px !important;
        }

        .card-body {
            padding: 0 !important;
        }

        .card {
            border-radius: 20px !important;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-footer {
            background-color: transparent !important;
            border: none !important;
            padding: 10px 16px;
        }

        .btn-warning {
            background-color: #fb9400 !important;
            border: none;
            color: #fff;
            font-weight: bold;
>>>>>>> e18aefb (update)
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Kiểm tra năng lực</h2>
                <div class="text-muted m-0">Đánh giá trình độ tiếng Anh của bạn</div>
            </div>
            <div class="custom-search-bar">
                <i class="fas fa-search text-muted"></i>
                <input type="text" id="searchInput" placeholder="Tìm bài thi..." onkeyup="searchQuiz()">
            </div>
        </div>

        <div class="filter-group mb-5">
            <button class="btn btn-active">Tất cả</button>
            <button class="btn btn-inactive">Ngữ pháp</button>
            <button class="btn btn-inactive">Từ vựng</button>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:if test="${not empty quizzes}">
                <c:forEach var="quiz" items="${quizzes}">
                    <div class="col card-item" data-title="${quiz.quizName}">
                        <div class="quiz-card">
                            <div>
                                <div class="icon-box"><i class="fas fa-pencil-alt"></i></div>
                                <h5 class="fw-bold text-dark">${quiz.quizName}</h5>
                                <p class="text-muted small">${quiz.description}</p>
                            </div>
                            <div class="mt-3 text-end">
                                <a href="${pageContext.request.contextPath}/quizDetail?quizId=${quiz.quizId}" 
                                   class="btn btn-warning rounded-pill px-4 text-white fw-bold">
                                   Làm bài <i class="fas fa-arrow-right ms-2"></i>
                                </a>
=======
<!-- Sidebar -->
<div class="container-fluid">
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Nội dung chính -->
    <!-- Banner Section -->
    <div class="main-content">
        <section class="header-section">
            <div class="header-content">
                <div class="header-image">
                    <img src="assets/images/banner1.png" alt="Student Image">
                </div>
            </div>
        </section>
        <div class="container d-flex align-items-center gap-3 mt-3">
            <!-- Primary Button -->
            <button class="btn primary-btn">Tất cả bài kiểm tra</button>

            <!-- Secondary Button -->
            <button class="btn secondary-btn">Bài đang làm</button>

            <!-- Icon Button -->
            <button class="btn icon-btn">
                <img src="assets/images/Icon/Filter.svg" alt="Filter" width="24">
            </button>

            <!-- Search Bar -->
            <div class="search-bar flex-grow-1" style="width:500px;">
                <img src="assets/images/Icon/Search.svg" alt="Search" width="24" class="me-2">
                <input type="text" id="searchInput" placeholder="Search..." class="form-control"
                       onkeyup="searchQuizzes()">
            </div>
        </div>
        <div class="container mt-5 list_test">
            <div class="row" id="quizList">
                <!-- Lặp qua danh sách các bài kiểm tra -->
                <c:forEach var="quiz" items="${quizzes}">
                    <div class="col-md-4 mb-4 card-item" data-title="${quiz.quizName}">
                        <div class="card h-100">
                            <!-- Hình ảnh cố định trên mỗi card -->
                            <img src="assets/images/Card.svg" class="card-img-top" alt="Quiz Image">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <h5 class="card-title" style="margin-left: 20px">${quiz.quizName}</h5>
                                <p class="card-text" style="margin-left: 20px">${quiz.description}</p>
                            </div>
                            <!-- Nút "Xem chi tiết" ở góc phải dưới -->
                            <div class="card-footer text-end toan">
                                <a href="${pageContext.request.contextPath}/quizDetail?quizId=${quiz.quizId}"
                                   class="btn btn-warning">Xem chi tiết</a>
>>>>>>> e18aefb (update)
                            </div>
                        </div>
                    </div>
                </c:forEach>
<<<<<<< HEAD
            </c:if>
             <c:if test="${empty quizzes}">
                <div class="col-12 text-center text-muted py-5">Hiện chưa có bài kiểm tra nào.</div>
            </c:if>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        function searchQuiz() {
            let q = document.getElementById('searchInput').value.toLowerCase();
            document.querySelectorAll('.card-item').forEach(c => {
                c.style.display = c.getAttribute('data-title').toLowerCase().includes(q) ? 'block' : 'none';
=======
            </div>

        </div>
    </div>

    <!-- Footer Section -->
    <%--    <jsp:include page="footer.jsp"></jsp:include>--%>
    <%@ include file="footer.jsp" %>
    <!-- Bootstrap JS -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript tìm kiếm -->
    <script>
        // Hàm tìm kiếm bài kiểm tra
        function searchQuizzes() {
            var searchQuery = document.getElementById('searchInput').value.toLowerCase();  // Lấy từ khóa tìm kiếm và chuyển về chữ thường
            var cards = document.querySelectorAll('.card-item');  // Lấy tất cả các phần tử card

            cards.forEach(function (card) {
                var title = card.getAttribute('data-title').toLowerCase();  // Lấy tên bài kiểm tra từ data-title và chuyển về chữ thường

                // Kiểm tra nếu tiêu đề bài kiểm tra chứa từ khóa tìm kiếm
                if (title.includes(searchQuery)) {
                    card.style.display = 'block';  // Hiển thị bài kiểm tra nếu tìm thấy từ khóa
                } else {
                    card.style.display = 'none';  // Ẩn bài kiểm tra nếu không tìm thấy từ khóa
                }
>>>>>>> e18aefb (update)
            });
        }
    </script>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> e18aefb (update)
