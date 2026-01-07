<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Học: ${course.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', sans-serif; }
        .sidebar-lessons {
            height: calc(100vh - 80px);
            overflow-y: auto;
            background: white;
            border-left: 1px solid #ddd;
        }
        .lesson-item {
            cursor: pointer;
            transition: 0.2s;
            border-bottom: 1px solid #f0f0f0;
        }
        .lesson-item:hover { background-color: #f1f3f5; }
        .lesson-item.active {
            background-color: #e9ecef;
            border-left: 4px solid #ffc107;
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            background: #000;
            border-radius: 8px;
        }
        .video-container iframe {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light bg-white shadow-sm px-4" style="height: 60px;">
    <a class="navbar-brand fw-bold" href="home">
        <i class="fas fa-chevron-left me-2"></i> Quay lại trang chủ
    </a>
    <span class="fw-bold text-primary">${course.name}</span>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-9 p-4" style="height: calc(100vh - 60px); overflow-y: auto;">
            <c:if test="${not empty currentLesson}">
                <div class="video-container shadow mb-4">
                    <iframe src="${currentLesson.videoUrl}" frameborder="0" allowfullscreen></iframe>
                </div>

                <h3 class="fw-bold">${currentLesson.title}</h3>
                <hr>
                <div class="bg-white p-4 rounded shadow-sm">
                    <h5 class="text-muted mb-3">Nội dung bài học</h5>
                    <p>${currentLesson.content}</p>
                </div>
            </c:if>

            <c:if test="${empty currentLesson}">
                <div class="alert alert-warning text-center mt-5">
                    Khóa học này chưa cập nhật bài giảng. Vui lòng quay lại sau!
                </div>
            </c:if>
        </div>

        <div class="col-md-3 sidebar-lessons p-0">
            <div class="p-3 bg-light border-bottom fw-bold text-uppercase">
                Danh sách bài học
            </div>
            
            <c:forEach var="l" items="${lessons}">
                <a href="learn-course?id=${course.id}&lessonId=${l.id}" class="text-decoration-none text-dark">
                    <div class="p-3 lesson-item ${l.id == currentLesson.id ? 'active' : ''}">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-play-circle text-warning me-3 fs-5"></i>
                            <div>
                                <div class="fw-bold small">Bài ${l.orderIndex}</div>
                                <div class="small">${l.title}</div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>