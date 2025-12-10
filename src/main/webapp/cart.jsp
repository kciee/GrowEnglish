<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    
    <style>
        /* 2. CẤU HÌNH LAYOUT CHUẨN (GIỐNG HỆT courseList.jsp) */
        body { 
            background-color: #f9f9f9; 
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            margin-left: 350px; /* QUAN TRỌNG: Né menu 350px */
            width: calc(100% - 350px);
            padding: 40px 60px;
            flex: 1; /* Đẩy footer xuống đáy */
        }

        /* 3. LÀM ĐẸP BẢNG GIỎ HÀNG */
        .cart-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            padding: 30px;
        }

        .cart-header {
            font-weight: bold;
            color: #666;
            border-bottom: 2px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .cart-item:last-child { border-bottom: none; }

        .item-code { width: 20%; color: #888; font-size: 0.9rem; }
        .item-name { width: 60%; font-weight: 600; color: #333; }
        .item-price { width: 20%; color: #fb9400; font-weight: bold; text-align: right; }

        /* Nút thanh toán đẹp */
        .checkout-btn {
            background-color: #fb9400;
            color: white;
            padding: 12px 40px;
            border: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            display: block;
            margin: 30px auto 0;
            width: fit-content;
        }
        .checkout-btn:hover { background-color: #e08600; color: white; }
    </style>
</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <h2 class="fw-bold mb-4 text-dark">Giỏ hàng của bạn</h2>

        <div class="cart-container">
            <div class="cart-header d-flex">
                <div style="width: 20%">Mã</div>
                <div style="width: 60%">Sản phẩm</div>
                <div style="width: 20%; text-align: right;">Giá</div>
            </div>

            <c:set var="total" value="0" />
            
            <c:forEach var="doc" items="${paidDocuments}">
                <div class="cart-item">
                    <div class="item-code">#DOC-${doc.id}</div>
                    <div class="item-name">${doc.title}</div>
                    <div class="item-price">$${doc.price}</div>
                </div>
                <c:set var="total" value="${total + doc.price}" />
            </c:forEach>

            <c:if test="${not empty sessionScope.cartCourses}">
                <c:forEach var="course" items="${sessionScope.cartCourses}">
                    <div class="cart-item">
                        <div class="item-code">#CRS-${course.id}</div>
                        <div class="item-name text-primary">[Khóa học] ${course.name}</div>
                        <div class="item-price">$${course.price}</div>
                    </div>
                    <c:set var="total" value="${total + course.price}" />
                </c:forEach>
            </c:if>

            <c:if test="${empty paidDocuments and empty sessionScope.cartCourses}">
                <div class="text-center py-5 text-muted">
                    <i class="fas fa-shopping-cart fa-3x mb-3 text-secondary"></i>
                    <p>Giỏ hàng của bạn đang trống.</p>
                    <a href="${pageContext.request.contextPath}/courses" class="btn btn-outline-warning rounded-pill">Xem khóa học</a>
                </div>
            </c:if>
            
            <c:if test="${not empty paidDocuments or not empty sessionScope.cartCourses}">
                <div class="text-end mt-4 pt-3 border-top">
                    <h4>Tổng cộng: <span class="text-danger fw-bold">$${total}</span></h4>
                </div>
            </c:if>
        </div>

        <c:if test="${not empty paidDocuments or not empty sessionScope.cartCourses}">
            <form action="${pageContext.request.contextPath}/checkout" method="POST">
                <button type="submit" class="checkout-btn">
                    <i class="fas fa-credit-card me-2"></i> Thanh toán ngay
                </button>
            </form>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>