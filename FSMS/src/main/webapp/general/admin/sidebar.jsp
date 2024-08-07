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
                    <li class="<%=(session.getAttribute("tabId").equals(1)||session.getAttribute("tabId").equals(2)||session.getAttribute("tabId").equals(3)||session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                        <a href="/admin">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/dashboard.svg" class="svg-icon" alt="">
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="treeview <%=(session.getAttribute("tabId").equals(5)||session.getAttribute("tabId").equals(6)||session.getAttribute("tabId").equals(7)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Accounts</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(6)) ? "active" : ""%>"><a href="/admin/accounts/create"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Create Accounts</a></li>
                            <li class="<%=(session.getAttribute("tabId").equals(5)||session.getAttribute("tabId").equals(7)) ? "active" : ""%>"><a href="/admin/accounts"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Accounts</a></li>	
                        </ul>
                    </li>
                    <li class="treeview <%=(session.getAttribute("tabId").equals(8)||session.getAttribute("tabId").equals(9)||session.getAttribute("tabId").equals(10)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Products</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(9)) ? "active" : ""%>"><a href="/admin/product/create"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Create Products</a></li>
                            <li class="<%=(session.getAttribute("tabId").equals(8)||session.getAttribute("tabId").equals(10)) ? "active" : ""%>"><a href="/admin/product"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Products</a></li>	
                        </ul>
                    </li>

                    <li class="treeview <%=(session.getAttribute("tabId").equals(11)||session.getAttribute("tabId").equals(12)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Orders</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(11)||session.getAttribute("tabId").equals(12)) ? "active" : ""%>"><a href="/admin/order"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Orders</a></li>	
                        </ul>
                    </li>
                    <li class="treeview <%=(session.getAttribute("tabId").equals(13)||session.getAttribute("tabId").equals(14)||session.getAttribute("tabId").equals(15)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Voucher</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(15)) ? "active" : ""%>"><a href="/admin/voucher/create"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Create Voucher</a></li>
                            <li class="<%=(session.getAttribute("tabId").equals(13)||session.getAttribute("tabId").equals(14)) ? "active" : ""%>"><a href="/admin/voucher"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Voucher</a></li>	
                        </ul>
                    </li>

                    <li class="treeview <%=(session.getAttribute("tabId").equals(19)) ? "menu-open active" : ""%>">
                        <a href="/admin/hisOrder">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/dashboard.svg" class="svg-icon" alt="">
                            <span>View History Of Orders</span>
                        </a>
                    </li>

                    <li class="treeview <%=(session.getAttribute("tabId").equals(16)||session.getAttribute("tabId").equals(17)||session.getAttribute("tabId").equals(18)) ? "menu-open active" : ""%>">
                        <a href="#">
                            <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/sidebar-menu/members.svg" class="svg-icon" alt="">
                            <span>Manage Banners</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<%=(session.getAttribute("tabId").equals(17)) ? "active" : ""%>"><a href="/admin/crbanner"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Create Banners</a></li>
                            <li class="<%=(session.getAttribute("tabId").equals(16)||session.getAttribute("tabId").equals(18)) ? "active" : ""%>"><a href="/admin/banners"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>View Banners</a></li>	
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </section>
</aside>