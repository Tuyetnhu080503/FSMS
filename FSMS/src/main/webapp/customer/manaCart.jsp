<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 18px;
        text-align: left;
    }
    table thead tr {
        background-color: #f2f2f2;
        border-bottom: 2px solid #dddddd;
    }
    table th, table td {
        padding: 12px 15px;
    }
    table tbody tr {
        border-bottom: 1px solid #dddddd;
    }
    table tbody tr:nth-of-type(even) {
        background-color: #f9f9f9;
    }
    table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }
    table tbody tr:hover {
        background-color: #f1f1f1;
    }
    .item-edit, .item-delete {
        text-decoration: none;
        color: #009879;
        margin-right: 10px;
        font-weight: bold;
    }
    .item-edit:hover, .item-delete:hover {
        text-decoration: underline;
        color: #007f65;
    }
    .topcart-check-btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #009879;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 20px;
    }
    .topcart-check-btn:hover {
        background-color: #007f65;
    }
    h1 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
    p {
        font-size: 18px;
        color: #666;
    }
    .quantity-wrapper {
        display: flex;
        align-items: center;
    }
    .quantity-wrapper input {
        width: 50px;
        text-align: center;
    }
    .quantity-wrapper button {
        width: 30px;
        height: 30px;
        border: none;
        background-color: #f2f2f2;
        font-size: 18px;
        cursor: pointer;
    }
    .quantity-wrapper button:hover {
        background-color: #e0e0e0;
    }
</style>

<h1>Your Shopping Cart</h1>

<c:choose>
    <c:when test="${empty cartItems}">
        <p>Your cart is empty.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
                <tr>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td><img src="${item.product.image}" alt="${item.product.name}" width="50" height="50"></td>
                        <td>${item.product.name}</td>
                        <td>
                            <div class="quantity-wrapper">
                                <form action="CartController" method="post">
                                    <input type="hidden" name="productId" value="${item.product.productId}">    
                                    <button type="submit" name="action" value="decrement">-</button>
                                    <input type="text" name="quantity" value="${item.quantity}" readonly>
                                    <button type="submit" name="action" value="increment">+</button>
                                </form>
                            </div>
                        </td>
                        <td>${item.product.price}</td>
                        <td>${item.quantity * item.product.price}</td>
                        <td>
                            <form action="CartController" method="post">
                                <input type="hidden" name="productId" value="${item.product.productId}">
                                <button type="submit" name="action" value="delete" class="item-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4">Total</td>
                    <td colspan="2">
                        <c:set var="totalPrice" value="0"/>
                        <c:forEach var="item" items="${cartItems}">
                            <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.product.price)}"/>
                        </c:forEach>
                        $${totalPrice}
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <a href="checkout.html" class="topcart-check-btn">Proceed to Checkout</a>
        </div>
    </c:otherwise>
</c:choose>
