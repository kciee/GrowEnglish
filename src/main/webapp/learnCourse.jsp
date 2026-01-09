<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Học: ${course.name}</title> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
            background-color: #f8f9fa; 
            font-family: 'Segoe UI', sans-serif; 
            overflow: hidden;
        }
        
        .sidebar-lessons {
            height: calc(100vh - 60px);
            overflow-y: auto;
            background: white;
            border-left: 1px solid #ddd;
        }
        
        .main-content {
            height: calc(100vh - 60px);
            overflow-y: auto;
        }

        .lesson-item {
            cursor: pointer;
            transition: 0.2s;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .lesson-item:hover { 
            background-color: #f1f3f5; 
        }
        
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
        
        ::-webkit-scrollbar { 
        	width: 8px; 
        }
        
        ::-webkit-scrollbar-track { 
        	background: #f1f1f1; 
        }
        
        ::-webkit-scrollbar-thumb { 
        	background: #888; 
        	border-radius: 4px; 
        }
        
        ::-webkit-scrollbar-thumb:hover { 
        	background: #555; 
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light bg-white shadow-sm px-4" style="height: 60px; z-index: 1000;">
    <a class="navbar-brand fw-bold text-secondary" href="home" style="font-size: 16px;">
        <i class="fas fa-chevron-left me-2"></i> Quay lại trang chủ
    </a>
    <span class="fw-bold text-primary text-truncate ms-3" style="max-width: 70%;">${course.name}</span>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-9 p-4 main-content">
            <c:if test="${not empty currentLesson}">
                <div class="video-container shadow mb-4">
                    <iframe src="${currentLesson.videoUrl}" frameborder="0" allowfullscreen></iframe>
                </div>

                <h3 class="fw-bold text-dark mb-3">Bài ${currentLesson.orderIndex}: ${currentLesson.title}</h3>
                
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase fw-bold mb-3">
                            <i class="fas fa-book-open me-2"></i>Nội dung bài học
                        </h6>
                        <div style="white-space: pre-line; line-height: 1.6; color: #333;">${currentLesson.content}</div>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty currentLesson}">
                <div class="d-flex flex-column justify-content-center align-items-center h-75 text-muted">
                    <i class="fas fa-video-slash fa-3x mb-3"></i>
                    <h4>Khóa học này đang được cập nhật nội dung.</h4>
                    <p>Vui lòng quay lại sau!</p>
                </div>
            </c:if>
        </div>

        <div class="col-md-3 sidebar-lessons p-0 shadow-sm">
            <div class="p-3 bg-light border-bottom fw-bold text-uppercase text-secondary" style="position: sticky; top: 0; z-index: 10;">
                <i class="fas fa-list me-2"></i> Danh sách bài học
            </div>
            
            <c:forEach var="l" items="${lessons}">
                <a href="learn?courseId=${course.id}&lessonId=${l.id}" class="text-decoration-none text-dark">
                    <div class="p-3 lesson-item ${l.id == currentLesson.id ? 'active' : ''}">
                        <div class="d-flex align-items-start">
                            <div class="me-3 mt-1">
                                <c:choose>
                                    <c:when test="${l.id == currentLesson.id}">
                                         <i class="fas fa-play-circle text-warning fs-5"></i>
                                    </c:when>
                                    <c:otherwise>
                                         <i class="far fa-circle text-secondary fs-6"></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div>
                                <div class="fw-bold small text-muted">Bài ${l.orderIndex}</div>
                                <div class="fw-semibold" style="font-size: 15px;">${l.title}</div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>