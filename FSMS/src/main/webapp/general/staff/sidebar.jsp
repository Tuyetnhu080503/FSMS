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
                 
                    <li class="treeview">
                        <a href="/staff/products">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>View list Product</span>
                           
                        </a>
                
                    </li>
                    <li class="treeview <%=(session.getAttribute("tabId").equals(6)||session.getAttribute("tabId").equals(5)||session.getAttribute("tabId").equals(1)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Orders</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(5)||session.getAttribute("tabId").equals(6)||session.getAttribute("tabId").equals(1)) ? "active" : ""%>"><a href="/staff/orders"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Orders</a></li>	
                        </ul>
                    </li>

                    
                </ul>
            </div>
        </div>
    </section>
</aside>