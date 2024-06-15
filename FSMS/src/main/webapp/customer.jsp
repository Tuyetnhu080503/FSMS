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
</c:choose>
<%@include file="./general/customer/brand.jsp" %>	
<%@include file="./general/customer/footer.jsp" %>
