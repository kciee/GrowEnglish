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
        .content { 
        	flex-grow: 1; 
        	padding: 30px; 
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h3 class="text-center fw-bold text-warning mb-4">G-Easy Admin</h3>
        <a href="dashboard"><i class="fas fa-chart-line me-2"></i> Dashboard</a>
        <a href="users"><i class="fas fa-users me-2"></i> Người dùng</a>
        <a href="courses"><i class=\"fas fa-book me-2"></i> Khóa học</a>
        <a href="documents"><i class="fas fa-file-alt me-2"></i> Tài liệu</a>
        <a href="quizzes"><i class="fas fa-question-circle me-2"></i> Trắc nghiệm</a>
        <a href="orders" class="active"><i class="fas fa-shopping-cart me-2"></i> Đơn hàng</a>
        <a href="${pageContext.request.contextPath}/home" class="mt-5 border-top pt-3"><i class="fas fa-sign-out-alt me-2"></i> Về trang chủ</a>
    </div>

    <div class="content">
        <div class="bg-white p-4 rounded shadow-sm">
            <h4 class="mb-4 fw-bold text-primary">Danh sách Đơn hàng</h4>
            
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
                            <td>#${o.id}</td>
                            <td class="fw-bold">${o.username}</td>
                            <td><fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
                            <td class="text-success fw-bold">$${o.totalPrice}</td>
                            <td>
                                <form action="orders" method="post" class="d-flex align-items-center">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="id" value="${o.id}">
                                    <select name="status" class="form-select form-select-sm border-0 fw-bold 
                                        ${o.status == 'success' ? 'text-success' : 'text-warning'}" 
                                        onchange="this.form.submit()">
                                        <option value="pending" ${o.status == 'pending' ? 'selected' : ''}>Đang xử lý</option>
                                        <option value="success" ${o.status == 'success' ? 'selected' : ''}>Thành công</option>
                                        <option value="cancel" ${o.status == 'cancel' ? 'selected' : ''}>Đã hủy</option>
                                    </select>
                                </form>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-outline-secondary" title="Xem chi tiết"><i class="fas fa-eye"></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>