<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1>Update Order</h1>
            <form action="<c:url value='/admin/updateOrderProcess' />" method="post">
                <div class="form-group">
                    <label for="orderId">Order ID:</label>
                    <input type="text" class="form-control" id="orderId" name="orderId" value="${order.orderId}" readonly>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select class="form-control" id="status" name="status">
                        <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Pending" ${order.status == 'Processing' ? 'selected' : ''}>Processing</option>
                        <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
                        <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                        <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </body>
</html>
