<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Product</title>
</head>
<body>
    <h1>Update Product</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <p style="color: red;"><%= errorMessage %></p>
<% } %>


    <%-- Form to update product --%>
    <form action="<c:url value='/manage/updateProductProcess' />" method="post">
        <%-- Hidden field to store productId --%>
        <input type="hidden" name="productId" value="${product.productId}">
        
        <label for="productName">Product Name:</label><br>
        <input type="text" id="productName" name="productName" value="${product.productName}" required><br><br>
        
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" cols="50" required>${product.description}</textarea><br><br>
        
        <label for="price">Price:</label><br>
        <input type="text" id="price" name="price" value="${product.price}" required><br><br>
        
        <label for="image">Image (URL):</label><br>
        <input type="text" id="image" name="image" value="${product.image}" required><br><br>
        
        <label for="categoryId">Category ID:</label><br>
        <input type="text" id="categoryId" name="categoryId" value="${product.categoryId}" required><br><br>
        
        <%-- ProductType fields --%>
        <label for="color">Color:</label><br>
        <input type="text" id="color" name="color" value="${productType.color}" required><br><br>
        
        <label for="size">Size:</label><br>
        <input type="text" id="size" name="size" value="${productType.size}" required><br><br>
        
        <label for="quantity">Quantity:</label><br>
        <input type="text" id="quantity" name="quantity" value="${productType.quantity}" required><br><br>
        
        <input type="submit" value="Update">
    </form>
    
    <br>
    <a href="<c:url value='/manage/product' />">Back to Product List</a>
</body>
</html>
