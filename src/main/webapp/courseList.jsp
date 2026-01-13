<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách khóa học - GrowEnglish</title>
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
            padding-bottom: 50px;
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
            transition: 0.3s;
        }
        .btn-active { 
        	background-color: #fb9400 !important; 
        	color: white !important; 
        	border-color: #fb9400 !important; 
        }
        .card { 
        	border: none; 
        	border-radius: 15px; 
        	box-shadow: 0 5px 15px rgba(0,0,0,0.05); 
        	transition: 0.3s; 
        	height: 100%; 
            overflow: hidden;
        }
        .card:hover { 
        	transform: translateY(-8px); 
        	box-shadow: 0 12px 30px rgba(0,0,0,0.1); 
        }
        .card-img-top { 
        	height: 200px; 
        	object-fit: cover; 
        }
        
        .pagination .page-link {
            color: #fb9400;
            border: none;
            margin: 0 5px;
            border-radius: 8px;
            font-weight: 600;
        }
        .pagination .page-item.active .page-link {
            background-color: #fb9400;
            color: white;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Chương trình đào tạo</h2>
                <p class="text-muted m-0">Lộ trình bài bản từ cơ bản đến nâng cao</p>
            </div>
            <div class="custom-search-bar">
                <i class="fas fa-search text-muted"></i>
                <input type="text" id="searchInput" placeholder="Tìm khóa học..." onkeyup="searchCourses()">
            </div>
        </div>

        <div class="filter-group mb-5">
            <button class="btn btn-active">Tất cả</button>
            <button class="btn btn-light text-muted">Cơ bản</button>
            <button class="btn btn-light text-muted">Nâng cao</button>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:if test="${not empty courseList}">
                <c:forEach var="course" items="${courseList}">
                    <div class="col card-item" data-title="${course.name}">
                        <div class="card shadow-sm">
                            <img src="${not empty course.imagePath ? course.imagePath : 'assets/images/default-course.jpg'}" 
                                 class="card-img-top" 
                                 onerror="this.src='https://via.placeholder.com/300x200?text=English+Course'">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-2 text-dark">${course.name}</h5>
                                <p class="text-muted small mb-3" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; height: 40px;">
                                    ${course.shortDescription}
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-warning fw-bold fs-5">$${course.price}</span>
                                    <span class="badge bg-light text-muted fw-normal"><i class="far fa-clock me-1"></i> 12 Buổi</span>
                                </div>
                            </div>
                            <div class="card-footer bg-white border-0 pb-4 px-4 text-center">
                                <a href="${pageContext.request.contextPath}/course-detail?id=${course.id}" class="btn btn-warning rounded-pill px-4 text-white fw-bold w-100 py-2 shadow-sm">
   									Xem lộ trình
								</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty courseList}">
                <div class="col-12 text-center text-muted py-5">
                    <img src="https://cdn-icons-png.flaticon.com/512/7486/7486747.png" width="80" class="mb-3 opacity-25">
                    <p>Hiện chưa có khóa học nào phù hợp.</p>
                </div>
            </c:if>
        </div>

        <c:if test="${totalPages > 1}">
            <nav aria-label="Page navigation" class="mt-5">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link shadow-sm" href="courses?page=${currentPage - 1}"><i class="fas fa-chevron-left"></i></a>
                    </li>

                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link shadow-sm" href="courses?page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link shadow-sm" href="courses?page=${currentPage + 1}"><i class="fas fa-chevron-right"></i></a>
                    </li>
                </ul>
            </nav>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        function searchCourses() {
            let q = document.getElementById('searchInput').value.toLowerCase();
            document.querySelectorAll('.card-item').forEach(c => {
                let title = c.getAttribute('data-title').toLowerCase();
                c.style.display = title.includes(q) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>