<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tài liệu của tôi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        
        .vip-badge, .course-badge { 
	        position: absolute; 
	        top: 10px; 
	        right: 10px; 
	        padding: 5px 10px; 
	        border-radius: 5px; 
	        font-weight: bold; 
	        font-size: 0.8rem; 
	        box-shadow: 0 2px 4px rgba(0,0,0,0.2); 
	        z-index: 5; 
        }
        
        .vip-badge { 
	        background-color: #ffc107; 
	        color: #000; 
        }
        
        .course-badge { 
	        background-color: #0d6efd; 
	        color: white; 
        }

        .card-item { 
        	position: relative; 
        }
        
        .delete-overlay { 
	        position: absolute; 
	        top: 10px; 
	        left: 20px; 
	        opacity: 0; 
	        transition: 0.3s; 
	        z-index: 10; 
	        transform: scale(0.8); 
        }
        
        .card-item:hover .delete-overlay { 
	        opacity: 1; 
	        transform: scale(1); 
        }
        
        .btn-delete-doc { 
	        background: rgba(220, 53, 69, 0.9); 
	        color: white; 
	        border-radius: 50%; 
	        width: 38px; 
	        height: 38px; 
	        display: flex; 
	        align-items: center; 
	        justify-content: center; 
	        text-decoration: none; 
	        transition: 0.2s; 
        }
        
        .btn-delete-doc:hover { 
	        background: #dc3545; 
	        color: white; 
	        transform: rotate(15deg); 
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
                <input type="text" id="searchInput" placeholder="Tìm kiếm..." onkeyup="searchMyDocs()">
            </div>
        </div>

        <h4 class="mb-3 text-primary"><i class="fas fa-graduation-cap"></i> Khóa học của tôi</h4>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
            <c:forEach var="c" items="${myCourses}">
                <div class="col card-item" data-title="${c.name}">
                    <div class="delete-overlay">
                        <a href="javascript:void(0)" class="btn-delete-doc" onclick="confirmDelete('${c.id}', 'course')">
    						<i class="fas fa-trash-alt"></i>
						</a>
                    </div>
                    <div class="card h-100">
                        <span class="course-badge">COURSE</span>
                        <img src="${c.imagePath}" class="card-img-top" onerror="this.src='https://via.placeholder.com/300x200?text=Course'">
                        <div class="card-body">
                            <h5 class="fw-bold mb-2 text-truncate">${c.name}</h5>
                            <p class="text-muted small text-truncate">${c.shortDescription}</p>
                        </div>
                        <div class="card-footer bg-white border-0 pb-3"><a href="learn?courseId=${c.id}" class="btn btn-primary rounded-pill w-100 fw-bold">Vào học</a></div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty myCourses}">
        		<p class="text-muted">Bạn chưa khóa học nào.</p>
    		</c:if>
        </div>

        <h4 class="mb-3 text-warning"><i class="fas fa-crown"></i> Tài liệu trả phí</h4>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
            <c:forEach var="doc" items="${listPaidDocument}">
                <div class="col card-item" data-title="${doc.title}">
                    <div class="delete-overlay">
                        <a href="javascript:void(0)" class="btn-delete-doc" onclick="confirmDelete('${doc.id}', 'paid')">
    						<i class="fas fa-trash-alt"></i>
						</a>
                    </div>
                    <div class="card h-100">
                        <span class="vip-badge">VIP DOC</span>
                        <img src="${doc.imagePath}" class="card-img-top" onerror="this.src='https://via.placeholder.com/300x200?text=VIP'">
                        <div class="card-body">
                            <h5 class="fw-bold mb-2 text-truncate">${doc.title}</h5>
                            <p class="text-muted small text-truncate">${doc.description}</p>
                        </div>
                        <div class="card-footer bg-white border-0 pb-3"><a href="PaidDocumentDetail?id=${doc.id}" class="btn btn-warning text-white rounded-pill w-100 fw-bold">Xem tài liệu</a></div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty listPaidDocument}">
        		<p class="text-muted">Bạn chưa có tài liệu trả phí nào.</p>
    		</c:if>
        </div>

        <h4 class="mb-3 text-secondary"><i class="fas fa-book-open"></i> Tài liệu miễn phí</h4>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
            <c:forEach var="doc" items="${listFreeDocument}">
                <div class="col card-item" data-title="${doc.title}">
                    <div class="delete-overlay">
                        <a href="javascript:void(0)" class="btn-delete-doc" onclick="confirmDelete('${doc.id}', 'free')">
    						<i class="fas fa-trash-alt"></i>
						</a>
                    </div>
                    <div class="card h-100">
                        <img src="${pageContext.request.contextPath}/${doc.imagePath}" class="card-img-top" onerror="this.src='https://via.placeholder.com/300x200?text=Free'">
                        <div class="card-body">
                            <h5 class="fw-bold mb-2 text-truncate">${doc.title}</h5>
                            <p class="text-muted small text-truncate">${doc.description}</p>
                        </div>
                        <div class="card-footer bg-white border-0 pb-3"><a href="FreeDocumentDetail?id=${doc.id}" class="btn btn-outline-secondary rounded-pill w-100 fw-bold">Xem ngay</a></div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty listFreeDocument}">
        		<p class="text-muted">Bạn chưa có tài liệu miễn phí nào.</p>
    		</c:if>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	    function confirmDelete(id, type) {
	        Swal.fire({
	            title: 'Bạn có chắc chắn?',
	            text: "Dữ liệu học tập này sẽ bị xóa khỏi kho của bạn!",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#d33',
	            cancelButtonColor: '#3085d6',
	            confirmButtonText: 'Xóa ngay',
	            cancelButtonText: 'Hủy'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                window.location.href = "delete-learning-doc?id=" + id + "&type=" + type;
	            }
	        });
	    }
	    window.onload = function() {
	        const urlParams = new URLSearchParams(window.location.search);
	        if (urlParams.get('status') === 'success') {
	            const Toast = Swal.mixin({
	                toast: true,
	                position: 'top-end',
	                showConfirmButton: false,
	                timer: 3000,
	                timerProgressBar: true
	            });
	            Toast.fire({
	                icon: 'success',
	                title: 'Đã xóa thành công!'
	            });
	            window.history.replaceState({}, document.title, window.location.pathname);
	        }
	    };
	</script>
</body>
</html>