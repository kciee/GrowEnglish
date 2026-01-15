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
        body { 
        	background-color: #f0f2f5; 
        	font-family: 'Segoe UI', sans-serif; 
        }
        
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
            position: absolute; 
            top: 0; 
            left: 0; 
            width: 100%; 
            height: 100%;
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
						<div class="mt-5 p-4 bg-white rounded shadow-sm">
					    <h4 class="fw-bold mb-4">Đánh giá & Bình luận</h4>
					    
					    <form action="PaidDocumentDetail" method="post" class="mb-4">
					        <input type="hidden" name="id" value="${docInfo.id}">
					        <div class="mb-3">
					            <label class="form-label fw-bold">Đánh giá sao:</label>
					            <select name="rating" class="form-select w-auto">
					                <option value="5">⭐⭐⭐⭐⭐ (Tuyệt vời)</option>
					                <option value="4">⭐⭐⭐⭐ (Tốt)</option>
					                <option value="3">⭐⭐⭐ (Bình thường)</option>
					                <option value="2">⭐⭐ (Tệ)</option>
					                <option value="1">⭐ (Rất tệ)</option>
					            </select>
					        </div>
					        <div class="mb-3">
					            <textarea name="comment" class="form-control" rows="3" placeholder="Chia sẻ cảm nghĩ của bạn..." required></textarea>
					        </div>
					        <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
					    </form>
					
					    <hr>
					
					    <c:forEach var="r" items="${reviews}">
					        <div class="d-flex mb-3">
					            <img src="${pageContext.request.contextPath}/${r.userAvatar}" class="rounded-circle me-3" width="50" height="50" style="object-fit:cover">
					            <div>
					                <h6 class="fw-bold mb-0">${r.username} <span class="text-warning small ms-2">${r.rating} <i class="fas fa-star"></i></span></h6>
					                <small class="text-muted"><fmt:formatDate value="${r.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
					                <p class="mt-1 mb-0">${r.comment}</p>
					            </div>
					        </div>
					    </c:forEach>
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