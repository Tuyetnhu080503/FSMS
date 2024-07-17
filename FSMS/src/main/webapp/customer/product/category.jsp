<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Account"%>
<%
    Account acc = (Account) session.getAttribute("acc");
%>
<aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar position-relative">	
        <div class="user-profile px-40 py-15">
            <div class="d-flex align-items-center">			
                <div class="image">
                    <img src="${pageContext.request.contextPath}/assets/images/avatar/<%=acc.getAvatar() %>" class="avatar avatar-lg" alt="User Image">
                </div>
                <div class="info ms-10">
                    <p class="mb-0">Welcome</p>

                    <h5 class="mb-0"><%=acc.getUsername()%></h5>
                </div>
            </div>
        </div>
        <div class="multinav">
            <div class="multinav-scroll" style="height: 100%;">	
                <!-- sidebar menu-->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">Menu </li>
                    <% CategoryDAO cateDAO = new CategoryDAO();
                    ResultSet rs = cateDAO.getAllCategoryReturnResultSet();
                    while(rs.next()){
                    %>
                    <li class="category-items category-item--active treeview">
                        <a href="#" class="category-item_link"><span class="pull-right-container"><%=rs.getString("Name")%></span></a>
                    </li>
                    <%}
                    %>
                </ul>
            </div>
        </div>
    </section>
</aside>