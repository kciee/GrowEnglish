<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tài liệu của tôi</title>
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
        .card { 
        	border: none; 
        	border-radius: 15px; 
        	box-shadow: 0 5px 15px rgba(0,0,0,0.05); 
        	transition: 0.3s; 
        	height: 100%; 
        }
        .card:hover { 
        	transform: translateY(-5px); 
        	box-shadow: 0 10px 25px rgba(0,0,0,0.1); 
        }
        .card-img-top { 
        	height: 180px; 
        	object-fit: cover; 
        	border-top-left-radius: 15px; 
        	border-top-right-radius: 15px; 
        }
        .vip-badge {
            position: absolute; 
            top: 10px; 
            right: 10px;
            background-color: #ffc107; 
            color: #000;
            padding: 5px 10px; 
            border-radius: 5px;
            font-weight: bold; 
            font-size: 0.8rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        .course-badge {
            position: absolute; 
            top: 10px; 
            right: 10px;
            background-color: #0d6efd; 
            color: white;
            padding: 5px 10px; 
            border-radius: 5px;
            font-weight: bold; 
            font-size: 0.8rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h2 class="fw-bold text-dark mb-1">Tài liệu của tôi</h2>
                <p class="text-muted m-0">Quản lý Khóa học và Tài liệu đã sở hữu</p>
            </div>
            <div class="custom-search-bar">
                <i class="fas fa-search text-muted"></i>
                <input type="text" id="searchInput" placeholder="Tìm khóa học, tài liệu..." onkeyup="searchMyDocs()">
            </div>
        </div>

        <h4 class="mb-3 text-primary"><i class="fas fa-graduation-cap"></i> Khóa học của tôi</h4>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
            <c:if test="${not empty myCourses}">
                <c:forEach var="c" items="${myCourses}">
                    <div class="col card-item" data-title="${c.name}">
                        <div class="card h-100 position-relative">
                            <span class="course-badge">COURSE</span>
                            <img src="${c.imagePath}" class="card-img-top" alt="${c.name}" 
                                 onerror="this.src='https://via.placeholder.com/300x200?text=Course'">
                            <div class="card-body">
                                <h5 class="fw-bold mb-2 text-truncate" title="${c.name}">${c.name}</h5>
                                <p class="text-muted small text-truncate">${c.shortDescription}</p>
                            </div>
                            <div class="card-footer bg-white border-0 pb-3 text-center">
                                <a href="learn?courseId=${c.id}" class="btn btn-primary text-white rounded-pill px-4 fw-bold w-100">
                                    <i class="fas fa-play"></i> Vào học
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty myCourses}">
                <div class="col-12 text-muted"><p>Bạn chưa đăng ký khóa học nào.</p></div>
            </c:if>
        </div>
        <hr class="mb-4" style="opacity: 0.1;">
        <h4 class="mb-3 text-secondary"><i class="fas fa-book-open"></i> Tài liệu miễn phí</h4>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
            <c:if test="${not empty listFreeDocument}">
                <c:forEach var="doc" items="${listFreeDocument}">
                    <div class="col card-item" data-title="${doc.title}">
                        <div class="card h-100">
                            <img src="${pageContext.request.contextPath}/${doc.imagePath}" class="card-img-top" 
                                 onerror="this.src='https://via.placeholder.com/300x200?text=Free'">
                            <div class="card-body">
                                <h5 class="fw-bold mb-2 text-truncate" title="${doc.title}">${doc.title}</h5>
                                <p class="text-muted small text-truncate">${doc.description}</p>
                            </div>
                            <div class="card-footer bg-white border-0 pb-3 text-center">
                                <a href="FreeDocumentDetail?id=${doc.id}" class="btn btn-outline-secondary rounded-pill px-4 fw-bold w-100">
                                    Xem ngay
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        function searchMyDocs() {
            let q = document.getElementById('searchInput').value.toLowerCase();
            document.querySelectorAll('.card-item').forEach(c => {
                let title = c.getAttribute('data-title').toLowerCase();
                c.style.display = title.includes(q) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>