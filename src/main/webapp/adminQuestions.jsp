<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Soạn Câu Hỏi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Soạn câu hỏi (Quiz ID: ${quizId})</h2>
        <a href="${pageContext.request.contextPath}/admin/quizzes" class="btn btn-secondary">Quay lại danh sách Quiz</a>
    </div>

    <div class="card shadow-sm mb-5">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Thêm câu hỏi mới</h5>
        </div>
        <div class="card-body">
            <form action="questions" method="post">
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="quizId" value="${quizId}">

                <div class="mb-3">
                    <label class="form-label fw-bold">Nội dung câu hỏi:</label>
                    <textarea name="questionText" class="form-control" rows="2" required placeholder="Ví dụ: Con chó trong tiếng Anh là gì?"></textarea>
                </div>

                <label class="form-label fw-bold">Nhập 4 đáp án và chọn đáp án đúng:</label>
                
                <div class="input-group mb-2">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="correctAnswer" value="0" checked>
                    </div>
                    <span class="input-group-text">A</span>
                    <input type="text" name="answers" class="form-control" placeholder="Đáp án A" required>
                </div>

                <div class="input-group mb-2">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="correctAnswer" value="1">
                    </div>
                    <span class="input-group-text">B</span>
                    <input type="text" name="answers" class="form-control" placeholder="Đáp án B" required>
                </div>

                <div class="input-group mb-2">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="correctAnswer" value="2">
                    </div>
                    <span class="input-group-text">C</span>
                    <input type="text" name="answers" class="form-control" placeholder="Đáp án C" required>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="correctAnswer" value="3">
                    </div>
                    <span class="input-group-text">D</span>
                    <input type="text" name="answers" class="form-control" placeholder="Đáp án D" required>
                </div>

                <button type="submit" class="btn btn-success w-100">Lưu câu hỏi này</button>
            </form>
        </div>
    </div>

    <h4 class="mb-3">Danh sách câu hỏi trong bài thi này:</h4>
    <c:forEach var="q" items="${questions}" varStatus="status">
        <div class="card mb-3 border-0 shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="fw-bold mb-1">Câu ${status.count}: ${q.questionText}</h6>
                    <small class="text-muted">(ID: ${q.questionId})</small>
                </div>
                <form action="questions" method="post" style="margin:0;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="quizId" value="${quizId}">
                    <input type="hidden" name="questionId" value="${q.questionId}">
                    <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('Xóa câu hỏi này?')">Xóa</button>
                </form>
            </div>
        </div>
    </c:forEach>
    
    <c:if test="${empty questions}">
        <div class="alert alert-info">Chưa có câu hỏi nào. Hãy thêm câu hỏi đầu tiên!</div>
    </c:if>

</div>
</body>
</html>