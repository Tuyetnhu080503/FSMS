<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Voucher Management</title>
</head>
<body>
    <h2>Voucher List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Voucher ID</th>
                <th>Discount Amount</th>
                <th>Discount Percentage</th>
                <th>Expiry Date</th>
                <th>Active</th>
                <th>Created Date</th>
                <th>Quantity</th>
                <th>Minimum Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="voucher" items="${listV}">
                <tr>
                    <td>${voucher.voucherId}</td>
                    <td>${voucher.discountAmount}</td>
                    <td>${voucher.discountPercentage}</td>
                    <td>${voucher.expiryDate}</td>
                    <td>${voucher.isActive ? 'Yes' : 'No'}</td>
                    <td>${voucher.createdDate}</td>
                    <td>${voucher.quantity}</td>
                    <td>${voucher.minimumPrice}</td>

                    <td>
                        <a href="/admin/updateVoucher?voucherId=${voucher.voucherId}">Edit</a>
                        <a href="/admin/deleteVoucher?voucherId=${voucher.voucherId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="/admin/createVoucher">Create New Voucher</a>
</body>
</html>
