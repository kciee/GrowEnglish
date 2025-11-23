<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Bài Quiz</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-100 to-purple-200 min-h-screen py-10 px-4">
	<script> const startTime = Date.now();</script>
<div class="max-w-4xl mx-auto bg-white rounded-2xl shadow-xl p-8">
    <h1 class="text-3xl font-bold text-center text-purple-700 mb-8">Làm Bài Quiz</h1>
    <form action="submitQuiz" method="post" class="space-y-10">
        <input type="hidden" name="quizId" value="${questions[0].quizId}">
  		<input type="hidden" id="timeTakenInput" name="timeTaken" value="0">
        <c:forEach var="question" items="${requestScope.questions}" varStatus="status">
            <div class="p-6 bg-gray-50 rounded-lg border border-gray-200 shadow-sm">
                <h2 class="text-lg font-semibold text-gray-800 mb-4">
                    Câu ${status.index + 1}: ${question.questionText}
                </h2>
                <div class="space-y-2">
                    <c:forEach var="answer" items="${requestScope.answersMap[question.questionId]}">
                        <label class="flex items-center gap-3">
                            <input type="radio" name="question_${question.questionId}" value="${answer.answerId}"
                                   class="accent-purple-600">
                            <span class="text-gray-700">${answer.answerText}</span>
                        </label>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
        <div class="text-center">
            <button type="submit"
                    class="bg-purple-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-purple-700 transition shadow">
                Nộp Bài
            </button>
        </div>
    </form>
</div>
<script>
    // Gắn sự kiện vào form
    document.querySelector('form[action="submitQuiz"]').addEventListener('submit', function() {
        // 1. Tính thời gian đã trôi qua (tính bằng phút)
        const timeTakenMs = Date.now() - startTime;
        const timeTakenMinutes = (timeTakenMs / 1000 / 60).toFixed(2); // Làm tròn 2 chữ số

        // 2. Gán giá trị vào hidden input
        document.getElementById('timeTakenInput').value = timeTakenMinutes;
    });
</script>
</body>
</html>
