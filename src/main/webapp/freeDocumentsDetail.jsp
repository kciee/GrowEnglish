<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết tài liệu</title>
<<<<<<< HEAD
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
=======
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Tùy chỉnh giao diện */
>>>>>>> e18aefb (update)
        .primary-btn {
            background-color: #fb9400 !important;
            color: white;
            font-weight: bold;
            border-radius: 50px;
            padding: 10px 24px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .main-content {
            margin-left: 350px;
            padding-top: 50px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .header-image img {
            width: 100%;
            height: 300px;
            position: relative;
            overflow: hidden;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .content-detail {
            padding: 20px;
            background-color: #f8f9fa;
            margin-top: 30px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<<<<<<< HEAD
<div class="main-content">
=======

<!-- Nội dung chính -->
<div class="main-content">
    <!-- Header Banner -->
>>>>>>> e18aefb (update)
    <section class="header-section">
        <div class="header-content">
            <div class="header-image">
                <img src="assets/images/banner1.png" alt="Student Image">
            </div>
        </div>
    </section>
<<<<<<< HEAD
=======

    <!-- Chi tiết tài liệu -->
>>>>>>> e18aefb (update)
    <div class="container mt-5">
        <c:if test="${not empty documentDetail}">
            <div>
                <p>${documentDetail.content}</p>
            </div>
        </c:if>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <c:if test="${empty documentDetail}">
            <div>
                <p>Không tìm thấy chi tiết tài liệu.</p>
            </div>
        </c:if>
<<<<<<< HEAD
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
=======

    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Bootstrap JS -->
>>>>>>> e18aefb (update)
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
