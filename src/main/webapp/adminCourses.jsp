<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Khóa học - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
        	min-height: 100vh; 
        	display: flex; 
        	background-color: #f8f9fa; 
        }
        
        .sidebar { 
        	width: 250px; 
        	background: #212529; 
        	color: white; 
        	flex-shrink: 0; 
        	padding-top: 20px; 
        	min-height: 100vh; 
        }
        
        .sidebar a { 
        	color: #adb5bd; 
        	text-decoration: none; 
        	padding: 12px 20px; 
        	display: block; 
        	transition: 0.3s; 
        }
        
        .sidebar a:hover, .sidebar a.active { 
        	background: #343a40; 
        	color: #fff; 
        	border-left: 4px solid #ffc107; 
        }
        
        .sidebar i { 
        	width: 25px; 
        	text-align: center; 
        	margin-right: 10px; 
        }
        
        .sidebar .brand { 
        	text-align: center; 
        	font-size: 22px; 
        	font-weight: bold; 
        	color: white; 
        	margin-bottom: 30px; 
        }
        
        .content { 
        	flex-grow: 1; 
        	padding: 30px; 
        	overflow-y: auto; 
        }
        
        .course-thumb {
            width: 60px;
            height: 40px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="brand"><i class="fas fa-leaf text-warning"></i> GrowEnglish</div>
    <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> Tổng quan</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Quản lý nội dung</div>
    <a href="${pageContext.request.contextPath}/admin/courses" class="active"><i class="fas fa-graduation-cap"></i> Khóa học</a>
    <a href="${pageContext.request.contextPath}/admin/documents"><i class="fas fa-book"></i> Tài liệu (Free)</a>
    <a href="${pageContext.request.contextPath}/admin/paid-documents"><i class="fas fa-file-invoice-dollar me-2"></i> Tài liệu (Paid)</a>
    <a href="${pageContext.request.contextPath}/admin/quizzes"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a> 
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý Khóa học</h2>
    </div>

    <div class="card mb-4 p-4 shadow-sm border-0">
        <h5 class="mb-3 text-primary"><i class="fas fa-plus-circle"></i> Thêm khóa học mới</h5>
        <form action="courses" method="post" enctype="multipart/form-data" class="row g-3">
            <input type="hidden" name="action" value="create">
            
            <div class="col-md-4">
                <label class="form-label small text-muted">Tên khóa học</label>
                <input type="text" name="name" class="form-control" placeholder="Nhập tên khóa học" required>
            </div>
            
            <div class="col-md-3">
                <label class="form-label small text-muted">Giá ($)</label>
                <input type="number" name="price" class="form-control" placeholder="0.0" step="0.1" required>
            </div>
            
            <div class="col-md-5">
                <label class="form-label small text-muted">Ảnh bìa</label>
                <input type="file" name="image" class="form-control" accept="image/*" required>
            </div>

            <div class="col-md-12">
                <label class="form-label small text-muted">Mô tả ngắn</label>
                <input type="text" name="description" class="form-control" placeholder="Mô tả nội dung khóa học..." required>
            </div>
            
            <div class="col-12 text-end">
                <button type="submit" class="btn btn-success px-4"><i class="fas fa-save me-2"></i>Thêm mới</button>
            </div>
        </form>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-3">ID</th>
                        <th>Ảnh bìa</th> <th>Tên khóa học</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th class="text-end pe-3">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${courses}">
                        <tr>
                            <form action="courses" method="post" enctype="multipart/form-data">
                                <td class="ps-3 fw-bold text-muted">#${c.id} 
                                    <input type="hidden" name="id" value="${c.id}">
                                    <input type="hidden" name="currentImage" value="${c.imagePath}">
                                </td>
                                
                                <td style="width: 150px;">
                                    <div class="d-flex flex-column align-items-start">
                                        <img src="${c.imagePath}" class="course-thumb mb-1" alt="img" onerror="this.src='https://via.placeholder.com/60x40'">
                                        <input type="file" name="image" class="form-control form-control-sm" style="font-size: 10px; width: 140px;">
                                    </div>
                                </td>

                                <td><input type="text" name="name" value="${c.name}" class="form-control form-control-sm border-0 bg-transparent fw-bold text-primary"></td>
                                
                                <td><textarea name="description" class="form-control form-control-sm border-0 bg-transparent text-muted" rows="2" style="resize: none;">${c.shortDescription}</textarea></td>
                                
                                <td><input type="number" name="price" value="${c.price}" class="form-control form-control-sm border-0 bg-transparent text-success fw-bold" step="0.1" style="width: 80px;"></td>
                                
                                <td class="text-end pe-3">
                                    <button type="submit" name="action" value="update" class="btn btn-outline-primary btn-sm mb-1" title="Lưu thay đổi"><i class="fas fa-save"></i></button>
                                    <button type="submit" name="action" value="delete" class="btn btn-outline-danger btn-sm mb-1" onclick="return confirm('Xóa khóa học này?')" title="Xóa"><i class="fas fa-trash"></i></button>
                                	<a href="lessons?courseId=${c.id}" class="btn btn-warning btn-sm mb-1" title="Soạn bài giảng">
    									<i class="fas fa-list"></i>
									</a>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty courses}">
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">Chưa có khóa học nào.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>