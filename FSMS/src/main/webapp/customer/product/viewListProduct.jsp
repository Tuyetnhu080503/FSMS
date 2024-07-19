<%@page import="Models.Product"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.CategoryDAO"%>s


<%
    ProductDAO proDAO = new ProductDAO();
    ResultSet rss = proDAO.getAlls();
    List<Product> products = new ArrayList<>();

    while (rss.next()) {
        Product product = new Product();
        product.setProductId(rss.getInt("ProductID"));
        product.setName(rss.getString("Name"));
        product.setPrice(rss.getLong("Price"));
        product.setImage(rss.getString("Image"));
        product.setDescription(rss.getString("Description"));
        products.add(product);
    }

    int pageNumber = 1;
    int productsPerPage = 5;
    int totalProducts = products.size();
    int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

    if (request.getParameter("page") != null) {
        pageNumber = Integer.parseInt(request.getParameter("page"));
    }

    int start = (pageNumber - 1) * productsPerPage;
    int end = Math.min(start + productsPerPage, totalProducts);
%>

<section class="main-content-area">
    <div class="container">
        <!-- bradcame start -->
        <div class="row">
            <div class="col-12">
                <div class="greentect_bradcame">
                    <ul>
                        <li><a href="/">home</a></li>
                        <li>Products </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- bradcame end -->
        <div class="row flex-row-reverse">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="right-main-product">
                    <!-- category-page-add start -->

                    <!-- category-page-add end -->
                    <!-- product-sgorting start -->
                    <div class="product-sgorting-bar">
                        <!-- view-systeam start -->
                        <div class="view-systeam">
                            <ul>
                                <li><a href="/products/list2"><i class="fa fa-th-large"></i></a></li>
                                <li class="active"><i class="fa fa-th-list"></i></li>
                            </ul>										
                        </div>
                    </div>
                    <!-- product-sgorting end -->
                    <!-- all-product start -->
                    <div class="row all-list-product">
                        
                        <!-- single-product-item start -->
                        <% for (int idx = start; idx < end; idx++) { 
                            Product product = products.get(idx);
                        %>
                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">

                            <div class="single-product-item"> 
                                <div class="product-image">
                                    <div class="product-sticker">
                                        <img src="../../assets/assets_customer/img/product/new1.png" alt="product sticker">
                                    </div>			
                                    <a href="/products/detail" title=""><img src="${pageContext.request.contextPath}/assets/images/product/<%=product.getImage()%>" alt="product image"></a>
                                    <div class="single-product-overlay">
                                        <div class="product-quick-view">
                                            <ul>
                                                <li><a href="/products/detail?id=<%=product.getProductId()%>"><i class="fa fa-heart-o"></i></a></li>
                                                <li><a href="/products/detail?id=<%=product.getProductId()%>"><i class="fa fa-copy"></i></a></li>
                                                <li><a href="/products/detail?id=<%=product.getProductId()%>"><i class="fa fa-search"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-product-text">
                                    <h2><a class="product-title" href="/products/detail?id=<%=product.getProductId()%>" title=""><%=product.getName()%></a></h2>
                                    <div class="price-rate-box">
                                        <div class="product-price">
                                            <span class="regular-price"><%=product.getPrice()%>vnd</span>
                                        </div>											
                                        <div class="rating-box">
                                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-description">
                                        <p><%=product.getDescription()%></p>                                    </div>
                                    <div class="pro-add-to-cart">
                                        <p><a href="/cart/add" title="Add to Cart">Add to Cart</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <!-- single-product-item end -->								
                    </div>
                    <!-- all-product end -->
                    <!-- product-sgorting start -->
                    <div class="product-sgorting-bar bar-2">
                        <!-- view-systeam start -->
                        <div class="view-systeam">
                            <ul>
                                <li><a href="/products/list2"><i class="fa fa-th-large"></i></a></li>
                                <li class="active"><i class="fa fa-th-list"></i></li>
                            </ul>										
                        </div>
                        <!-- view-systeam end -->	
                        <!-- show-page start -->
                        <div class="pagination-bar">
                            <label>Page:</label>
                            <ul>
                                 <% for (int index = 1; index <= totalPages; index++) { %>
                                    <li class="<%= (index == pageNumber) ? "active" : "" %>">
                                        <a href="?page=<%=index%>"><%=index%></a>
                                    </li>
                                <% } %>
                            </ul>										
                        </div>
                        <!-- show-page end -->
                        <!-- shoort-by start -->
                        <div class="shoort-by">
                            <label>Sort by</label>
                            <div class="short-select-option">
                                <select>
                                    <option value="">Position</option>
                                    <option value="">Name</option>
                                    <option value="">Price</option>
                                </select>												
                            </div>
                            <a title="Set Descending Direction" href="#"><i class="fa fa-long-arrow-up"></i></a>
                        </div>
                        <!-- shoort-by end -->	
                    </div>
                    <!-- product-sgorting end -->							
                </div>
            </div>
            <div class="col-12 col-md-12 col-lg-3 col-xl-3">
                <div class="page-sidebar-area">
                    <!-- shop-by-area start -->
                    <div class="single-sidebar shop-by-area">
                        <h2>Shop By</h2>
                        <!-- price-filter start -->
                        <div class="price-filter">
                            <ul>
                                <li>
                                    <span class="price-label">Price: <a href="#" class="remove-icon-btn">remove</a></span>
                                    <span class="form-to-price">$88.00 - $666.99</span>
                                </li>
                            </ul>
                            <div class="remove-all-price">
                                <a href="#">Clear All</a>
                            </div>
                        </div>
                        <!-- price-filter end -->
                        <!-- category-list-pro start -->
                        <div class="category-list-pro sidebar-list">
                            <h3>Category</h3>
                            <ul>
                                <% CategoryDAO catDAO = new CategoryDAO();
                                    ResultSet r = catDAO.getQuantityProductInCategory();
                                    while (r.next()) {
                                %>
                                <li><a href="#"><%= r.getString("category_name")%></a>
                                    <span><%=r.getInt("quantity")%></span></li>
                                    <%}%>
                            </ul>
                        </div>
                        <!-- category-list-pro end -->
                        <!-- price-rang-filter start -->
                        <div class="price-rang-filter sidebar-list">
                            <h3>Price</h3>
                            <div class="range-area">
                                <div id="price-range" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 12.1212%; width: 39.3939%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 12.1212%;"></a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 51.5152%;"></a></div>
                                <p><input class="range_value_1" type="text" id="slidevalue"></p>
                            </div>									
                        </div>
                        <!--                         price-rang-filter end 
                                                 Manufacturer start 
                                                <div class="manufacturer sidebar-list">
                                                    <h3>Manufacturer</h3>
                                                    <ul>
                                                        <li><a href="#">Adidas</a><span>7</span></li>
                                                        <li><a href="#">Chanel</a><span>9</span></li>
                                                        <li><a href="#">Dolce</a><span>1</span></li>
                                                        <li><a href="#">Gabbana</a><span>3</span></li>
                                                        <li><a href="#">Nike</a><span>9</span></li>
                                                        <li><a href="#">Vogue</a><span>5</span></li>
                                                    </ul>									
                                                </div>
                                                 Manufacturer end 
                                                 color-list start 
                                                <div class="color-list sidebar-list">
                                                    <h3>Color</h3>
                                                    <ul>
                                                        <li><a href="#">Black</a><span>8</span></li>
                                                        <li><a href="#">Blue</a><span>3</span></li>
                                                        <li><a href="#">Red</a><span>5</span></li>
                                                        <li><a href="#">Yellow</a><span>9</span></li>
                                                        <li><a href="#">While</a><span>1</span></li>
                                                        <li><a href="#">Green</a><span>2</span></li>										
                                                    </ul>									
                                                </div>
                                                 color-list end 								
                                            </div>
                                             shop-by-area end 
                                             Compare Products start 
                                            <div class="compare-products single-sidebar">
                                                <h2>Compare Products (3)</h2>
                                                <div class="all-compare-product">
                                                    <ul>
                                                        <li><p><a href="#">Bncover humour</a></p><a href="#" class="remove-icon-btn">remove</a></li>
                                                        <li><p><a href="#">Facilisis sagit</a></p><a href="#" class="remove-icon-btn">remove</a></li>
                                                        <li><p><a href="#">Etiam gravida</a></p><a href="#" class="remove-icon-btn">remove</a></li>
                                                    </ul>
                                                    <div class="compare-action">
                                                        <a href="#">Clear All</a>
                                                        <a href="#" class="compare-btn">Compare</a>
                                                    </div>
                                                </div>
                                            </div>
                                             Compare Products end 
                                             single-img-add start 
                                            <div class="single-img-add single-sidebar">
                                                <a href="#"><img src="img/add/banner33.jpg" alt="banner33"></a>
                                            </div>
                                             single-img-add end 
                                             popular tag start 
                                            <div class="popular-tag single-sidebar">
                                                <h2>Popular Tags</h2>
                                                <div class="popular-tag-list">
                                                    <a href="#">Clothing</a>
                                                    <a href="#">accessories</a>
                                                    <a href="#">fashion</a>
                                                    <a href="#">footwear</a>
                                                    <a href="#">kid</a>
                                                    <a href="#">good</a>
                                                    <a href="#">men</a>
                                                    <a href="#">women</a>
                                                    <a href="#">chowa</a>
                                                    <a href="#">Clock</a>
                                                    <div class="view-all-tag">
                                                        <a href="#">View All Tags</a>
                                                    </div>
                                                </div>
                                            </div>
                                             popular tag end 						-->
                    </div>
                </div>
            </div>	
        </div>	
</section>