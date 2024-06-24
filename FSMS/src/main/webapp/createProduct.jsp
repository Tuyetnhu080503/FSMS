<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
        }
        label {
            font-weight: bold;
        }
        input[type=text], textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Create Product</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p class="error-message"><%= errorMessage %></p>
    <% } %>

    <form action="<c:url value='/admin/createProductProcess' />" method="post">
        <label for="productName">Product Name:</label><br>
        <input type="text" id="productName" name="productName" required><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" required></textarea><br>

        <label for="price">Price:</label><br>
        <input type="text" id="price" name="price" required><br>

        <label for="image">Image (URL):</label><br>
        <input type="text" id="image" name="image" required><br>

        <label for="categoryId">Category ID:</label><br>
        <input type="text" id="categoryId" name="categoryId" required><br>

        <h2>Product Type</h2>
        <label for="color">Color:</label><br>
        <input type="text" id="color" name="color" required><br>

        <label for="size">Size:</label><br>
        <input type="text" id="size" name="size" required><br>

        <label for="quantity">Quantity:</label><br>
        <input type="text" id="quantity" name="quantity" required><br>

        <input type="submit" value="Create">
    </form>

    <br>
    <p><a href="<c:url value='/admin/product' />">Back to Product List</a></p>
</body>
</html>
