<%@include file="./general/shipper/header.jsp" %>
<%@include file="./general/shipper/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./shipper/home.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 2}">
        <%@include file="./shipper/viewProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 3}">
        <%@include file="./shipper/editProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 4}">
        <%@include file="./shipper/changePassword.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/shipper/footer.jsp" %>
