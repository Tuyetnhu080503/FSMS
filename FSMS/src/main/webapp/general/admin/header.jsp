<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="https://master-admin-template.multipurposethemes.com/bs5/images/favicon.ico">

        <title>Admin - Dashboard</title>

        <!-- Vendors Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_admin/css/vendors_css.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_admin/assets/icons/font-awesome-6/css/all.css">

        <!-- Style-->  
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_admin/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_admin/css/skin_color.css">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/7.4.47/css/materialdesignicons.min.css">
        <script src="${pageContext.request.contextPath}/assets/assets_customer/js/Validator.js"></script>
        <script src="${pageContext.request.contextPath}/assets/assets_customer/js/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="${pageContext.request.contextPath}/assets/assets_admin/js/apexchart.js"></script>
        <style>
            .invalid div {
                color: red;
            }
            .invalid input {
                border: 1px solid red;
            }
        </style>
    </head>

    <body class="hold-transition light-skin sidebar-mini theme-primary fixed">

        <div class="wrapper">
            <div id="loader"></div>

            <header class="main-header" >
                <div class="d-flex align-items-center logo-box justify-content-start">	
                    <!-- Logo -->
                    <a href="/admin" class="logo">
                        <!-- logo-->
                        <div class="logo-mini w-30">
                            <span class="dark-logo"><img src="${pageContext.request.contextPath}/assets/images/logo/logo1.jpg" alt="logo" style="width: 200px"></span>
                        </div>
                        <div class="logo-lg">
                            <span class="light-logo"><img src="${pageContext.request.contextPath}/assets/images/logo/logo1.jpg"  alt="logo"  style="width: 200px"></span>
                        </div>
                    </a>	
                </div>  
                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <div class="app-menu">
                        <ul class="header-megamenu nav">
                            <li class="btn-group nav-item">
                                <a href="#" class="waves-effect waves-light nav-link push-btn btn-outline no-border" data-toggle="push-menu" role="button">
                                    <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/collapse.svg" class="img-fluid svg-icon" alt="">
                                </a>
                            </li>				  
                        </ul> 
                    </div>

                    <div class="navbar-custom-menu r-side">
                        <ul class="nav navbar-nav">		 
                            <li class="btn-group nav-item d-lg-inline-flex d-none">
                                <a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link btn-outline no-border full-screen" title="Full Screen">
                                    <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/fullscreen.svg" class="img-fluid svg-icon" alt="">
                                </a>
                            </li>

                            <!-- User Account-->
                            <li class="dropdown user user-menu">
                                <a href="#" class="waves-effect waves-light dropdown-toggle btn-outline no-border" data-bs-toggle="dropdown" title="User">
                                    <img src="https://master-admin-template.multipurposethemes.com/bs5/images/svg-icon/user.svg" class="img-fluid svg-icon" alt="">
                                </a>
                                <ul class="dropdown-menu animated flipInX">
                                    <li class="user-body">
                                        <a class="dropdown-item" href="/admin/profile"><i class="ti-user text-muted me-2"></i> Profile</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/logout"><i class="ti-lock text-muted me-2"></i> Logout</a>
                                    </li>
                                </ul>
                            </li>			  
                        </ul>
                    </div>
                </nav>
            </header>

