<%@include file="./general/admin/header.jsp" %>
<%@include file="./general/admin/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./admin/home.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/admin/footer.jsp" %>
