<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Ngân hàng đề thi</title>
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
            padding: 70px 60px; 
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
        }
    </style>
</head>
<body>
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
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
            });
        }
    </script>
</body>
</html>