<%@include file="./general/staff/header.jsp" %>
<%@include file="./general/staff/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./staff/viewOrder.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 2}">
        <%@include file="./staff/viewProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 3}">
        <%@include file="./staff/editProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 4}">
        <%@include file="./staff/changePassword.jsp" %>
    </c:when>
     <c:when test="${sessionScope.tabId == 5}">
        <%@include file="./staff/viewOrder.jsp" %>
    </c:when>
     <c:when test="${sessionScope.tabId == 6}">
        <%@include file="./staff/updateOrder.jsp" %>
    </c:when>
     <c:when test="${sessionScope.tabId == 7}">
        <%@include file="./staff/viewProduct.jsp" %>
    </c:when>
     <c:when test="${sessionScope.tabId == 8}">
        <%@include file="./staff/updateProduct.jsp" %>
    </c:when>
     <c:when test="${sessionScope.tabId == 9}">
        <%@include file="./staff/createProduct.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/staff/footer.jsp" %>
