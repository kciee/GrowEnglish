<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Bài Thi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý Đề Thi Trắc Nghiệm</h2>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Dashboard
        </a>
    </div>

    <div class="card mb-4 p-4 shadow-sm border-0">
        <h5 class="mb-3 text-primary"><i class="fas fa-plus-circle"></i> Tạo đề thi mới</h5>
        <form action="quizzes" method="post" class="row g-3">
            <input type="hidden" name="action" value="create">
            <div class="col-md-5">
                <input type="text" name="name" class="form-control" placeholder="Tên bài thi (VD: Kiểm tra Unit 1)" required>
            </div>
            <div class="col-md-5">
                <input type="text" name="description" class="form-control" placeholder="Mô tả (VD: 15 phút - 20 câu)" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success w-100 fw-bold">Thêm ngay</button>
            </div>
        </form>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-dark text-white">
                    <tr>
                        <th class="ps-4">ID</th>
                        <th>Tên bài thi</th>
                        <th>Mô tả</th>
                        <th class="text-center">Quản lý nội dung</th>
                        <th class="text-end pe-4">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${quizzes}">
                        <tr>
                            <form action="quizzes" method="post">
                                <td class="ps-4 text-muted">#${q.quizId} <input type="hidden" name="id" value="${q.quizId}"></td>
                                
                                <td><input type="text" name="name" value="${q.quizName}" class="form-control form-control-sm border-0 bg-transparent fw-bold" style="min-width: 200px;"></td>
                                <td><input type="text" name="description" value="${q.description}" class="form-control form-control-sm border-0 bg-transparent text-muted"></td>
                                
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/questions?quizId=${q.quizId}" class="btn btn-warning btn-sm text-white fw-bold shadow-sm">
                                        <i class="fas fa-list-ol"></i> Soạn câu hỏi
                                    </a>
                                </td>

                                <td class="text-end pe-4">
                                    <button type="submit" name="action" value="update" class="btn btn-outline-primary btn-sm" title="Lưu thay đổi">
                                        <i class="fas fa-save"></i>
                                    </button>
                                    <button type="submit" name="action" value="delete" class="btn btn-outline-danger btn-sm ms-1" onclick="return confirm('Xóa đề thi này và toàn bộ câu hỏi bên trong?')" title="Xóa đề thi">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty quizzes}">
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">Chưa có bài thi nào. Hãy tạo mới!</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>