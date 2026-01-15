<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<html>
<head>
    <title>Quản lý Đơn hàng - GrowEnglish</title>
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
        
        /* Màu sắc cho trạng thái đơn hàng */
        .status-select.success { color: #198754; font-weight: bold; }
        .status-select.pending { color: #ffc107; font-weight: bold; }
        .status-select.cancel { color: #dc3545; font-weight: bold; }
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
    <a href="${pageContext.request.contextPath}/admin/quizzes"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders" class="active"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <div class="bg-white p-4 rounded shadow-sm">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Danh sách Đơn hàng</h4>
            
            <a href="${pageContext.request.contextPath}/admin/export-orders" class="btn btn-success shadow-sm">
                <i class="fas fa-file-excel me-2"></i> Xuất báo cáo (CSV)
            </a>
        </div>
        
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Khách hàng</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orders}">
                    <tr>
                        <td class="fw-bold text-secondary">#${o.id}</td>
                        <td class="fw-bold">${o.username}</td>
                        <td><fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
                        <td class="text-success fw-bold">$${o.totalPrice}</td>
                        
                        <td>
                            <form action="orders" method="post" class="d-flex align-items-center m-0">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${o.id}">
                                
                                <select name="status" class="form-select form-select-sm border-0 status-select 
                                    ${o.status == 'success' ? 'success' : (o.status == 'cancel' ? 'cancel' : 'pending')}" 
                                    onchange="this.form.submit()" style="width: 140px; background-color: transparent;">
                                    
                                    <option value="pending" ${o.status == 'pending' ? 'selected' : ''}>⏳ Đang xử lý</option>
                                    <option value="success" ${o.status == 'success' ? 'selected' : ''}>✅ Thành công</option>
                                    <option value="cancel" ${o.status == 'cancel' ? 'selected' : ''}>❌ Đã hủy</option>
                                </select>
                            </form>
                        </td>
                        
                        <td>
                            <button class="btn btn-sm btn-outline-secondary" title="Xem chi tiết (Chưa có link)">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty orders}">
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted">
                            <i class="fas fa-box-open fa-3x mb-3 opacity-50"></i>
                            <br>Chưa có đơn hàng nào trong hệ thống.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>