<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Người dùng - GrowEnglish</title>
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
        
        .role-badge { 
        	font-size: 0.85rem; 
        	padding: 5px 10px; 
        	border-radius: 20px;
        	font-weight: bold; 
       	}
       	
        .role-admin { 
        	background-color: #d1e7dd; 
        	color: #0f5132; 
        }
        .role-user { 
        	background-color: #f8d7da; 
        	color: #842029; 
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
    <a href="${pageContext.request.contextPath}/admin/quizzes"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users" class="active"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <h2 class="mb-4">Danh sách người dùng</h2>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-4">Tên đăng nhập</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Năm sinh</th>
                        <th>Vai trò</th>
                        <th class="text-end pe-4">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td class="ps-4 fw-bold">${u.username}</td>
                            <td>${u.fullName}</td>
                            <td>${u.email}</td>
                            <td>${u.birthYear}</td>
                            <td>
                                <span class="role-badge ${u.role eq 'admin' ? 'role-admin' : 'role-user'}">
                                    ${u.role eq 'admin' ? 'Quản trị viên' : 'Học viên'}
                                </span>
                            </td>
                            <td class="text-end pe-4">
                                <form method="post" action="${pageContext.request.contextPath}/admin/users" class="d-inline">
                                    <input type="hidden" name="username" value="${u.username}"/>
                                    
                                    <c:choose>
                                        <c:when test="${u.role eq 'admin'}">
                                            <button type="submit" name="action" value="demote" class="btn btn-outline-secondary btn-sm" title="Hạ xuống User">
                                                <i class="fas fa-arrow-down"></i> Hạ quyền
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" name="action" value="promote" class="btn btn-outline-success btn-sm" title="Thăng lên Admin">
                                                <i class="fas fa-arrow-up"></i> Thăng quyền
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <button type="submit" name="action" value="delete" class="btn btn-outline-danger btn-sm ms-1" onclick="return confirm('Xoá người dùng này?')" title="Xóa">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>