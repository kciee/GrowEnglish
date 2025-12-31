<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Lịch sử giao dịch - GrowEnglish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container-content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            margin-top: 30px;
        }
        .status-badge {
            font-size: 0.9em;
            padding: 5px 10px;
            border-radius: 20px;
        }
    </style>
</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-10 container-content">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="text-primary"><i class="fas fa-history"></i> Lịch sử giao dịch</h2>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Tiếp tục học
                    </a>
                </div>

                <c:if test="${empty orders}">
                    <div class="alert alert-info text-center py-5">
                        <i class="fas fa-shopping-cart fa-3x mb-3 text-muted"></i>
                        <h4>Bạn chưa có giao dịch nào!</h4>
                        <p>Hãy tham khảo các khóa học chất lượng của chúng tôi.</p>
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mt-2">Xem khóa học</a>
                    </div>
                </c:if>

                <c:if test="${not empty orders}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Mã đơn (#)</th>
                                    <th>Ngày mua</th>
                                    <th>Tổng tiền ($)</th>
                                    <th>Trạng thái</th>
                                    <th>Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${orders}">
                                    <tr>
                                        <td class="fw-bold text-muted">#${o.id}</td>
                                        
                                        <td>
                                            <i class="far fa-clock text-secondary"></i> 
                                            <fmt:formatDate value="${o.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
                                        </td>
                                        
                                        <td class="fw-bold text-success fs-5">
                                            $${o.totalPrice}
                                        </td>
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test="${o.status == 'success'}">
                                                    <span class="badge bg-success status-badge">
                                                        <i class="fas fa-check-circle"></i> Thành công
                                                    </span>
                                                </c:when>
                                                <c:when test="${o.status == 'pending'}">
                                                    <span class="badge bg-warning text-dark status-badge">
                                                        <i class="fas fa-spinner fa-spin"></i> Đang xử lý
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger status-badge">
                                                        <i class="fas fa-times-circle"></i> Đã hủy
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td>
                                            <button class="btn btn-sm btn-outline-primary" title="Xem chi tiết">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>