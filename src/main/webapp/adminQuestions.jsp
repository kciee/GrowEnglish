<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Soạn Câu Hỏi - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
        	min-height: 100vh; 
        	display: flex; 
        	background-color: #f8f9fa; 
        }
        
        .sidebar { 
        	width: 250px; 
        	background: #212529; 
        	color: white; 
        	flex-shrink: 0; 
        	padding-top: 20px; 
        	min-height: 100vh; 
        }
        
        .sidebar a { 
        	color: #adb5bd; 
        	text-decoration: none; 
        	padding: 12px 20px; 
        	display: block; 
        	transition: 0.3s; 
        }
        
        .sidebar a:hover, .sidebar a.active { 
        	background: #343a40; 
        	color: #fff; 
        	border-left: 4px solid #ffc107; 
        }
        
        .sidebar i { 
        	width: 25px; 
        	text-align: center; 
        	margin-right: 10px; 
        }
        
        .sidebar .brand { 
        	text-align: center; 
        	font-size: 22px; 
        	font-weight: bold; 
        	color: white; 
        	margin-bottom: 30px; 
        }
        
        .content { 
        	flex-grow: 1; 
        	padding: 30px; 
        	overflow-y: auto; 
        }
        
        .answer-group .input-group-text { 
            background-color: #e9ecef; 
            font-weight: bold; 
            width: 45px; 
            justify-content: center; 
        }
        .answer-radio:checked + .input-group-text {
            background-color: #198754;
            color: white;
            border-color: #198754;
        }
        
        .question-card {
            border-left: 4px solid #0d6efd;
            transition: transform 0.2s;
        }
        .question-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .badge-correct {
            background-color: #d1e7dd;
            color: #0f5132;
            border: 1px solid #badbcc;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="brand"><i class="fas fa-leaf text-warning"></i> GrowEnglish</div>
    <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> Tổng quan</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Quản lý nội dung</div>
    <a href="${pageContext.request.contextPath}/admin/courses"><i class="fas fa-graduation-cap"></i> Khóa học</a>
    <a href="${pageContext.request.contextPath}/admin/documents"><i class="fas fa-book"></i> Tài liệu (Free)</a>
    <a href="${pageContext.request.contextPath}/admin/quizzes" class="active"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-1">Soạn câu hỏi</h2>
            <span class="text-muted">Đang thêm vào Quiz ID: <strong>#${quizId}</strong></span>
        </div>
        <a href="${pageContext.request.contextPath}/admin/quizzes" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Quay lại danh sách Quiz
        </a>
    </div>

    <div class="row">
        <div class="col-lg-5">
            <div class="card shadow-sm border-0 mb-4 sticky-top" style="top: 20px; z-index: 1;">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="fas fa-plus-circle"></i> Thêm câu hỏi mới</h5>
                </div>
                <div class="card-body">
                    <form action="questions" method="post">
                        <input type="hidden" name="action" value="create">
                        <input type="hidden" name="quizId" value="${quizId}">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Nội dung câu hỏi:</label>
                            <textarea name="questionText" class="form-control" rows="3" required placeholder="Ví dụ: 'Apple' nghĩa là gì?"></textarea>
                        </div>

                        <label class="form-label fw-bold text-muted small mb-2 d-block">
                            Nhập 4 đáp án & Tích vào đáp án ĐÚNG:
                        </label>
                        
                        <div class="mb-2">
                            <div class="input-group answer-group">
                                <div class="input-group-text p-0 overflow-hidden">
                                    <input class="form-check-input answer-radio m-0 w-100 h-100 rounded-0" type="radio" name="correctAnswer" value="0" checked title="Chọn làm đáp án đúng">
                                </div>
                                <span class="input-group-text">A</span>
                                <input type="text" name="answers" class="form-control" placeholder="Nhập đáp án A" required>
                            </div>
                        </div>

                        <div class="mb-2">
                            <div class="input-group answer-group">
                                <div class="input-group-text p-0 overflow-hidden">
                                    <input class="form-check-input answer-radio m-0 w-100 h-100 rounded-0" type="radio" name="correctAnswer" value="1" title="Chọn làm đáp án đúng">
                                </div>
                                <span class="input-group-text">B</span>
                                <input type="text" name="answers" class="form-control" placeholder="Nhập đáp án B" required>
                            </div>
                        </div>

                        <div class="mb-2">
                            <div class="input-group answer-group">
                                <div class="input-group-text p-0 overflow-hidden">
                                    <input class="form-check-input answer-radio m-0 w-100 h-100 rounded-0" type="radio" name="correctAnswer" value="2" title="Chọn làm đáp án đúng">
                                </div>
                                <span class="input-group-text">C</span>
                                <input type="text" name="answers" class="form-control" placeholder="Nhập đáp án C" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="input-group answer-group">
                                <div class="input-group-text p-0 overflow-hidden">
                                    <input class="form-check-input answer-radio m-0 w-100 h-100 rounded-0" type="radio" name="correctAnswer" value="3" title="Chọn làm đáp án đúng">
                                </div>
                                <span class="input-group-text">D</span>
                                <input type="text" name="answers" class="form-control" placeholder="Nhập đáp án D" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success w-100 fw-bold py-2">
                            <i class="fas fa-save"></i> Lưu câu hỏi
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-7">
            <h4 class="mb-3">Danh sách câu hỏi <span class="badge bg-secondary rounded-pill fs-6">${questions.size()}</span></h4>
            
            <c:if test="${empty questions}">
                <div class="alert alert-info text-center py-4">
                    <i class="fas fa-clipboard-list fa-3x mb-3 text-info"></i><br>
                    Chưa có câu hỏi nào trong đề thi này.<br>
                    Hãy thêm câu hỏi đầu tiên ở cột bên trái!
                </div>
            </c:if>

            <c:forEach var="q" items="${questions}" varStatus="status">
                <div class="card mb-3 shadow-sm border-0 question-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="fw-bold text-primary mb-3">Câu ${status.count}: ${q.questionText}</h5>
                            <form action="questions" method="post" onsubmit="return confirm('Bạn chắc chắn muốn xóa câu hỏi này?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="quizId" value="${quizId}">
                                <input type="hidden" name="questionId" value="${q.questionId}">
                                <button type="submit" class="btn btn-outline-danger btn-sm border-0" title="Xóa câu hỏi">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>

                        <div class="small text-muted">
                            <i class="fas fa-info-circle"></i> ID: ${q.questionId}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>