<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Tài liệu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý Tài liệu (Free)</h2>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">Dashboard</a>
    </div>

    <div class="card mb-4 p-3 shadow-sm">
        <h5>Thêm tài liệu mới</h5>
        <form action="documents" method="post" enctype="multipart/form-data" class="row g-3">
            <input type="hidden" name="action" value="create">
            <div class="col-md-4">
                <input type="text" name="title" class="form-control" placeholder="Tiêu đề tài liệu" required>
            </div>
            <div class="col-md-3">
                <select name="videoOrWord" class="form-select">
                    <option value="word">Tài liệu đọc (Word/PDF)</option>
                    <option value="video">Video bài giảng</option>
                </select>
            </div>
            <div class="col-md-5">
                <input type="file" name="image" class="form-control" accept="image/*" required>
            </div>
            <div class="col-md-12">
                <input type="text" name="description" class="form-control" placeholder="Mô tả ngắn" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-success">Thêm mới</button>
            </div>
        </form>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Ảnh</th>
                <th>Tiêu đề & Mô tả</th>
                <th>Loại</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="d" items="${documents}">
                <tr>
                    <form action="documents" method="post" enctype="multipart/form-data">
                        <td>${d.id} <input type="hidden" name="id" value="${d.id}"></td>
                        
                        <td style="width: 100px;">
                            <img src="${pageContext.request.contextPath}/${d.imagePath}" width="80" height="50" style="object-fit: cover; border-radius: 5px;">
                            <input type="hidden" name="currentImage" value="${d.imagePath}">
                            <input type="file" name="image" class="form-control form-control-sm mt-2" style="width: 200px;">
                        </td>

                        <td>
                            <input type="text" name="title" value="${d.title}" class="form-control form-control-sm mb-1 fw-bold">
                            <textarea name="description" class="form-control form-control-sm" rows="2">${d.description}</textarea>
                        </td>

                        <td>
                            <select name="videoOrWord" class="form-select form-select-sm">
                                <option value="word" ${d.videoOrWord == 'word' ? 'selected' : ''}>Word</option>
                                <option value="video" ${d.videoOrWord == 'video' ? 'selected' : ''}>Video</option>
                            </select>
                        </td>

                        <td>
                            <button type="submit" name="action" value="update" class="btn btn-primary btn-sm mb-1 w-100">Lưu</button>
                            <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm w-100" onclick="return confirm('Xóa tài liệu này?')">Xóa</button>
                        </td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>