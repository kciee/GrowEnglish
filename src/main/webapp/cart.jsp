<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <div class="main-content">
        <div class="container">
            <h2 class="fw-bold mb-4">Giỏ hàng của bạn</h2>
            
            <div class="cart-toolbar">
                <div class="label_sanpham" style="margin-left: 55px">Mã Sản Phẩm</div>
                <div class="label_price">Tên Sản Phẩm</div>
                <div class="label-total_price">Giá</div>
            </div>

            <div class="cart-list-product bg-white rounded shadow-sm p-3">
                <c:forEach var="paidDocument" items="${paidDocuments}">
                    <div class="cart-list-product_item border-bottom py-3">
                        <div class="label_sanpham">#DOC-${paidDocument.id}</div>
                        <div class="label_price">${paidDocument.title}</div>
                        <div class="label_quantity text-warning fw-bold">$${paidDocument.price}</div>
                    </div>
                </c:forEach>

                <c:if test="${not empty sessionScope.cartCourses}">
                    <c:forEach var="course" items="${sessionScope.cartCourses}">
                        <div class="cart-list-product_item border-bottom py-3">
                            <div class="label_sanpham">#CRS-${course.id}</div>
                            <div class="label_price fw-bold">[Khóa học] ${course.name}</div>
                            <div class="label_quantity text-warning fw-bold">$${course.price}</div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty paidDocuments and empty sessionScope.cartCourses}">
                    <div class="text-center py-5 text-muted">Giỏ hàng trống</div>
                </c:if>
            </div>

            <c:if test="${not empty paidDocuments or not empty sessionScope.cartCourses}">
                <form action="${pageContext.request.contextPath}/checkout" method="POST" class="text-center pb-5">
                    <button type="submit" class="checkout-btn">Thanh Toán</button>
                </form>
            </c:if>
        </div>
    </div>

    <%@include file="./footer.jsp"%>

</body>
</html>