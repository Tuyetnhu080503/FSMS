<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Update Voucher</title>
    </head>
    <body>
        <h2>Update Voucher</h2>
        <form action="/admin/updateVoucherProcess" method="post">
            <input type="hidden" name="voucherId" value="${voucher.voucherId}">
            Discount Amount: <input type="number" name="discountAmount" value="${voucher.discountAmount}"><br>
            Discount Percentage: <input type="number" name="discountPercentage" value="${voucher.discountPercentage}"><br>
            Expiry Date: <input type="date" name="expiryDate" value="${voucher.expiryDate}"><br>
            Active: <input type="checkbox" name="isActive" value="true" ${voucher.isActive ? 'checked' : ''}><br>
            Created Date: <input type="date" name="createdDate" value="${voucher.createdDate}"><br>
            Quantity: <input type="number" name="quantity" value="${voucher.quantity}"><br>
            Minimum Price: <input type="number" name="minimumPrice" value="${voucher.minimumPrice}"><br>
            <input type="submit" value="Update">
         
        </form>
    </body>
</html>
