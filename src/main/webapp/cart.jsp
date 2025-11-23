<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tra cứu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    <style>
        .main-content {
            margin-left: 350px;
            padding-top: 50px;
        }
    </style>
</head>
<%@include file="./menu.jsp" %>
<body>
<div class="main-content">
    <div class="container">
        <div class="cart-toolbar">
            <div class="label_sanpham" style="margin-left: 55px">Mã Khóa Học</div>
            <div class="label_price">Tên Khóa Học</div>
            <div class="label-total_price">Giá</div>
        </div>
        <div class="cart-list-product">
            <c:forEach var="paidDocument" items="${paidDocuments}">
                <div class="cart-list-product_item">
                    <div class="label_sanpham" style="color: #1e1f22">${paidDocument.id}</div>
                    <div class="label_price" style="color: #1e1f22">${paidDocument.title}</div>
                    <div class="label_quantity" style="color: #1e1f22">${paidDocument.price}</div>
                </div>
            </c:forEach>
        </div>
		<form action="${pageContext.request.contextPath}/checkout" method="POST" style="text-align: center;">
		    <button type="submit" class="checkout-btn" style="margin-left: 0;">Thanh Toán</button>
		</form>   
		</div>
</div>
</body>
<%@include file="./footer.jsp" %>
</html>
