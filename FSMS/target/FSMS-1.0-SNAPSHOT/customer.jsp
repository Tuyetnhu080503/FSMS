<%@include file="./general/customer/header.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./customer/index.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 2}">
        <%@include file="./customer/login.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/customer/brand.jsp" %>	
<%@include file="./general/customer/footer.jsp" %>
