<%-- 
    Document   : home
    Created on : Jun 14, 2024, 2:02:09 AM
    Author     : LOITD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FSMS - Home</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    </head>
    <body>
        
          <div class="container">
        <h1 class="mt-4">FSMS</h1>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/manage/product" class="btn btn-primary">Manage Products</a>
            <a href="${pageContext.request.contextPath}/manage/order" class="btn btn-primary">Manage Orders</a>
            <a href="${pageContext.request.contextPath}/manage/category" class="btn btn-primary">Manage Categories</a>
        </div>
    </div>
<!--        <h1>FSMS</h1>
        <h3>Product List</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Product Price</th>
                    <th>Product Picture</th>
                    <th>category Name</th>
                    <th> Color</th>
                    <th>Size</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${listP}">
                    <tr>
                        <td>${o.productId}</td>
                        <td>${o.productName}</td>
                        <td>${o.description}</td>
                        <td>${o.price}</td>
                        <td>${o.image}</td>
                        <td>${o.categoryName}</td>
                        <td>${o.color}</td>
                        <td>${o.size}</td>
                        <td>${o.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>-->

    </body>
</html>
