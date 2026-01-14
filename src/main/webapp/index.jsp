<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grow English Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/BodyTraCuu.css">
    <style>
        body, html {
            margin: 0;
            height: 100%;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #fdfdfd;
        }
        .container-fluid {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
            width: 100%;
        }
        .main-content {
            margin-left: 90px;
            width: calc(100% - 90px);
        }
        
        #heroCarousel {
            width: 90%;
            margin: 80px auto 30px auto;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        .carousel-item {
            height: 500px;
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .carousel-overlay {
            position: absolute;
            top: 0; left: 0; 
            width: 100%; 
            height: 100%;
            background: linear-gradient(to right, rgba(0,0,0,0.7), rgba(0,0,0,0.2));
        }
        .carousel-caption {
            top: 50%;
            transform: translateY(-50%);
            bottom: initial;
            text-align: left;
            left: 8%;
            max-width: 600px;
        }
        .carousel-caption h1 {
            font-size: 3.5rem;
            font-weight: 800;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
        }
        .carousel-item.active {
            animation: kenburns 20s infinite alternate;
        }
        @keyframes kenburns {
            from { transform: scale(1); }
            to { transform: scale(1.1); }
        }

        .frame-70 {
            display: flex; 
            align-items: center; 
            justify-content: space-between;
            height: auto; 
            padding: 80px 140px;
        }
        .rectangle-170 {
            width: 40%; 
            max-width: 400px; 
            border-radius: 48px; 
            object-fit: cover;
        }

        .stats-section {
            padding: 60px 0;
            background: #fff;
            margin: 50px 0;
        }
        .stat-item {
            text-align: center;
        }
        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            color: #fb9400;
            display: block;
            margin-bottom: 5px;
        }
        .stat-label {
            font-size: 1.1rem;
            color: #7b7d81;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .testimonial-section {
            padding: 80px 0;
            background-color: #f8f9fa;
        }
        
        .testimonial-card {
            background: white;
            border: none;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            height: 100%;
            transition: 0.3s;
        }
        
        .testimonial-card:hover {
            transform: translateY(-10px);
        }
        
        .student-img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 3px solid #fb9400;
        }
        
        .quote-icon {
            color: #fb9400;
            font-size: 2rem;
            opacity: 0.2;
            margin-bottom: 15px;
        }

        .feature-section {
            margin-top: 50px; 
            height: 177px; 
            position: relative; 
            width: 100%;
        }
        .feature-item {
            width: 12.4%; 
            height: 100%; 
            position: absolute; 
            transition: 0.3s;
        }
        
        .feature-item:hover { 
        	transform: translateY(-10px); 
        }
        
        .feature-background {
            background: #f3f3f3; 
            border-radius: 50%; 
            width: 64%; 
            height: 45.5%;
            position: absolute; 
            top: 0; 
            left: 18%;
        }
        
        .feature-icon img {
            width: 22.8%; 
            height: 16.3%; 
            position: absolute; 
            top: 15%; 
            left: 38%;
        }
        
        .feature-text {
            color: #7b7d81; 
            text-align: center; 
            font-size: 16px; 
            font-weight: 400;
            position: absolute; 
            bottom: 0; 
            width: 100%;
        }
        
        .logo-title {
            font-weight: bold; 
            font-size: 2.5rem; 
            margin-top: 80px; 
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="container-fluid">
    <div class="main-content">
        
        <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" style="background-image: url('assets/images/banner1.png');">
                    <div class="carousel-overlay"></div>
                    <div class="carousel-caption">
                        <h1 class="animate__animated animate__fadeInDown">Chinh Phục Tiếng Anh</h1>
                        <p class="fs-4 animate__animated animate__fadeInUp animate__delay-1s">Học tập bài bản với lộ trình từ cơ bản đến nâng cao.</p>
                        <a href="courses" class="btn btn-warning btn-lg rounded-pill px-5 fw-bold animate__animated animate__zoomIn animate__delay-2s shadow">Học ngay</a>
                    </div>
                </div>
                <div class="carousel-item" style="background-image: url('assets/images/banner2.png');">
                    <div class="carousel-overlay"></div>
                    <div class="carousel-caption">
                        <h1 class="animate__animated animate__backInLeft text-warning">Kho Tài Liệu VIP</h1>
                        <p class="fs-4 animate__animated animate__fadeInLeft animate__delay-1s">Hơn 500+ tài liệu chuyên sâu dành cho bạn.</p>
                        <a href="PaidDocument" class="btn btn-light btn-lg rounded-pill px-5 fw-bold animate__animated animate__fadeInUp animate__delay-2s">Khám phá kho</a>
                    </div>
                </div>
                <div class="carousel-item" style="background-image: url('assets/images/banner3.png');">
                    <div class="carousel-overlay"></div>
                    <div class="carousel-caption">
                        <h1 class="animate__animated animate__fadeInRight">Luyện Thi Thử</h1>
                        <p class="fs-4 animate__animated animate__fadeInRight animate__delay-1s">Đánh giá năng lực của bạn hoàn toàn miễn phí.</p>
                        <a href="quizList" class="btn btn-warning btn-lg rounded-pill px-5 fw-bold animate__animated animate__bounceInUp animate__delay-2s">Làm bài ngay</a>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <div class="frame-70">
            <div class="null" style="max-width: 50%;">
                <h2 class="fw-bold text-dark border-bottom border-warning border-3 d-inline-block pb-2 mb-4">About us</h2>
                <p class="text-muted fs-5">G-Easy is a promising and rapidly growing educational technology startup in Vietnam. It is an English learning software from basic to advanced to help learners easily approach English.</p>
                <a href="signup.jsp" class="btn btn-outline-warning rounded-pill px-4 mt-3">Xem chi tiết</a>
            </div>
            <img class="rectangle-170 shadow" src="assets/images/Rectangle 170.png" alt="About Us Image">
        </div>

        <div class="container-fluid p-0 text-center">
            <div class="logo-title">Grow English</div>
            
            <div class="mx-auto text-muted mb-4" style="max-width: 700px;">Hệ thống học tiếng Anh hàng đầu dành cho cộng đồng người Việt toàn cầu.</div>
        </div>

        <div class="stats-section">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-3">
                        <div class="stat-item">
                            <span class="stat-number" data-target="1500">0</span>
                            <span class="stat-label">Học viên tích cực</span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item">
                            <span class="stat-number" data-target="500">0</span>
                            <span class="stat-label">Tài liệu chuyên sâu</span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item">
                            <span class="stat-number" data-target="120">0</span>
                            <span class="stat-label">Khóa học Online</span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item">
                            <span class="stat-number" data-target="98">0</span>
                            <span class="stat-label">% Hài lòng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="feature-section">
            <a href="FreeDocument">
                <div class="feature-item" style="left: 10%;">
                    <div class="feature-text">Tài liệu<br/>Miễn phí</div>
                    <div class="feature-background"></div>
                    <div class="feature-icon"><img src="assets/images/Icon/tai lieu mien phi.svg" alt="Tài liệu miễn phí"/></div>
                </div>
            </a>
            <a href="PaidDocument">
                <div class="feature-item" style="left: 28.63%;">
                    <div class="feature-text">Tài liệu<br/>Trả phí</div>
                    <div class="feature-background"></div>
                    <div class="feature-icon"><img src="assets/images/Icon/tai lieu tra phi.svg" alt="Tài liệu trả phí"/></div>
                </div>
            </a>
            <a href="courses">
                <div class="feature-item" style="left: 47.26%;">
                    <div class="feature-text">Khóa học<br/>Online</div>
                    <div class="feature-background"></div>
                    <div class="feature-icon"><img src="assets/images/Icon/khoa hoc online.svg" alt="Khóa học Online"/></div>
                </div>
            </a>
            <a href="profile.jsp">
                <div class="feature-item" style="left: 65.89%;">
                    <div class="feature-text">Quản lý<br/>Tài khoản</div>
                    <div class="feature-background"></div>
                    <div class="feature-icon"><img src="assets/images/Icon/quan ly tai khoan.svg" alt="Quản lý tài khoản"/></div>
                </div>
            </a>
            <a href="chat.jsp">
                <div class="feature-item" style="left: 84.54%;">
                    <div class="feature-text">Tư vấn<br/>Miễn phí</div>
                    <div class="feature-background"></div>
                    <div class="feature-icon"><img src="assets/images/Icon/Chat.svg" alt="Tư vấn miễn phí"/></div>
                </div>
            </a>
        </div>

        <div class="testimonial-section mt-5">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold">Học viên nói gì về Grow English?</h2>
                    <p class="text-muted">Sự thành công của bạn là niềm tự hào của chúng tôi</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left quote-icon"></i>
                            <p class="text-muted italic">"Lộ trình học rất rõ ràng, tôi đã cải thiện được kỹ năng giao tiếp chỉ sau 3 tháng học khóa Online."</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="https://i.pravatar.cc/150?u=1" class="student-img me-3">
                                <div>
                                    <h6 class="fw-bold mb-0">Nguyễn Văn An</h6>
                                    <small class="text-warning"><i class="fas fa-star"></i> 5.0</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left quote-icon"></i>
                            <p class="text-muted">"Kho tài liệu VIP cực kỳ hữu ích cho công việc của mình. Các bài thi thử sát với thực tế đề thi TOEIC."</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="https://i.pravatar.cc/150?u=2" class="student-img me-3">
                                <div>
                                    <h6 class="fw-bold mb-0">Trần Thị Bình</h6>
                                    <small class="text-warning"><i class="fas fa-star"></i> 4.8</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left quote-icon"></i>
                            <p class="text-muted">"Giao diện dễ sử dụng, đội ngũ tư vấn nhiệt tình. Rất đáng để đầu tư cho việc học tiếng Anh."</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="https://i.pravatar.cc/150?u=3" class="student-img me-3">
                                <div>
                                    <h6 class="fw-bold mb-0">Lê Minh Tâm</h6>
                                    <small class="text-warning"><i class="fas fa-star"></i> 5.0</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="frame-70">
            <div class="null" style="max-width: 50%;">
                <h2 class="fw-bold text-dark mb-4">Làm bài kiểm tra thử</h2>
                <p class="text-muted fs-5">G-Easy helps you check your English level from there to have a good orientation for yourself.</p>
                <a href="quizList" class="btn btn-warning btn-lg rounded-pill px-5 shadow">Làm ngay</a>
            </div>
            <img class="rectangle-170 shadow" src="assets/images/Rectangle 170.png" alt="Quiz Image">
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function animateCounters() {
        const counters = document.querySelectorAll('.stat-number');
        const speed = 200; 
        counters.forEach(counter => {
            const updateCount = () => {
                const target = +counter.getAttribute('data-target');
                const count = +counter.innerText;
                const inc = target / speed;
                if (count < target) {
                    counter.innerText = Math.ceil(count + inc);
                    setTimeout(updateCount, 15);
                } else {
                    counter.innerText = target + (counter.parentElement.innerText.includes('%') ? '' : '+');
                }
            };
            updateCount();
        });
    }
    let started = false;
    window.addEventListener('scroll', () => {
        const statsSection = document.querySelector('.stats-section');
        if (statsSection) {
            const rect = statsSection.getBoundingClientRect();
            if (rect.top < window.innerHeight && rect.bottom >= 0 && !started) {
                animateCounters();
                started = true;
            }
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>