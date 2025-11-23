<%@ page import="growenglish.model.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search and Filter Bar</title>
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
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="main-content">
        <section class="header-section">
            <div class="header-content">
                <div class="header-image">
                    <img src="assets/images/banner1.png" alt="Student Image">
                </div>
            </div>
        </section>
        <div class="container d-flex align-items-center gap-3 mt-3">
            <button class="btn primary-btn">Tất cả bài kiểm tra</button>
            <button class="btn secondary-btn">Bài đang làm</button>
            <button class="btn icon-btn">
                <img src="assets/images/Icon/Filter.svg" alt="Filter" width="24">
            </button>
            <div class="search-bar flex-grow-1" style="width:500px;">
                <img src="assets/images/Icon/Search.svg" alt="Search" width="24" class="me-2">
                <input type="text" id="searchInput" placeholder="Search..." class="form-control"
                       onkeyup="searchQuizzes()">
            </div>
        </div>
        <div class="container mt-5 list_test">
            <div class="row" id="quizList">
                <c:forEach var="quiz" items="${quizzes}">
                    <div class="col-md-4 mb-4 card-item" data-title="${quiz.quizName}">
                        <div class="card h-100">
                            <img src="assets/images/Card.svg" class="card-img-top" alt="Quiz Image">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <h5 class="card-title" style="margin-left: 20px">${quiz.quizName}</h5>
                                <p class="card-text" style="margin-left: 20px">${quiz.description}</p>
                            </div>
                            <div class="card-footer text-end toan">
                                <a href="${pageContext.request.contextPath}/quizDetail?quizId=${quiz.quizId}"
                                   class="btn btn-warning">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%--    <jsp:include page="footer.jsp"></jsp:include>--%>
    <%@ include file="footer.jsp" %>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function searchQuizzes() {
            var searchQuery = document.getElementById('searchInput').value.toLowerCase();
            var cards = document.querySelectorAll('.card-item');
            cards.forEach(function (card) {
                var title = card.getAttribute('data-title').toLowerCase();
                if (title.includes(searchQuery)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
