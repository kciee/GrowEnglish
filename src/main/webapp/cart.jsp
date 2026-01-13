<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="growenglish.model.Order" %>
<%@ page import="growenglish.model.User" %>
<%@ page import="growenglish.dao.OrderDAO" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser != null) {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> historyList = orderDAO.getOrdersByUsername(currentUser.getUsername());
        request.setAttribute("orders", historyList);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        body { 
        	background-color: #f9f9f9; 
       		min-height: 100vh; 
       		display: flex; 
       		flex-direction: column;
       	}

        .main-content {
            margin-left: 90px;
            padding-top: 50px;
            width: calc(100% - 90px);
            flex: 1;
        }

        .tab-content {
            border-radius: 0 0 15px 15px;
        }
        
        .nav-tabs .nav-link.active {
            border-top: 3px solid #fb9400;
            color: #fb9400 !important;
        }

        .checkout-btn {
            background-color: #fb9400; 
            color: white; 
            padding: 12px 50px;
            border: none; 
            border-radius: 50px; 
            font-weight: bold; 
            font-size: 18px;
            cursor: pointer; 
            transition: 0.3s; 
            box-shadow: 0 4px 15px rgba(251, 148, 0, 0.3);
        }
        .checkout-btn:hover { 
        	background-color: #e08600; 
            transform: translateY(-2px);
        }
        .checkout-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <%@include file="./menu.jsp"%>
    
    <div class="container mb-5" style="margin-top: 120px; min-height: 600px;"> 
        <h2 class="mb-4 fw-bold text-dark"><i class="fas fa-shopping-bag text-warning"></i> Thông tin mua sắm</h2>
    	
        <ul class="nav nav-tabs" id="myTab" role="tablist">
        	<li class="nav-item" role="presentation">
            	<button class="nav-link active fw-bold text-dark" id="cart-tab" data-bs-toggle="tab" data-bs-target="#cart-content" type="button">
                	<i class="fas fa-shopping-cart"></i> Giỏ hàng hiện tại
            	</button>
        	</li>
       	 	<li class="nav-item" role="presentation">
            	<button class="nav-link fw-bold text-dark" id="history-tab" data-bs-toggle="tab" data-bs-target="#history-content" type="button">
                	<i class="fas fa-history"></i> Lịch sử giao dịch
            	</button>
        	</li>
    	</ul>
    	
    	<div class="tab-content border border-top-0 p-4 bg-white shadow-sm" id="myTabContent">
        	<div class="tab-pane fade show active" id="cart-content">
            	<div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="m-0 fw-bold">Sản phẩm đang chọn</h4>
					<span class="text-muted">
					    Đang có ${ #lists.size(paidDocuments) + #lists.size(cartCourses) } mục
					</span>                
				</div>

            	<table class="table align-middle">
                	<thead class="table-light">
                    	<tr>
                        	<th style="width: 50%">Sản Phẩm</th>
                        	<th>Loại</th>
                        	<th>Giá</th>
                        	<th class="text-center">Thao tác</th>
                    	</tr>
                	</thead>
                	<tbody>
                    	<c:if test="${empty paidDocuments and empty cartCourses}">
                         	<tr>
                                <td colspan="4" class="text-center py-5">
                                    <img src="https://cdn-icons-png.flaticon.com/512/11329/11329060.png" width="100" class="mb-3 opacity-50">
                                    <p class="text-muted">Giỏ hàng của bạn đang trống!</p>
                                    <a href="courses" class="btn btn-outline-warning btn-sm rounded-pill">Tiếp tục mua sắm</a>
                                </td>
                            </tr>
                    	</c:if>

                    	<c:forEach items="${paidDocuments}" var="d">
                        	<tr>
                            	<td>
                            		<div class="d-flex align-items-center">
                            			<img src="${not empty d.imagePath ? d.imagePath : 'assets/images/default-vip.jpg'}" 
                                             alt="img" style="width: 50px; height: 50px; object-fit: cover; margin-right: 15px;" class="rounded border">
                            			<div class="fw-bold">${d.title}</div>
                            		</div>
                            	</td>
                            	<td><span class="badge bg-info text-dark">Tài liệu VIP</span></td>
                            	<td class="fw-bold text-danger">$${d.price}</td>
                            	<td class="text-center">
                            		<a href="remove-cart?type=doc&id=${d.id}" class="text-danger" title="Xóa khỏi giỏ">
                                        <i class="fas fa-trash-alt fa-lg"></i>
                                    </a>
                            	</td>
                        	</tr>
                    	</c:forEach>

                    	<c:forEach items="${cartCourses}" var="c">
                        	<tr>
                            	<td>
                            		<div class="d-flex align-items-center">
                            			<div class="bg-primary text-white rounded d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; margin-right: 15px;">
                            				<i class="fas fa-graduation-cap fa-lg"></i>
                            			</div>
                            			<div class="fw-bold">${c.name}</div>
                            		</div>
                            	</td>
                            	<td><span class="badge bg-primary">Khóa học</span></td>
                            	<td class="fw-bold text-danger">$${c.price}</td>
                            	<td class="text-center">
                            		<a href="remove-cart?type=course&id=${c.id}" class="text-danger" title="Xóa khỏi giỏ">
                                        <i class="fas fa-trash-alt fa-lg"></i>
                                    </a>
                            	</td>
                        	</tr>
                    	</c:forEach>
                	</tbody>
            	</table>
            	
            	<c:if test="${not empty paidDocuments or not empty cartCourses}">
                	<div class="d-flex justify-content-between align-items-center mt-4 pt-4 border-top">
                		<div class="h5">
                			Tổng thanh toán: <span class="text-danger fw-bold fs-3">
                				<c:set var="total" value="${0}"/>
                				<c:forEach items="${paidDocuments}" var="item"><c:set var="total" value="${total + item.price}"/></c:forEach>
                				<c:forEach items="${cartCourses}" var="item"><c:set var="total" value="${total + item.price}"/></c:forEach>
                				$${total}
                			</span>
                		</div>
                		<form action="checkout" method="post" id="checkoutForm">
                     		<button type="submit" class="checkout-btn shadow" id="btnThanhToan">
                                <i class="fas fa-credit-card me-2"></i>Thanh toán ngay
                            </button>
                     	</form>
                	</div>
            	</c:if>
        	</div>

        	<div class="tab-pane fade" id="history-content">
            	<h4 class="mb-3 text-primary fw-bold">Đơn hàng đã mua</h4>
            	<c:choose>
                	<c:when test="${empty orders}">
                    	<div class="text-center py-5">
                            <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
                        	<p class="text-muted">Bạn chưa có giao dịch nào.</p>
                    	</div>
                	</c:when>
                	<c:otherwise>
                    	<table class="table table-hover border">
                        	<thead class="table-dark">
                            	<tr>
                                	<th>Mã đơn</th>
                                	<th>Ngày mua</th>
                                	<th>Tổng tiền</th>
                                	<th class="text-center">Trạng thái</th>
                            	</tr>
                        	</thead>
                        	<tbody>
                            	<c:forEach var="o" items="${orders}">
                                	<tr>
                                    	<td><span class="badge bg-light text-dark border">#${o.id}</span></td>
                                    	<td><fmt:formatDate value="${o.orderDate}" pattern="dd-MM-yyyy HH:mm"/></td>
                                    	<td class="fw-bold text-success">$${o.totalPrice}</td>
                                    	<td class="text-center">
                                        	<span class="badge rounded-pill ${o.status == 'success' ? 'bg-success' : 'bg-warning text-dark'} px-3">
                                            	${o.status == 'success' ? 'Thành công' : 'Đang xử lý'}
                                        	</span>
                                    	</td>
                                	</tr>
                            	</c:forEach>
                        	</tbody>
                    	</table>
                	</c:otherwise>
            	</c:choose>
        	</div>
    	</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const error = urlParams.get('error');

            if (error === 'already_owned') {
                Swal.fire({
                    icon: 'info',
                    title: 'Đã sở hữu',
                    text: 'Bạn đã sở hữu sản phẩm này rồi, hãy kiểm tra kho tài liệu nhé!',
                    confirmButtonColor: '#fb9400'
                });
            } else if (error === 'system_error') {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi thanh toán',
                    text: 'Có lỗi xảy ra trong quá trình xử lý, vui lòng thử lại sau!',
                });
            }
            window.history.replaceState({}, document.title, window.location.pathname);
        }
        document.getElementById('checkoutForm')?.addEventListener('submit', function(e) {
            const btn = document.getElementById('btnThanhToan');
            btn.disabled = true;
            btn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Đang xử lý...';
        });
    </script>

    <%@include file="./footer.jsp"%>
</body>
</html>