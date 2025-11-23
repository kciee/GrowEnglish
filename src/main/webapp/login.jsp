<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<% String errorMessage = (String) request.getAttribute("error");%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .fade-in {
            animation: fadeIn 0.6s ease-out forwards;
            opacity: 0;
            transform: translateY(-20px);
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-100 to-purple-200 min-h-screen flex items-center justify-center px-4">
<div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-md fade-in">
    <h2 class="text-3xl font-bold text-center text-purple-700 mb-6">Đăng nhập hệ thống</h2>
    <% if (errorMessage != null) { %>
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4 text-sm">
        <%= errorMessage %>
    </div>
    <% } %>
    <form action="${pageContext.request.contextPath}/auth" method="post" class="space-y-5">
        <div>
            <label for="username" class="block mb-1 font-medium text-gray-700">Tên đăng nhập</label>
            <input type="text" id="username" name="username"
                   class="w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 transition duration-300"
                   placeholder="Nhập tên đăng nhập..." required>
        </div>
        <div>
            <label for="password" class="block mb-1 font-medium text-gray-700">Mật khẩu</label>
            <input type="password" id="password" name="password"
                   class="w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 transition duration-300"
                   placeholder="Nhập mật khẩu..." required>
        </div>
        <button type="submit"
                class="w-full bg-purple-600 text-white py-2 rounded-lg font-semibold hover:bg-purple-700 transition-all duration-300 shadow-md hover:shadow-xl">
            Đăng nhập
        </button>
    </form>
    <p class="text-sm text-center text-gray-600 mt-6">
        Chưa có tài khoản?
        <a href="register.jsp" class="text-purple-600 font-medium hover:underline">Đăng ký tại đây</a>
    </p>
</div>
</body>
</html>
