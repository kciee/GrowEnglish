<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài liệu trả phí</title>
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
        .price-tag { 
        	color: #d9534f; 
        	font-weight: bold; 
        	font-size: 1.1rem; 
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Tài liệu trả phí</h2>
                <p class="text-muted m-0">Đầu tư kiến thức, vững bước tương lai</p>
            </div>
            <div class="custom-search-bar">
                <i class="fas fa-search text-muted"></i>
                <input type="text" id="searchInput" placeholder="Tìm khóa học..." onkeyup="searchDocs()">
            </div>
        </div>

        <div class="filter-group mb-5">
            <button class="btn btn-active">Tất cả</button>
            <button class="btn btn-inactive">Combo</button>
            <button class="btn btn-inactive">Lẻ</button>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:if test="${not empty paidDocuments}">
                <c:forEach var="doc" items="${paidDocuments}">
                    <div class="col card-item" data-title="${doc.title}">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/${doc.imagePath}" class="card-img-top" 
                                 onerror="this.src='https://via.placeholder.com/300x200?text=Premium'">
                            <div class="card-body">
                                <h5 class="fw-bold mb-2">${doc.title}</h5>
                                <p class="text-muted small text-truncate">${doc.description}</p>
                                <div class="price-tag mt-2">$${doc.price}</div>
                            </div>
                            <div class="card-footer bg-white border-0 pb-3 pt-0 d-flex gap-2 justify-content-center">
                                <a href="PaidDocumentDetail?id=${doc.id}" class="btn btn-outline-secondary rounded-pill px-3 btn-sm">Chi tiết</a>
                                <a href="${pageContext.request.contextPath}/them-gio-hang?id=${doc.id}" 
                                   class="btn btn-warning rounded-pill px-3 text-white fw-bold btn-sm">
                                   <i class="fas fa-shopping-cart"></i> Thêm giỏ
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
             <c:if test="${empty paidDocuments}">
                <div class="col-12 text-center text-muted py-5">Chưa có khóa học nào.</div>
            </c:if>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        function searchDocs() {
            let q = document.getElementById('searchInput').value.toLowerCase();
            document.querySelectorAll('.card-item').forEach(c => {
                c.style.display = c.getAttribute('data-title').toLowerCase().includes(q) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>