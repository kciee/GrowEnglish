<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String errorMessage = (String) request.getAttribute("error");
    String successMessage = (String) request.getAttribute("success");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-green-100 via-blue-100 to-indigo-200 min-h-screen flex items-center justify-center px-4">
<div class="bg-white p-8 rounded-xl shadow-xl w-full max-w-md">
    <h1 class="text-3xl font-bold text-center text-indigo-600 mb-6">Đăng ký tài khoản</h1>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    <% if (errorMessage != null) { %>
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4 text-sm text-center">
        <%= errorMessage %>
    </div>
    <% } %>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    <% if (successMessage != null) { %>
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4 text-sm text-center">
        <%= successMessage %>
    </div>
    <% } %>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    <form action="register" method="post" class="space-y-5">
        <div>
            <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Tên người dùng</label>
            <input type="text" id="username" name="username"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-400 transition"
                   placeholder="Tên đăng nhập" required>
        </div>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input type="email" id="email" name="email"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-400 transition"
                   placeholder="Email" required>
        </div>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu</label>
            <input type="password" id="password" name="password"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-400 transition"
                   placeholder="Nhập mật khẩu" required>
        </div>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <div>
            <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-1">Xác nhận mật khẩu</label>
            <input type="password" id="confirmPassword" name="confirmPassword"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-indigo-400 transition"
                   placeholder="Nhập lại mật khẩu" required>
        </div>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        <button type="submit"
                class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition font-semibold shadow hover:shadow-lg">
            Đăng ký
        </button>
    </form>
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
    <p class="mt-6 text-center text-sm text-gray-600">
        Đã có tài khoản?
        <a href="login.jsp" class="text-indigo-600 font-semibold hover:underline">Đăng nhập</a>
    </p>
</div>
</body>
</html>
