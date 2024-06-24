<%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<html>
<head>
    <title>Create New Voucher</title>
</head>
<body>
    <h2>Create New Voucher</h2>
    <form action="/admin/createVoucherProcess" method="post">
        Discount Amount: <input type="number" name="discountAmount"><br>
        Discount Percentage: <input type="number" name="discountPercentage"><br>
        Expiry Date: <input type="date" name="expiryDate"><br>
        Active: <input type="checkbox" name="isActive" value="true"><br>
        Created Date: <input type="date" name="createdDate"><br>
        Quantity: <input type="number" name="quantity"><br>
        Minimum Price: <input type="number" name="minimumPrice"><br>
        <input type="submit" value="Create">

    </form>
</body>
</html>
