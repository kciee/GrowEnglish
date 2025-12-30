<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý Khóa học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Quản lý Khóa học</h2>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">Quay lại Dashboard</a>
    </div>

    <div class="card mb-4 p-3 shadow-sm">
        <h5>Thêm khóa học mới</h5>
        <form action="courses" method="post" class="row g-3">
            <input type="hidden" name="action" value="create">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="Tên khóa học" required>
            </div>
            <div class="col-md-4">
                <input type="number" name="price" class="form-control" placeholder="Giá ($)" step="0.1" required>
            </div>
            <div class="col-md-12">
                <input type="text" name="description" class="form-control" placeholder="Mô tả ngắn" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-success">Thêm mới</button>
            </div>
        </form>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên khóa học</th>
                <th>Mô tả</th>
                <th>Giá</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${courses}">
                <tr>
                    <form action="courses" method="post">
                        <td>${c.id} <input type="hidden" name="id" value="${c.id}"></td>
                        <td><input type="text" name="name" value="${c.name}" class="form-control form-control-sm"></td>
                        <td><input type="text" name="description" value="${c.shortDescription}" class="form-control form-control-sm"></td>
                        <td><input type="number" name="price" value="${c.price}" class="form-control form-control-sm" step="0.1"></td>
                        <td>
                            <button type="submit" name="action" value="update" class="btn btn-primary btn-sm">Lưu</button>
                            <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm" onclick="return confirm('Xóa khóa học này?')">Xóa</button>
                        </td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>