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
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    
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

        .checkout-btn {
            background-color: #fb9400; 
            color: white; 
            padding: 10px 30px;
            border: none; 
            border-radius: 50px; 
            font-weight: bold; 
            font-size: 16px;
            cursor: pointer; 
            transition: 0.3s; 
            margin-top: 20px;
        }
        .checkout-btn:hover { 
        	background-color: #e08600; 
        }
    </style>
</head>
<body>
    <%@include file="./menu.jsp"%>
    <div class="container mb-5" style="margin-top: 120px; min-height: 600px;"> <h2 class="mb-4 fw-bold text-warning">Thông tin mua sắm</h2>
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
            	<h4 class="mb-3">Sản phẩm đang chọn</h4>
            	<table class="table align-middle">
                	<thead class="table-light">
                    	<tr>
                        	<th>Sản Phẩm</th>
                        	<th>Giá</th>
                        	<th>Thao tác</th>
                    	</tr>
                	</thead>
                	<tbody>
                    	<c:if test="${empty sessionScope.cart}">
                         	<tr><td colspan="3" class="text-center py-5 text-muted">Giỏ hàng của bạn đang trống!</td></tr>
                    	</c:if>
                    	<c:forEach items="${sessionScope.cart}" var="item">
                        	<tr>
                            	<td>${item.value.product.name}</td>
                            	<td class="fw-bold text-danger">$${item.value.product.price}</td>
                            	<td><a href="remove-cart?id=${item.key}" class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i> Xóa</a></td>
                        	</tr>
                    	</c:forEach>
                	</tbody>
            	</table>
            	<c:if test="${not empty sessionScope.cart}">
                	<div class="text-end mt-3">
                     	<a href="checkout" class="btn btn-warning text-white fw-bold px-4 py-2">Thanh toán ngay</a>
                	</div>
            	</c:if>
        	</div>
        	<div class="tab-pane fade" id="history-content">
            	<h4 class="mb-3 text-primary">Đơn hàng đã mua</h4>
            	<c:choose>
                	<c:when test="${empty orders}">
                    	<div class="alert alert-info text-center">
                        	<i class="fas fa-info-circle"></i> Bạn chưa có giao dịch nào.
                    	</div>
                	</c:when>
                	<c:otherwise>
                    	<table class="table table-hover">
                        	<thead class="table-dark">
                            	<tr>
                                	<th>Mã đơn</th>
                                	<th>Ngày mua</th>
                                	<th>Tổng tiền</th>
                                	<th>Trạng thái</th>
                            	</tr>
                        	</thead>
                        	<tbody>
                            	<c:forEach var="o" items="${orders}">
                                	<tr>
                                    	<td>#${o.id}</td>
                                    	<td><fmt:formatDate value="${o.orderDate}" pattern="dd-MM-yyyy HH:mm"/></td>
                                    	<td class="fw-bold text-success">$${o.totalPrice}</td>
                                    	<td>
                                        	<span class="badge ${o.status == 'success' ? 'bg-success' : 'bg-warning text-dark'}">
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
	
    <%@include file="./footer.jsp"%>

</body>
</html>