<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài liệu miễn phí</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
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
            width: 100%;
        }
        .main-content {
            margin-left: 300px;
            padding-top: 80px;
            width: 100%;
        }
        .logo {
            font-weight: bold;
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
        }
        .menu-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 25px 0;
            text-decoration: none;
            color: black;
        }
        .menu-item:hover {
            color: #ff9800;
        }
        .active {
            background-color: #ff9800;
            color: white;
            border-radius: 8px;
            padding: 10px;
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
        .carousel-item {
            background-color: transparent;
        }

        .carousel-inner {
            background-color: transparent;
        }
        .carousel-item img {
            width: 100%;
            height: auto;
            display: block;
        }
        .container-fluid.p-0 {
            margin-left: 120px;
        }
        .container {
            margin-left: 120px;
        }
        .frame-70 {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 334px;
            padding: 140px;
        }
        .rectangle-170 {
            width: 40%;
            max-width: 400px;
            border-radius: 48px;
            object-fit: cover;
        }
        .feature-section, .feature-section * {
            box-sizing: border-box;
        }
        .feature-section {
            margin-top: -450px;
            height: 177px;
            position: relative;
        }
        .feature-item {
            width: 12.4%;
            height: 100%;
            position: absolute;
        }
        .feature-background {
            background: #f3f3f3;
            border-radius: 50%;
            width: 64%;
            height: 45.5%;
            position: absolute;
            top: 0;
            left: 18%;
        }
        .feature-icon img {
            width: 22.8%;
            height: 16.3%;
            position: absolute;
            top: 15%;
            left: 38%;
            overflow: visible;
        }
        .feature-text {
            color: #7b7d81;
            text-align: center;
            font-family: "Roboto-Regular", sans-serif;
            font-size: 16px;
            line-height: 28px;
            font-weight: 400;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        #carouselExampleControlsNoTouching {
            display: block;
            position: relative;
            height: 400px;
            width: 80%;
            margin-left: 130px;
            position: relative;
        }
        
    </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="main-content">
    <section class="header-section">
        <div class="header-content">
            <div class="header-image">
                <img src="${pageContext.request.contextPath}/assets/images/banner1.png" alt="Student Image">
            </div>
        </div>
    </section>
    <div class="container d-flex align-items-center gap-3 mt-3">
        <a href="${pageContext.request.contextPath}/FreeDocument" class="btn primary-btn">Tất cả tài liệu</a>
        <a href="${pageContext.request.contextPath}/learningDocuments" class="btn secondary-btn">Tài liệu đang học</a>
        <button class="btn icon-btn">
            <img src="${pageContext.request.contextPath}/assets/images/Icon/Filter.svg" alt="Filter" width="24">
        </button>
        <div class="search-bar flex-grow-1" style="width:500px;">
            <img src="${pageContext.request.contextPath}/assets/images/Icon/Search.svg" alt="Search" width="24" class="me-2">
            <input type="text" id="searchInput" placeholder="Tìm kiếm tài liệu..." class="form-control"
                   onkeyup="searchDocuments()">
        </div>
    </div>
    <div class="container mt-5">
        <div class="row" id="documentList">
            <c:if test="${not empty listDocs}">
                <c:forEach var="doc" items="${listDocs}">
                    <div class="col-md-4 mb-4 card-item" data-title="${doc.title}">
                        <div class="card h-100">
                            <img src="${pageContext.request.contextPath}/${doc.imagePath}" class="card-img-top" alt="${doc.title}">
                            <div class="card-body">
                                <h5 class="card-title">${doc.title}</h5>
                                <p class="card-text">${doc.description}</p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="${pageContext.request.contextPath}/FreeDocumentDetail?id=${doc.id}" class="btn btn-warning">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty listDocs}">
                <p>Không có tài liệu nào để hiển thị.</p>
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