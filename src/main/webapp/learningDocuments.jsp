<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài liệu đang học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            margin-left: 350px;
            padding-top: 50px;
        }
        .header-image img {
            width: 100%;
            height: 300px;
            position: relative;
            overflow: hidden;
        }
    </style>
</head>
<body>
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
        <a href="FreeDocument" class="btn secondary-btn">Tất cả tài liệu</a>
        <a href="learningDocuments" class="btn primary-btn">Tài liệu đang học</a>
        <button class="btn icon-btn">
            <img src="assets/images/Icon/Filter.svg" alt="Filter" width="24">
        </button>
        <div class="search-bar flex-grow-1" style="width:500px;">
            <img src="assets/images/Icon/Search.svg" alt="Search" width="24" class="me-2">
            <input type="text" id="searchInput" placeholder="Tìm kiếm tài liệu..." class="form-control"
                   onkeyup="searchDocuments()">
        </div>
    </div>
    <div class="container mt-5">
        <h2 class="mb-4">Tài liệu đang học</h2>
        <div class="row">
            <c:if test="${not empty listFreeDocument}">
                <c:forEach var="document" items="${listFreeDocument}">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <img src="assets/images/Card.svg" class="card-img-top" alt="${document.title}">
                            <div class="card-body">
                                <h5 class="card-title">${document.title}</h5>
                                <p class="card-text">${document.description}</p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="FreeDocumentDetail?id=${document.id}" class="btn btn-warning">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty learningDocuments}">
                <p>Không có tài liệu nào đang học.</p>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function searchDocuments() {
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
