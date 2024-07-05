<%@include file="./general/staff/header.jsp" %>
<%@include file="./general/staff/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./staff/home.jsp" %>
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
</c:choose>
<%@include file="./general/staff/footer.jsp" %>
