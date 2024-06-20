<%-- 
    Document   : manage
    Created on : Jun 16, 2024, 8:57:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Manage Page</h1>
    <ul>
        <li><a href="${pageContext.request.contextPath}/manage/product">Manage Products</a></li>
        <li><a href="${pageContext.request.contextPath}/manage/account">Manage Accounts</a></li>
        <li><a href="${pageContext.request.contextPath}/manage/order">Manage Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/manage/voucher">Manage Vouchers</a></li>
    </ul>
    </body>
</html>
