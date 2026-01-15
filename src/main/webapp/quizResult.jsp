<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả Quiz</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-green-100 via-blue-100 to-indigo-100 min-h-screen flex justify-center items-center px-4">
<div class="bg-white p-10 rounded-2xl shadow-2xl max-w-xl w-full text-center">
    <h1 class="text-3xl font-bold text-green-600 mb-4">🎉 Kết quả của bạn 🎉</h1>
    <div class="text-lg text-gray-700 space-y-3">
        <p><strong>Tên quiz:</strong> ${requestScope.result.quizTitle}</p>
        <p><strong>Số câu đúng:</strong> ${requestScope.correctAnswers} / ${requestScope.totalQuestions}</p>
        <p><strong>Điểm số:</strong> ${requestScope.score} / 100</p>
        <p><strong>Thời gian:</strong> ${requestScope.result.timeTaken} phút</p>
    </div>
    <div class="mt-6">
        <a href="quizList"
           class="bg-indigo-600 text-white px-5 py-2 rounded-lg hover:bg-indigo-700 transition font-medium">
            Quay lại danh sách bài quiz
        </a>
    </div>
</div>
</body>
</html>