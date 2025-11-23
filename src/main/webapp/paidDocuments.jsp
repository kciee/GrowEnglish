<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài liệu trả phí</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .main-content {
            margin-left: 350px;
            padding-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="main-content">
    <section class="header-section">
        </section>
    <div class="container d-flex align-items-center gap-3 mt-3">
        </div>
    <div class="container mt-5">
        <div class="row" id="documentList">
            <c:if test="${not empty paidDocuments}">
                <c:forEach var="paidDocument" items="${paidDocuments}">
                    <div class="col-md-4 mb-4 card-item" data-title="<c:out value='${paidDocument.title}'/>">
                        <div class="card h-100">
                            <img src="assets/images/Card.svg" class="card-img-top" alt="<c:out value='${paidDocument.title}'/>">
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${paidDocument.title}"/></h5>
                                <p class="card-text"><c:out value="${paidDocument.description}"/></p>
                                <p class="card-price text-success fw-bold">Giá: <c:out value="${paidDocument.price}"/> USD</p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="PaidDocumentDetail?id=${paidDocument.id}" class="btn btn-info btn-sm">Xem chi tiết</a>

                                <a href="${pageContext.request.contextPath}/them-gio-hang?id=${paidDocument.id}" class="btn btn-success btn-sm">Thêm vào giỏ</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function searchDocuments() {
        var searchQuery = document.getElementById('searchInput').value.toLowerCase();
        var cards = document.querySelectorAll('.card-item');
        cards.forEach(function (card) {
            var title = card.getAttribute('data-title').toLowerCase();
            if (title.includes(searchQuery)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }
</script>
</body>
</html>