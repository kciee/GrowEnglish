<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${docInfo.title} | Nội dung VIP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', sans-serif; }
        .main-content {
            margin-left: 90px;
            padding: 40px;
            min-height: 100vh;
        }
        .doc-header {
            background: linear-gradient(135deg, #fb9400, #ff5e62);
            color: white;
            padding: 40px;
            border-radius: 15px;
            margin-bottom: 30px;
        }
        .content-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            font-size: 1.1rem;
            line-height: 1.8;
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            border-radius: 10px;
            margin-bottom: 30px;
            background: #000;
        }
        .video-container iframe {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%;
        }
    </style>
</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="container">
            <div class="doc-header shadow">
                <a href="learningDocuments" class="text-white text-decoration-none mb-3 d-inline-block">
                    <i class="fas fa-arrow-left"></i> Quay lại kho tài liệu
                </a>
                <h1 class="fw-bold">${docInfo.title}</h1>
                <p class="opacity-75"><i class="fas fa-crown text-warning"></i> Tài liệu cao cấp</p>
            </div>

            <div class="content-box">
                <c:choose>
                    <c:when test="${not empty docDetail}">
                        
                        <c:if test="${not empty docDetail.videoUrl}">
                            <div class="video-container shadow">
                                <iframe src="${docDetail.videoUrl}" frameborder="0" allowfullscreen></iframe>
                            </div>
                            <h4 class="fw-bold mb-3">Nội dung bài học:</h4>
                        </c:if>

                        <div class="doc-content">
                            ${docDetail.content}
                        </div>

                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <img src="assets/images/empty.svg" width="150" alt="Updating">
                            <h4 class="text-muted mt-3">Nội dung đang được cập nhật...</h4>
                            <p>Vui lòng quay lại sau!</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

</body>
</html>