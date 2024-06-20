<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
    </head>
    <body>
        <h1>Danh sách sản phẩm</h1> 
        <a href="<c:url value='/manage/createProduct' />">Create new product</a>
        <table border="1">
            <thead>     
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Product Price</th>
                    <th>Product Picture</th>
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
                        <td>${o.image}</td>
                        <td>${o.categoryName}</td>
                        <td>${o.color}</td>
                        <td>${o.size}</td>
                        <td>${o.quantity}</td>
                        <td>
                            
                            
                            <a href="<c:url value='/manage/updateProduct?productId=${o.productId}' />">Update</a>
                            &nbsp;&nbsp;
                            <a href="<c:url value='/manage/deleteProduct?productId=${o.productId}' />">Delete</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
            