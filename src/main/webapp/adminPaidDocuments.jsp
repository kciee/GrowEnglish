<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Tài liệu Trả phí - GrowEnglish</title>
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
        
        .table .form-control-sm {
            font-size: 0.9rem;
        }
        .bg-transparent:focus {
            background-color: #fff !important;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            border: 1px solid #ced4da !important;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="brand"><i class="fas fa-leaf text-warning"></i> GrowEnglish</div>
    
    <a href="${pageContext.request.contextPath}/admin/dashboard">
        <i class="fas fa-home"></i> Tổng quan
    </a>
    
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Quản lý nội dung</div>
    <a href="${pageContext.request.contextPath}/admin/courses"><i class="fas fa-graduation-cap"></i> Khóa học</a>
    <a href="${pageContext.request.contextPath}/admin/documents"><i class="fas fa-book"></i> Tài liệu (Free)</a>
    
    <a href="${pageContext.request.contextPath}/admin/paid-documents" class="active">
        <i class="fas fa-file-invoice-dollar"></i> Tài liệu (Paid)
    </a>
    
    <a href="${pageContext.request.contextPath}/admin/quizzes"><i class="fas fa-tasks"></i> Bài thi & Câu hỏi</a>
    
    <div class="text-uppercase small text-muted px-3 mt-3 mb-2">Hệ thống</div>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Người dùng</a>
    <a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Đơn hàng</a>
    <a href="${pageContext.request.contextPath}/home" target="_blank"><i class="fas fa-external-link-alt"></i> Xem trang chủ</a>
    <a href="${pageContext.request.contextPath}/Logout" class="text-danger mt-5"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
</div>

<div class="content">
    <div class="container-fluid">
        <h2>Quản lý Tài liệu Trả phí</h2>

        <div class="card mb-4 p-4 shadow-sm border-0 mt-3">
            <h5 class="mb-3 text-primary"><i class="fas fa-plus-circle"></i> Thêm tài liệu mới</h5>
            <div class="card-body bg-light">
                <form action="paid-documents" method="post" enctype="multipart/form-data" class="row g-3">
                    <input type="hidden" name="action" value="create">
                    
                    <div class="col-md-3">
                        <label class="form-label small fw-bold">Tên tài liệu</label>
                        <input type="text" name="title" class="form-control" placeholder="Nhập tên..." required>
                    </div>
                    
                    <div class="col-md-2">
                        <label class="form-label small fw-bold">Giá bán ($)</label>
                        <input type="number" name="price" min="0" class="form-control text-success fw-bold" step="0.1" placeholder="0.0" required>
                    </div>
                    
                    <div class="col-md-2">
                        <label class="form-label small fw-bold">Loại</label>
                        <select name="videoOrWord" class="form-select">
                            <option value="word">Word/PDF</option>
                            <option value="video">Video</option>
                        </select>
                    </div>
                    
                    <div class="col-md-5">
                        <label class="form-label small fw-bold">Ảnh bìa</label>
                        <input type="file" name="image" class="form-control" accept="image/*">
                    </div>
                    
                    <div class="col-12">
                        <label class="form-label small fw-bold">Mô tả</label>
                        <textarea name="description" class="form-control" rows="2" placeholder="Mô tả ngắn..."></textarea>
                    </div>
                    
                    <div class="col-12 text-end">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm mới</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th width="5%">ID</th>
                            <th width="10%">Ảnh</th>
                            <th width="35%">Thông tin</th>
                            <th width="10%">Giá ($)</th>
                            <th width="10%">Loại</th>
                            <th width="10%" class="text-end">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${documents}">
                            <tr>
                                <form action="paid-documents" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${d.id}">
                                    <input type="hidden" name="currentImage" value="${d.imagePath}">
                                    
                                    <td class="fw-bold text-muted text-center">${d.id}</td>
                                    
                                    <td>
                                        <img src="${pageContext.request.contextPath}/${d.imagePath}" width="60" class="rounded border mb-1 object-fit-cover">
                                    </td>
                                    
                                    <td>
                                        <input type="text" name="title" value="${d.title}" class="form-control form-control-sm mb-1 fw-bold border-0 bg-transparent px-0" placeholder="Tiêu đề">
                                        <textarea name="description" class="form-control form-control-sm border-0 bg-transparent text-muted px-0" rows="2" style="resize: none;">${d.description}</textarea>
                                    </td>

                                    <td>
                                        <div class="input-group input-group-sm">
                                            <input type="number" name="price" min="0" value="${d.price}" step="0.1" class="form-control form-control-sm border-0 bg-transparent text-success fw-bold px-0">
                                        </div>
                                    </td>

                                    <td>
                                        <select name="videoOrWord" class="form-select form-select-sm border-0 bg-transparent text-primary fw-bold px-0">
                                            <option value="word" ${d.videoOrWord == 'word' ? 'selected' : ''}>Word</option>
                                            <option value="video" ${d.videoOrWord == 'video' ? 'selected' : ''}>Video</option>
                                        </select>
                                    </td>

                                    <td class="text-end pe-3">
                                        <button type="submit" name="action" value="update" class="btn btn-outline-primary btn-sm mb-1" title="Lưu"><i class="fas fa-save"></i></button>
                                        <button type="submit" name="action" value="delete" class="btn btn-outline-danger btn-sm mb-1" onclick="return confirm('Xóa tài liệu này?')" title="Xóa"><i class="fas fa-trash"></i></button>                                        
                                        <a href="PaidDocumentDetail?id=${d.id}" target="_blank" class="btn btn-outline-secondary btn-sm mb-1" title="Xem nội dung"><i class="fas fa-eye"></i></a>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty documents}">
                            <tr><td colspan="6" class="text-center py-5 text-muted">Chưa có tài liệu trả phí nào.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>