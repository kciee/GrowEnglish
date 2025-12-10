<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
>>>>>>> e18aefb (update)
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grow English Home</title>
<<<<<<< HEAD
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    <style>
=======
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    <style>
        /* Tùy chỉnh giao diện */
>>>>>>> e18aefb (update)
        body, html {
            margin: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }
<<<<<<< HEAD
        .container-fluid {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
            width: 100%;
        }
=======

        .container-fluid {
            display: flex;
            flex-direction: row; /* Sidebar và nội dung chính nằm ngang */
            min-height: 100vh;
            width: 100%;
        }

>>>>>>> e18aefb (update)
        .main-content {
            margin-left: 300px;
            padding-top: 80px;
            width: 100%;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .logo {
            font-weight: bold;
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .menu-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 25px 0;
            text-decoration: none;
            color: black;
        }
<<<<<<< HEAD
        .menu-item:hover {
            color: #ff9800;
        }
=======

        .menu-item:hover {
            color: #ff9800;
        }

>>>>>>> e18aefb (update)
        .active {
            background-color: #ff9800;
            color: white;
            border-radius: 8px;
            padding: 10px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .button {
            background: #fb9400;
            border-radius: 50px;
            padding: 10px 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
<<<<<<< HEAD
        .carousel-item {
            background-color: transparent;
        }

        .carousel-inner {
            background-color: transparent;
        }
=======

        .carousel-item {
            background-color: transparent; /* Xóa nền mặc định */
        }

        .carousel-inner {
            background-color: transparent; /* Xóa nền của container Carousel */
        }

>>>>>>> e18aefb (update)
        .carousel-item img {
            width: 100%;
            height: auto;
            display: block;
        }
<<<<<<< HEAD
        .container-fluid.p-0 {
            margin-left: 120px;
        }
        .container {
            margin-left: 120px;
        }
=======

        .container-fluid.p-0 {
            margin-left: 120px; /* Dịch chuyển container sang phải */
        }

        .container {
            margin-left: 120px;
        }

>>>>>>> e18aefb (update)
        .frame-70 {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 334px;
            padding: 140px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .rectangle-170 {
            width: 40%;
            max-width: 400px;
            border-radius: 48px;
            object-fit: cover;
        }
<<<<<<< HEAD
        .feature-section, .feature-section * {
            box-sizing: border-box;
        }
        .feature-section {
            margin-top: -450px;
            height: 177px;
            position: relative;
        }
        .feature-item {
            width: 12.4%;
            height: 100%;
            position: absolute;
        }
        .feature-background {
            background: #f3f3f3;
            border-radius: 50%;
            width: 64%;
            height: 45.5%;
=======

        /* Đặt lại box-sizing cho toàn bộ phần tử */
        .feature-section, .feature-section * {
            box-sizing: border-box;
        }

        /* Vùng chứa chính */
        .feature-section {
            margin-top: -450px;
            height: 177px; /* Giảm 20% từ 222px */
            position: relative;
        }

        /* Mỗi khối tính năng */
        .feature-item {
            width: 12.4%; /* Giảm 20% từ 15.5% */
            height: 100%;
            position: absolute;
        }

        /* Hình tròn nền */
        .feature-background {
            background: #f3f3f3;
            border-radius: 50%;
            width: 64%; /* Giảm 20% từ 80% */
            height: 45.5%; /* Giảm 20% từ 57% */
>>>>>>> e18aefb (update)
            position: absolute;
            top: 0;
            left: 18%;
        }
<<<<<<< HEAD
        .feature-icon img {
            width: 22.8%;
            height: 16.3%;
=======

        /* Icon của tính năng */
        .feature-icon img {
            width: 22.8%; /* Giảm 20% từ 28.5% */
            height: 16.3%; /* Giảm 20% từ 20.34% */
>>>>>>> e18aefb (update)
            position: absolute;
            top: 15%;
            left: 38%;
            overflow: visible;
        }
<<<<<<< HEAD
=======

        /* Văn bản mô tả tính năng */
>>>>>>> e18aefb (update)
        .feature-text {
            color: #7b7d81;
            text-align: center;
            font-family: "Roboto-Regular", sans-serif;
<<<<<<< HEAD
            font-size: 16px;
            line-height: 28px;
=======
            font-size: 16px; /* Giảm 20% từ 16px */
            line-height: 28px; /* Giảm 20% từ 28px */
>>>>>>> e18aefb (update)
            font-weight: 400;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
<<<<<<< HEAD
        #carouselExampleControlsNoTouching {
            display: block;
            position: relative;
=======

        #carouselExampleControlsNoTouching {
            display: block;
            position: relative;
            /*left: 10px;*/
>>>>>>> e18aefb (update)
            height: 400px;
            width: 80%;
            margin-left: 130px;
            position: relative;
        }
    </style>
</head>
<body>
<<<<<<< HEAD
<jsp:include page="menu.jsp"></jsp:include>
<div class="container-fluid">
=======
<!-- Sidebar -->
<jsp:include page="menu.jsp"></jsp:include>
<div class="container-fluid">
    <!-- Nội dung chính -->
    <!-- Banner Section -->
>>>>>>> e18aefb (update)
    <div class="main-content">
        <div id="carouselExampleControlsNoTouching" class="carousel slide"
             data-bs-touch="false">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="assets/images/banner1.png" class="d-block w-100"
                         alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assets/images/banner2.png" class="d-block w-100"
                         alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assets/images/banner3.png" class="d-block w-100"
                         alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleControlsNoTouching"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleControlsNoTouching"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <div class="frame-70" style="">
            <div class="null">
                <h2>About us</h2>
                <p>G-Easy is a promising and rapidly growing educational
                    technology startup in Vietnam. It is an English learning software
                    from basic to advanced to help learners easily approach English.
                    It currently has more than 13 million users in 101 countries
                    around the world, and has offices in Portugal, Vietnam, India,
                    Indonesia, and Japan.</p>
<<<<<<< HEAD
                <a href="signup.jsp" class="btn btn-warning btn-lg">Xem chi tiết</a>
=======
                <a href="signup.jsp" class="btn btn-warning btn-lg">Xem chi
                    tiết</a>
>>>>>>> e18aefb (update)
            </div>
            <img class="rectangle-170" src="assets/images/Rectangle 170.png"
                 alt="About Us Image">
        </div>
        <div class="container-fluid p-0">
            <div class="d-flex flex-column justify-content-center text-center"
                 style="margin-top: -500px;">
                <div class="logo">Grow English</div>
                <div class="font-weight-bold">Lorem ipsum dolor sit amet,
                    consectetuer adipiscing elit, sed diam nonummy nibh euismod
                    tincidunt ut laoreet dolore magna aliquam erat volutpat.
                </div>
            </div>
        </div>
        <div class="feature-section">
<<<<<<< HEAD
=======
            <!-- Tính năng 1: Tài liệu Miễn phí -->
>>>>>>> e18aefb (update)
            <a href="FreeDocument">
                <div class="feature-item" style="left: 10%;">
                    <div class="feature-text">
                        Tài liệu<br/>Miễn phí
                    </div>
                    <div class="feature-background"></div>
                    <div class="feature-icon">
                        <img src="assets/images/Icon/tai lieu mien phi.svg" alt="Tài liệu miễn phí"/>
                    </div>
                </div>
            </a>
<<<<<<< HEAD
=======

            <!-- Tính năng 2: Tài liệu Trả phí -->
>>>>>>> e18aefb (update)
            <a href="PaidDocument">
                <div class="feature-item" style="left: 28.63%;">
                    <div class="feature-text">
                        Tài liệu<br/>Trả phí
                    </div>
                    <div class="feature-background"></div>
                    <div class="feature-icon">
                        <img src="assets/images/Icon/tai lieu tra phi.svg" alt="Tài liệu trả phí"/>
                    </div>
                </div>
            </a>
<<<<<<< HEAD
=======

            <!-- Tính năng 3: Khóa học Online -->
>>>>>>> e18aefb (update)
            <a href="courses">
                <div class="feature-item" style="left: 47.26%;">
                    <div class="feature-text">
                        Khóa học<br/>Online
                    </div>
                    <div class="feature-background"></div>
                    <div class="feature-icon">
                        <img src="assets/images/Icon/khoa hoc online.svg" alt="Khóa học Online"/>
                    </div>
                </div>
            </a>
<<<<<<< HEAD
=======

            <!-- Tính năng 4: Quản lý Tài khoản -->
>>>>>>> e18aefb (update)
            <a href="profile.jsp">
                <div class="feature-item" style="left: 65.89%;">
                    <div class="feature-text">
                        Quản lý<br/>Tài khoản
                    </div>
                    <div class="feature-background"></div>
                    <div class="feature-icon">
                        <img src="assets/images/Icon/quan ly tai khoan.svg" alt="Quản lý tài khoản"/>
                    </div>
                </div>
            </a>
<<<<<<< HEAD
=======

            <!-- Tính năng 5: Tư vấn Miễn phí -->
>>>>>>> e18aefb (update)
            <a href="chat.jsp">
                <div class="feature-item" style="left: 84.54%;">
                    <div class="feature-text">
                        Tư vấn<br/>Miễn phí
                    </div>
                    <div class="feature-background"></div>
                    <div class="feature-icon">
                        <img src="assets/images/Icon/Chat.svg" alt="Tư vấn miễn phí"/>
                    </div>
                </div>
            </a>
        </div>
<<<<<<< HEAD
        <div class="frame-70">
            <div class="null">
                <h2>Làm bài kiểm tra thử</h2>
                <p>G-Easy helps you check your English level from there to have a good orientation for yourself</p>
                <a href="quizList" class="btn btn-warning btn-lg">Xem chi tiết</a>
=======

        <div class="frame-70">
            <div class="null">
                <h2>Làm bài kiểm tra thử</h2>
                <p>G-Easy helps you check your English level from there to have
                    a good orientation for yourself</p>
                <a href="quizList" class="btn btn-warning btn-lg">Xem chi
                    tiết</a>
>>>>>>> e18aefb (update)
            </div>
            <img class="rectangle-170" src="assets/images/Rectangle 170.png"
                 alt="About Us Image">
        </div>
<<<<<<< HEAD
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
=======


    </div>
</div>

<!-- Footer Section -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Bootstrap JS -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
>>>>>>> e18aefb (update)
</body>
</html>
