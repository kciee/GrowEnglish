<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<% String errorMessage = (String) request.getAttribute("error"); %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/assets/images/background.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.4);
            z-index: -1;
        }

        .fade-in {
            animation: fadeIn 0.6s ease-out forwards;
            opacity: 0;
            transform: translateY(-20px);
        }
        @keyframes fadeIn {
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body class="min-h-screen flex items-center justify-center px-4">

<div class="bg-white/90 backdrop-blur-sm rounded-2xl shadow-2xl p-8 w-full max-w-md fade-in">
    <div class="text-center mb-6">
        <h2 class="text-3xl font-bold text-purple-700">Đăng nhập hệ thống</h2>
        <p class="text-gray-500 text-sm mt-2">Chào mừng bạn quay trở lại GrowEnglish</p>
    </div>

    <% if (errorMessage != null) { %>
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4 text-sm text-center">
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
        <div class="d-flex justify-content-end mb-3">
    		<a href="forgotPassword.jsp" class="text-decoration-none" style="font-size: 14px; color: #6c757d;">
        		Quên mật khẩu?
    		</a>
		</div>
        <button type="submit"
                class="w-full bg-purple-600 text-white py-2 rounded-lg font-semibold hover:bg-purple-700 transition-all duration-300 shadow-md hover:shadow-xl">
            Đăng nhập
        </button>
    </form>
    
    <p class="mt-6 text-center text-sm text-gray-600">
        Chưa có tài khoản?
        <a href="register.jsp" class="text-purple-600 hover:text-purple-800 font-semibold hover:underline">
            Đăng ký ngay
        </a>
    </p>
    
     <p class="mt-2 text-center text-sm text-gray-500">
        <a href="${pageContext.request.contextPath}/home" class="hover:text-purple-700 transition">
            ← Quay về trang chủ
        </a>
    </p>
</div>

</body>
</html>