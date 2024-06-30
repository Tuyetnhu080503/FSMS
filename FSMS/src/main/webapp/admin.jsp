<%@include file="./general/admin/header.jsp" %>
<%@include file="./general/admin/sidebar.jsp" %>
<c:choose>
    <c:when test="${sessionScope.tabId == 1}">
        <%@include file="./admin/home.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 2}">
        <%@include file="./admin/viewProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 3}">
        <%@include file="./admin/editProfile.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 4}">
        <%@include file="./admin/changePassword.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 5}">
        <%@include file="./admin/viewAccounts.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 6}">
        <%@include file="./admin/createAccount.jsp" %>
    </c:when>
    <c:when test="${sessionScope.tabId == 7}">
        <%@include file="./admin/updateAccount.jsp" %>
    </c:when>
</c:choose>
<%@include file="./general/admin/footer.jsp" %>
