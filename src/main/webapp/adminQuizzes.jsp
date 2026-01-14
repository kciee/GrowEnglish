<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Bài thi - GrowEnglish</title>
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
    </style>
</head>
<body>

<div class="sidebar">
    <div class="brand"><i class="fas fa-leaf text-warning"></i> GrowEnglish</div>
    <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> Tổng quan</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Quản lý nội dung</div>
    <a href="${pageContext.request.contextPath}/admin/courses"><i class="fas fa-graduation-cap"></i> Khóa học</a>
    <a href="${pageContext.request.contextPath}/admin/documents"><i class="fas fa-book"></i> Tài liệu (Free)</a>
    <a href="${pageContext.request.contextPath}/admin/paid-documents"><i class="fas fa-file-invoice-dollar me-2"></i> Tài liệu (Paid)</a>
    <a href="${pageContext.request.contextPath}/admin/quizzes" class="active"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <h2>Quản lý Đề Thi</h2>

    <div class="card mb-4 p-4 shadow-sm border-0 mt-3">
        <h5 class="mb-3 text-primary"><i class="fas fa-plus-circle"></i> Tạo đề thi mới</h5>
        <form action="quizzes" method="post" class="row g-3">
            <input type="hidden" name="action" value="create">
            <div class="col-md-5">
                <input type="text" name="name" class="form-control" placeholder="Tên bài thi (VD: Kiểm tra Unit 1)" required>
            </div>
            <div class="col-md-5">
                <input type="text" name="description" class="form-control" placeholder="Mô tả (VD: 15 phút - 20 câu)" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success w-100 fw-bold">Thêm ngay</button>
            </div>
        </form>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-4">ID</th>
                        <th>Tên bài thi</th>
                        <th>Mô tả</th>
                        <th class="text-center">Quản lý nội dung</th>
                        <th class="text-end pe-4">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${quizzes}">
                        <tr>
                            <form action="quizzes" method="post">
                                <td class="ps-4 text-muted">#${q.quizId} <input type="hidden" name="id" value="${q.quizId}"></td>
                                
                                <td><input type="text" name="name" value="${q.quizName}" class="form-control form-control-sm border-0 bg-transparent fw-bold"></td>
                                <td><input type="text" name="description" value="${q.description}" class="form-control form-control-sm border-0 bg-transparent text-muted"></td>
                                
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/questions?quizId=${q.quizId}" class="btn btn-warning btn-sm text-white fw-bold shadow-sm">
                                        <i class="fas fa-list-ol"></i> Soạn câu hỏi
                                    </a>
                                </td>

                                <td class="text-end pe-4">
                                    <button type="submit" name="action" value="update" class="btn btn-outline-primary btn-sm"><i class="fas fa-save"></i></button>
                                    <button type="submit" name="action" value="delete" class="btn btn-outline-danger btn-sm ms-1" onclick="return confirm('Xóa đề thi này và toàn bộ câu hỏi bên trong?')"><i class="fas fa-trash"></i></button>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty quizzes}">
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">Chưa có bài thi nào. Hãy tạo mới!</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>