<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Quản lý tài khoản</h2>
    <div class="card mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white">
            Thông tin tài khoản
        </div>
        <div class="card-body">
            <form action="updateProfile" method="POST" enctype="multipart/form-data">
                <div class="mb-3 text-center">
                    <img id="avatarPreview"
                         src="<%= session.getAttribute("avatar") != null ? session.getAttribute("avatar") : "https://via.placeholder.com/150" %>"
                         alt="Avatar hiện tại"
                         class="img-thumbnail rounded-circle"
                         style="width: 150px; height: 150px; object-fit: cover;">
                    <div class="mt-3">
                        <label for="avatar" class="form-label btn btn-outline-secondary">
                            Chọn ảnh đại diện
                        </label>
                        <input type="file" id="avatar" name="avatar" class="form-control d-none" accept="image/*"
                               onchange="previewAvatar(event)">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="fullName" class="form-label">Họ và Tên</label>
                    <input type="text" id="fullName" name="fullName" class="form-control"
                           placeholder="Nhập họ và tên"
                           value="<%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : "" %>"
                           required>
                </div>
                <div class="mb-3">
                    <label for="birthYear" class="form-label">Năm Sinh</label>
                    <input type="number" id="birthYear" name="birthYear" class="form-control"
                           placeholder="Nhập năm sinh"
                           value="<%= session.getAttribute("birthYear") != null ? session.getAttribute("birthYear") : "" %>"
                           min="1900" max="2100" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success">Cập nhật</button>
                    <button type="reset" class="btn btn-secondary">Đặt lại</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function previewAvatar(event) {
        const [file] = event.target.files;
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('avatarPreview').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }
</script>
</body>
</html>
