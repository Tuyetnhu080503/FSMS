<%@page import="DAOs.CartDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="Models.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<!--[if IE 9]> <html class="no-js ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->


    <!-- Mirrored from htmldemo.net/greentech/greentech/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Jun 2024 03:48:42 GMT -->
    <head>
        <!-- basic page needs -->	
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Digital Store | GreenTech</title>
        <meta name="description" content="add your site description here">
        <!-- mobile meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/assets_customer/img/favicon.ico">
        <!-- fancybox -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/jquery.fancybox.css">
        <!-- mobile menu -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/meanmenu.min.css">		
        <!-- jquery-ui-slider -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/jquery-ui-slider.css">		
        <!-- nivo-slider css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/nivo-slider.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/owl.carousel.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/animate.css">
        <!-- fonts -->
        <link href="${pageContext.request.contextPath}/../fonts.googleapis.com/cssb1e5.css?family=Poppins:200,300,400,500,600,700,800,900" rel="stylesheet" type="text/css" />
        <!-- font-awesome css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/font-awesome.min.css">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets_customer/css/responsive.css">
        <!-- modernizr js -->
        <script src="${pageContext.request.contextPath}/assets/assets_customer/js/vendor/modernizr-2.6.2.min.js"></script>
        <!--[if lt IE 9]>
          <script src="js/vendor/html5shiv.min.js"></script>
          <script src="js/vendor/respond.min.js"></script>
        <![endif]-->
        <script src="${pageContext.request.contextPath}/assets/assets_customer/js/Validator.js"></script>
        <script src="${pageContext.request.contextPath}/assets/assets_customer/js/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .invalid div {
                color: red;
            }
            .invalid input {
                border: 1px solid red;
            }
        </style>
    </head>
    <body>
        <!-- header-area start -->
        <header class="header-area">
            <!-- header-top start -->
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="welcome-mes">
                                <p>Welcome Fashion store!</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="header-right-menu">
                                <nav>
                                    <ul>
                                        <li><a href="#">Account</a><i class="fa fa-angle-down"></i>
                                            <%
                                                Account acc = (Account) session.getAttribute("acc");
                                            %>
                                            <ul>
                                                <%=acc == null ? "" : "<li><a href=\"/account/profile\">My Account</a></li>"%>
                                                <li><a href="/cart">My Cart</a></li>
                                                    <%=acc != null ? "<li><a href=\"/orders\">My Orders</a></li>" : "<li><a href=\"/login\">My Orders</a></li>"%>
                                                    <%=acc == null ? "<li><a href=\"/login\">Log in</a></li>" : "<li><a href=\"/logout\">Log Out</a></li>"%>
                                            </ul>
                                        </li>

                                    </ul>
                                </nav>
                            </div>								
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-top end -->
            <!-- header-middle start -->			
            <div class="header-middle">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <!-- logo start -->
                            <div class="logo">
                                <a href="/"><img src="${pageContext.request.contextPath}/assets/images/logo/logo1.jpg" alt="GreenTech" /></a>
                            </div>
                            <!-- logo end -->
                        </div>
                        <div class="col-12 col-lg-9">
                            <!-- category search start -->
                            <div class="category-search-area">
                                <div class="search-cat">
                                    <select>

                                        <option value="1">All Categories</option>
                                        <% CategoryDAO cateDAO = new CategoryDAO();
                                            ResultSet rs = cateDAO.getAllCategory();
                                            int i = 0;
                                            while (rs.next()) {
                                        %>
                                        <option value="${i}"><%=rs.getString("Name")%></option>
                                        <% i = i + 1;
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="search-form">
                                    <form action="#" method="post">
                                        <input class="cat-search-box" type="text" placeholder="Search entire store here.." />
                                        <a href="#" class="cat-search-btn"><i class="fa fa-search"></i></a>
                                    </form>	
                                </div>
                            </div>
                            <!-- category search end -->
                            <!-- top-shoping-cart start -->
                            <div class="top-shoping-cart">
                                <div class="top-mycart">
                                    <a class="top-mycart-link" href="/cart">my cart <span id="cart-item-count">(0) item</span></a>
                                    <div class="top-mycart-overlay" id="cart-overlay">
                                        <div class="total-calculate">
                                            <p><span>total</span> 0vnd<a class="topcart-check-btn" href="/cart">View Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                function fetchCartItems() {
                                    var params = new URLSearchParams();
                                    params.append("getItems", "getItems");
                                    fetch("/cart/getItems", {
                                        method: "POST",
                                        headers: {
                                            "Content-Type": "application/x-www-form-urlencoded"
                                        },
                                        body: params.toString()
                                    })
                                            .then(response => response.json())
                                            .then(data => renderCart(data))
                                            .catch(error => console.error("Error:", error));
                                }
                                
                                function renderCart(cartData) {
                                    console.log(cartData);
                                    var cartItems = cartData.items;
                                    var countItems = cartData.totalItems;
                                    var totalCartInHeader = cartData.totalPrice;
                                    var cartOverlay = document.getElementById('cart-overlay');
                                    cartOverlay.innerHTML = '';

                                    var cartItemHTML = "";
                                    for (var i = 0; i < cartItems.length; i++) {
                                        var cartItem = cartItems[i];
                                        cartItemHTML += '<div class="single-mycart-item">' +
                                                '<div class="mycart-item-pro">' +
                                                '<div class="mycart-item-img">' +
                                                '<a href="/cart"><img src="/assets/images/product/' + cartItem.Image + '" alt="cart" /></a>' +
                                                '</div>' +
                                                '<div class="mycart-item-text">' +
                                                '<p><a class="mycart-title" href="/cart">' + cartItem.Name + '</a></p>' +
                                                '<a href="/cart" class="cart-price"><strong>' + cartItem.CartQuantity + '</strong><sub>x</sub> <span>' + (cartItem.Price * cartItem.CartQuantity) + 'vnd</span></a>' +
                                                '</div>' +
                                                '</div>' +
                                                '</div>';
                                    }

                                    var totalCalculateHTML = '<div class="total-calculate">' +
                                            '<p><span>total: </span>' + totalCartInHeader + 'vnd<a style="display:block;width: fit-content" class="topcart-check-btn" href="/cart">View Cart</a></p>' +
                                            '</div>';

                                    cartOverlay.innerHTML = cartItemHTML + totalCalculateHTML;

                                    document.getElementById('cart-item-count').textContent = '(' + countItems + ') item';
                                }
                                
                                document.addEventListener("DOMContentLoaded", function () {
                                    let acc = '<%= acc != null ? acc.getAccountId() : null%>';
                                    if (acc) {
                                        fetchCartItems();
                                    }

                                    function fetchCartItems() {
                                        var params = new URLSearchParams();
                                        params.append("getItems", "getItems");
                                        fetch("/cart/getItems", {
                                            method: "POST",
                                            headers: {
                                                "Content-Type": "application/x-www-form-urlencoded"
                                            },
                                            body: params.toString()
                                        })
                                                .then(response => response.json())
                                                .then(data => renderCart(data))
                                                .catch(error => console.error("Error:", error));
                                    }
                                });
                            </script>
                            <!-- top-shoping-cart end -->							
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-middle end -->
            <!-- header-bottom start -->
            <div class="header-bottom">
                <div class="container">
                    <div class="row">
                        <!-- left-category-menu-area start -->
                        <div class="col-12 col-lg-3">
                            <div class="left-category-menu-area">
                                <h3 class="cat-toggle-heading">category</h3>
                                <div class="left-category-menu" <%=(session.getAttribute("tabId").equals(1)) ? "" : "style=\"display:none\""%>>
                                    <ul>
                                        <%       ResultSet rn = cateDAO.getAllCategory();
                                            while (rn.next()) {
                                        %>
                                        <li>
                                            <a href="/products?id=<%=rn.getInt("CategoryID") %>"><%= rn.getString("Name")%></a>
                                        </li>
                                        <%}%>
                                    </ul>									
                                </div>
                            </div>
                        </div>


                        <!-- mainmenu start -->						
                        <div class="col-12 col-lg-9">
                            <div class="mainmenu">
                                <nav>
                                    <ul>
                                        <li class="active"><a href="/">Home</a>
                                        </li>
                                        <li><a href="/products">Products</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- mainmenu end -->
                    </div>
                    <!-- mobile menu start -->
                    <div class="row">
                        <div class="col-md-12 mobile-menu-area d-block d-lg-none">
                            <div class="mobile-menu" id="mob-menu">
                                <span class="mobile-menu-title">Menu</span>
                                <nav>
                                    <ul>
                                        <li><a href="index.html">Home</a>
                                            <ul>
                                                <li><a href="index-2.html">Home Version 2</a></li>
                                                <li><a href="index-3.html">Home Version 3</a></li>
                                                <li><a href="index-4.html">Home Version 4</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="about-us.html">About Us</a></li>
                                        <li><a href="shop-grid.html">Chair</a>
                                            <ul>
                                                <li><a href="shop-grid.html">Dresses</a>
                                                    <ul>
                                                        <li><a href="shop-grid.html">Dresses</a></li>
                                                        <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                        <li><a href="shop-grid.html">Accessories</a></li>
                                                        <li><a href="shop-grid.html">Shoes</a></li>		
                                                        <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                        <li><a href="shop-grid.html">Air conditioner</a></li>					
                                                    </ul>														
                                                </li>
                                                <li><a href="shop-grid.html">Anime & Manga</a>
                                                    <ul>
                                                        <li><a href="shop-grid.html">Dresses</a></li>
                                                        <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                        <li><a href="shop-grid.html">Accessories</a></li>
                                                        <li><a href="shop-grid.html">Shoes</a></li>		
                                                        <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                        <li><a href="shop-grid.html">Air conditioner</a></li>					
                                                    </ul>													
                                                </li>
                                                <li><a href="shop-grid.html">Accessories</a></li>
                                                <li><a href="shop-grid.html">Shoes</a></li>		
                                                <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                <li><a href="shop-grid.html">Air conditioner</a></li>					
                                            </ul>											
                                        </li>
                                        <li><a href="shop-grid.html">Lamp</a>
                                            <ul>
                                                <li><a href="shop-grid.html">Accessories</a>
                                                    <ul>
                                                        <li><a href="shop-grid.html">Dresses</a></li>
                                                        <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                        <li><a href="shop-grid.html">Accessories</a></li>
                                                        <li><a href="shop-grid.html">Shoes</a></li>		
                                                        <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                        <li><a href="shop-grid.html">Air conditioner</a></li>					
                                                    </ul>													
                                                </li>
                                                <li><a href="shop-grid.html">Shoes</a>
                                                    <ul>
                                                        <li><a href="shop-grid.html">Dresses</a></li>
                                                        <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                        <li><a href="shop-grid.html">Accessories</a></li>
                                                        <li><a href="shop-grid.html">Shoes</a></li>		
                                                        <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                        <li><a href="shop-grid.html">Air conditioner</a></li>					
                                                    </ul>													
                                                </li>		
                                                <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                <li><a href="shop-grid.html">Dresses</a></li>
                                                <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                <li><a href="shop-grid.html">Air conditioner</a></li>					
                                            </ul>											
                                        </li>
                                        <li><a href="shop-grid.html">Dresses</a>
                                            <ul>
                                                <li><a href="shop-grid.html">Animals & Nature</a></li>
                                                <li><a href="shop-grid.html">Air conditioner</a></li>
                                                <li><a href="shop-grid.html">Accessories</a></li>
                                                <li><a href="shop-grid.html">Shoes</a></li>
                                                <li><a href="shop-grid.html">Dresses</a></li>
                                                <li><a href="shop-grid.html">Anime & Manga</a></li>
                                            </ul>											
                                        </li>
                                        <li><a href="shop-grid.html">Shoes</a>
                                            <ul>
                                                <li><a href="shop-grid.html">Dresses</a></li>
                                                <li><a href="shop-grid.html">Accessories</a></li>
                                                <li><a href="shop-grid.html">Shoes</a></li>		
                                                <li><a href="shop-grid.html">Air conditioner</a></li>	
                                                <li><a href="shop-grid.html">Anime & Manga</a></li>
                                                <li><a href="shop-grid.html">Animals & Nature</a></li>	
                                            </ul>											
                                        </li>
                                        <li><a href="blog.html">Blog</a>
                                            <ul>
                                                <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                                                <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                                <li><a href="single-blog.html">Single Blog</a></li>
                                            </ul>											
                                        </li>
                                        <li><a href="#">Pages</a>
                                            <ul>
                                                <li><a href="shop-grid.html">shop grid</a></li>
                                                <li><a href="shop-list.html">shop list</a></li>
                                                <li><a href="single-product.html">single product</a></li>
                                                <li><a href="cart.html">cart</a></li>
                                                <li><a href="checkout.html">checkout</a></li>
                                                <li><a href="my-account.html">my account</a></li>
                                                <li><a href="wishlist.html">wishlist</a></li>						
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                                                <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                                <li><a href="single-blog.html">Single Blog</a></li>
                                                <li><a href="about-us.html">about us</a></li>
                                                <li><a href="contact-us.html">contact us</a></li>
                                                <li><a href="404.html">404 Page</a></li>
                                            </ul>													
                                        </li>
                                        <li><a href="contact-us.html">Contact Us</a></li>
                                    </ul>
                                </nav>
                            </div>						
                        </div>
                    </div>
                    <!-- mobile menu end -->					
                </div>
            </div>
            <!-- header-bottom end -->
        </header>
        <!-- header-area end -->