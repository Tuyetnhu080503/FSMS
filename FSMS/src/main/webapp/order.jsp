<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Order Management</h1>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Status</th>
                    <th>Total Price</th>
                    <th>Created At</th>
                    <th>Voucher ID</th>
                    <th>Payment Method</th>
                    <th>Payment ID</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${listO}">
                    <tr>
                        <td>${o.orderId}</td>
                        <td>${o.customerId}</td>
                        <td>${o.status}</td>
                        <td>${o.totalPrice}</td>
                        <td>${o.createAt}</td>
                        <td>${o.voucherId}</td>
                        <td>${o.paymentMethod}</td>
                        <td>${o.paymentId}</td>
                        <td>
                            <a class="btn btn-primary" href="<c:url value='/admin/updateOrder?orderId=${o.orderId}' />">Update</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
