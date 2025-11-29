<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    <style>
        .main-content {
            margin-left: 350px;
            padding-top: 50px;
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
<%@include file="./menu.jsp" %>
<body>
<div class="main-content">
    <div class="container">
        <div class="cart-toolbar">
            <div class="label_sanpham" style="margin-left: 55px">Mã Sản Phẩm</div>
            <div class="label_price">Tên Sản Phẩm</div>
            <div class="label-total_price">Giá</div>
        </div>

        <div class="cart-list-product">
            <c:forEach var="paidDocument" items="${paidDocuments}">
                <div class="cart-list-product_item">
                    <div class="label_sanpham" style="color: #1e1f22">#DOC-${paidDocument.id}</div>
                    <div class="label_price" style="color: #1e1f22">${paidDocument.title}</div>
                    <div class="label_quantity" style="color: #FF6A00">$${paidDocument.price}</div>
                </div>
            </c:forEach>

            <c:if test="${not empty sessionScope.cartCourses}">
                <c:forEach var="course" items="${sessionScope.cartCourses}">
                    <div class="cart-list-product_item">
                        <div class="label_sanpham" style="color: #1e1f22">#CRS-${course.id}</div>
                        
                        <div class="label_price" style="color: #1e1f22; font-weight: bold;">
                            [Khóa học] ${course.name}
                        </div>
                        
                        <div class="label_quantity" style="color: #FF6A00">$${course.price}</div>
                    </div>
                </c:forEach>
            </c:if>
            
            <c:if test="${empty paidDocuments and empty sessionScope.cartCourses}">
                <div style="text-align: center; padding: 20px; color: #777;">
                    Giỏ hàng đang trống.
                </div>
            </c:if>
        </div>

        <c:if test="${not empty paidDocuments or not empty sessionScope.cartCourses}">
            <form action="${pageContext.request.contextPath}/checkout" method="POST" style="text-align: center;">
                <button type="submit" class="checkout-btn">Thanh Toán</button>
            </form>
        </c:if>
    </div>
</div>
</body>
<%@include file="./footer.jsp" %>
</html>