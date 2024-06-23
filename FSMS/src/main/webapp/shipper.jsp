<%@include file="./general/shipper/header.jsp" %>
<%@include file="./general/shipper/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./shipper/home.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/shipper/footer.jsp" %>
