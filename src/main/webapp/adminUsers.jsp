<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quản lý người dùng</title>
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: center;
        }
<<<<<<< HEAD
        th {
            background-color: #f2f2f2;
        }
=======

        th {
            background-color: #f2f2f2;
        }

>>>>>>> e18aefb (update)
        button {
            padding: 5px 10px;
            margin: 2px;
        }
<<<<<<< HEAD
=======

>>>>>>> e18aefb (update)
        .action-form {
            display: inline-block;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;">Danh sách người dùng</h2>
<table>
    <tr>
        <th>Tên đăng nhập</th>
        <th>Họ tên</th>
        <th>Email</th>
        <th>SĐT</th>
        <th>Năm sinh</th>
        <th>Vai trò</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.username}</td>
            <td>${u.fullName}</td>
            <td>${u.email}</td>
            <td>${u.phonenumber}</td>
            <td>${u.birthYear}</td>
            <td>${u.role}</td>
            <td>
                <form method="post" class="action-form" action="${pageContext.request.contextPath}/admin/users">
                    <input type="hidden" name="username" value="${u.username}"/>
                    <button type="submit" name="action" value="delete" onclick="return confirm('Xoá người dùng này?')">
                        🗑 Xoá
                    </button>
                </form>
                <c:choose>
                    <c:when test="${u.role eq 'admin'}">
                        <form method="post" class="action-form" action="${pageContext.request.contextPath}/admin/users">
                            <input type="hidden" name="username" value="${u.username}"/>
                            <button type="submit" name="action" value="demote">⬇️ Hạ quyền</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form method="post" class="action-form" action="${pageContext.request.contextPath}/admin/users">
                            <input type="hidden" name="username" value="${u.username}"/>
                            <button type="submit" name="action" value="promote">⬆️ Thăng quyền</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
