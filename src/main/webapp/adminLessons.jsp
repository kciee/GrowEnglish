<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Bài giảng - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
        	background-color: #f8f9fa; 
        }
        .form-section { 
        	background: white; 
        	padding: 20px; 
        	border-radius: 8px; 
        	box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
        }
    </style>
</head>
<body>

<div class="container mt-5 mb-5">
    <a href="${pageContext.request.contextPath}/admin/courses" class="btn btn-outline-secondary mb-3">
        <i class="fas fa-arrow-left"></i> Quay lại danh sách khóa học
    </a>

    <div class="alert alert-primary d-flex align-items-center" role="alert">
        <i class="fas fa-book-reader fa-2x me-3"></i>
        <div>
            <h4 class="alert-heading mb-0">Soạn bài giảng cho khóa học: <strong>${course.name}</strong></h4>
            <small>Thêm video và nội dung bài học để học viên có thể truy cập.</small>
        </div>
    </div>

    <div class="row">
        <div class="col-md-5">
            <div class="form-section">
                <h5 class="text-success mb-3"><i class="fas fa-plus-circle"></i> Thêm bài học mới</h5>
                <form action="lessons" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="courseId" value="${course.id}">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Thứ tự bài học</label>
                        <input type="number" name="orderIndex" class="form-control" value="${lessons.size() + 1}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Tiêu đề bài học</label>
                        <input type="text" name="title" class="form-control" placeholder="Ví dụ: Bài 1 - Giới thiệu..." required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Link Video (Youtube)</label>
                        <input type="text" name="videoUrl" class="form-control" placeholder="Dán link Youtube vào đây..." required>
                        <div class="form-text">Hệ thống sẽ tự chuyển link thường thành link nhúng.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Nội dung / Ghi chú</label>
                        <textarea name="content" class="form-control" rows="5" placeholder="Nhập tóm tắt nội dung, bài tập về nhà hoặc từ vựng..."></textarea>
                    </div>

                    <button type="submit" class="btn btn-success w-100 fw-bold">
                        <i class="fas fa-save"></i> Lưu bài học
                    </button>
                </form>
            </div>
        </div>

        <div class="col-md-7">
            <div class="bg-white p-3 rounded shadow-sm">
                <h5 class="mb-3">Danh sách bài giảng (${lessons.size()})</h5>
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th class="text-center" style="width: 50px;">#</th>
                            <th>Tên bài học</th>
                            <th>Nội dung</th>
                            <th class="text-center">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${lessons}">
                            <tr>
                                <td class="text-center fw-bold">${l.orderIndex}</td>
                                <td>
                                    <div class="fw-bold text-primary">${l.title}</div>
                                    <small class="text-muted text-truncate d-block" style="max-width: 200px;">
                                        <i class="fab fa-youtube text-danger"></i> ${l.videoUrl}
                                    </small>
                                </td>
                                <td>
                                    <div class="text-muted small text-truncate" style="max-width: 150px;">
                                        ${l.content}
                                    </div>
                                </td>
                                <td class="text-center align-middle">
                                    <form action="lessons" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa bài này không?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="courseId" value="${course.id}">
                                        <input type="hidden" name="lessonId" value="${l.id}">
                                        <button class="btn btn-outline-danger btn-sm border-0">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty lessons}">
                            <tr>
                                <td colspan="4" class="text-center py-4 text-muted">
                                    <img src="https://cdn-icons-png.flaticon.com/512/7486/7486747.png" width="60" class="mb-2 opacity-50">
                                    <br>Chưa có bài học nào. Hãy thêm ở cột bên trái!
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>