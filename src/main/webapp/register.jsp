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
    <title>Đăng ký tài khoản </title>
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
    		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    	}
    	
    	body::before {
    		content: "";
    		position: absolute;
    		top: 0;
    		left: 0;
    		right: 0;
    		bottom: 0;
    		background-color: rgba(0, 0, 0, 0.5);
    		z-index: -1;
    	}
    	
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
<body class="min-h-screen flex items-center justify-center px-4">

    <div class="bg-white/90 backdrop-blur-sm p-8 rounded-xl shadow-2xl w-full max-w-md fade-in relative z-10">
        
        <h1 class="text-3xl font-bold text-center text-indigo-700 mb-2">Đăng ký tài khoản</h1>
        <p class="text-center text-gray-500 text-sm mb-6">Tham gia cộng đồng G-Easy ngay</p>

        <% if (errorMessage != null) { %>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4 text-sm flex items-center gap-2">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/></svg>
            <span><%= errorMessage %></span>
        </div>
        <% } %>

        <% if (successMessage != null) { %>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4 text-sm flex items-center gap-2">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/></svg>
            <span><%= successMessage %></span>
        </div>
        <% } %>

		<form action="register" method="post" class="space-y-5" onsubmit="return validateForm()">
		    
		    <div>
		        <label for="username" class="block text-sm font-semibold text-gray-700 mb-1">Tên người dùng</label>
		        <input type="text" id="username" name="username"
		               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
		               placeholder="Nhập tên đăng nhập (5-20 ký tự)..." 
		               required minlength="5" maxlength="20" pattern="[a-zA-Z0-9]+">
		        <small class="text-gray-400 text-xs">Chỉ bao gồm chữ và số, không dấu.</small>
		    </div>
		
		    <div>
		        <label for="email" class="block text-sm font-semibold text-gray-700 mb-1">Email</label>
		        <input type="email" id="email" name="email"
		               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
		               placeholder="example@email.com" required>
		    </div>
		
		    <div>
		        <label for="password" class="block text-sm font-semibold text-gray-700 mb-1">Mật khẩu</label>
		        <input type="password" id="password" name="password"
		               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
		               placeholder="Tối thiểu 6 ký tự..." required minlength="6">
		    </div>
		
		    <div>
		        <label for="confirmPassword" class="block text-sm font-semibold text-gray-700 mb-1">Xác nhận mật khẩu</label>
		        <input type="password" id="confirmPassword" name="confirmPassword"
		               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"
		               placeholder="Nhập lại mật khẩu..." required>
		        <p id="passError" class="text-red-500 text-xs mt-1 hidden">Mật khẩu không khớp!</p>
		    </div>
		
		    <button type="submit"
		            class="w-full bg-indigo-600 text-white py-2.5 rounded-lg hover:bg-indigo-700 transition duration-300 font-bold shadow-md">
		        Đăng ký ngay
		    </button>
		</form>
		
		<script>
		    function validateForm() {
		        var pass = document.getElementById("password").value;
		        var confirmPass = document.getElementById("confirmPassword").value;
		        var errorMsg = document.getElementById("passError");
		
		        if (pass !== confirmPass) {
		            errorMsg.classList.remove("hidden");
		            document.getElementById("confirmPassword").focus();
		            return false;
		        }
		        errorMsg.classList.add("hidden");
		        return true;
		    }
		</script>

        <p class="mt-6 text-center text-sm text-gray-600">
            Đã có tài khoản?
            <a href="login.jsp" class="text-indigo-600 font-bold hover:underline hover:text-indigo-800 transition">
                Đăng nhập tại đây
            </a>
        </p>

        <div class="mt-4 text-center">
            <a href="${pageContext.request.contextPath}/home" class="text-xs text-gray-500 hover:text-gray-700 flex items-center justify-center gap-1">
                <i class="fas fa-arrow-left"></i>← Quay về trang chủ
            </a>
        </div>
    </div>

</body>
</html>