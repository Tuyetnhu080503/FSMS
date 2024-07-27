<%@include file="./general/customer/header.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./customer/index.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 2}">
        <%@include file="./customer/login.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 3}">
        <%@include file="./customer/forgotPassword.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 4}">
        <%@include file="./customer/validOTP.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 5}">
        <%@include file="./customer/newPassword.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 6}">
        <%@include file="./customer/viewProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 7}">
        <%@include file="./customer/editProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 8}">
        <%@include file="./customer/changePassword.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 9}">
        <%@include file="./customer/register.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 10}">
        <%@include file="./customer/product/viewListProduct.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 11}">
        <%@include file="./customer/product/viewListProduct2.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 12}">
        <%@include file="./customer/product/detailProduct.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 13}">
        <%@include file="./customer/customerOrderHistory.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 14}">
        <%@include file="./customer/voucher/detailVoucher.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 15}">
        <%@include file="./customer/cart/viewCart.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 16}">
        <%@include file="./customer/order/viewAllOrder.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 17}">
        <%@include file="./customer/order/detailOrder.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 18}">
        <%@include file="./customer/order/createOrder.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 19}">
        <%@include file="./customer/comment/createComment.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 20}">
        <%@include file="./customer/comment/updateComment.jsp" %>
    </c:when>
   
</c:choose>
<%@include file="./general/customer/brand.jsp" %>	
<%@include file="./general/customer/footer.jsp" %>
