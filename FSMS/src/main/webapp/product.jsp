<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        
    </head>
    <body>
        
        <div class="container">
            <h1>Product Management</h1>
            <form action="<c:url value='/admin/searchProduct' />" method="get" class="form-inline mb-3">
                <input type="text" name="keyword" class="form-control mr-2" placeholder="Search products...">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <a class="btn btn-success mb-3" href="<c:url value='/admin/createProduct' />">Create New Product</a>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Category Name</th>
                        <th>Color</th>
                        <th>Size</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${listP}">
                        <tr>
                            <td>${o.productId}</td>
                            <td>${o.productName}</td>
                            <td>${o.description}</td>
                            <td>${o.price}</td>
                            <td><img src="${o.image}" alt="${o.productName}" style="width: 50px; height: 50px;"></td>
                            <td>${o.categoryName}</td>
                            <td>${o.color}</td>
                            <td>${o.size}</td>
                            <td>${o.quantity}</td>
                            <td>
                                <div class="d-flex">
                                    <a class="btn btn-primary" href="<c:url value='/admin/updateProduct?productId=${o.productId}' />">Update</a>
                                    <a class="btn btn-danger" href="<c:url value='/admin/deleteProduct?productId=${o.productId}' />">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>

