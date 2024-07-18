<!-- slider-area start -->
<section class="slider-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-6 ms-auto">
                <!-- slider start -->
                <div class="slider bg-sky">
                        <div id="mainSlider" class="nivoSlider">
                            <c:forEach var="image" items="${activeBannerImages}">
                                <img class="slider-image" src="${image}" alt="main slider" title="#htmlcaption${image.hashCode()}" />
                            </c:forEach>
                        </div>
                        <c:forEach var="image" items="${activeBannerImages}">
                            <div id="htmlcaption${image.hashCode()}" class="nivo-html-caption progress-cap">
                                <div class="slider-progress"></div>
                            </div>
                        </c:forEach>
                    </div>
                <!-- slider end -->
                <!-- shipping-add-image start -->
                <div class="shipping-add-image">
                    <div class="row">
                        <div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <div class="single-shipping-image">
                                <a href="#"><img src="./assets/assets_customer/img/shiping/banner_block1.jpg" alt="shipping image" /></a>
                            </div>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <div class="single-shipping-image">
                                <a href="#"><img src="./assets/assets_customer/img/shiping/banner_block2.jpg" alt="shipping image" /></a>
                            </div>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <div class="single-shipping-image">
                                <a href="#"><img src="./assets/assets_customer/img/shiping/banner_block3.jpg" alt="shipping image" /></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- shipping-add-image end -->
            </div>
            <div class="col-12 col-lg-3">
                <!-- featured-product start -->
                <div class="block4 sidebar-product">
                    <div class="section-heading">
                        <h2><span>Featured</span> Products</h2>
                    </div>
                    <div class="featured-product owl-carousel">
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Quisque in arcu"><img src="./assets/assets_customer/img/product/sidebar/home1/1.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Quisque in arcu">Quisque in arcu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                        <span class="old-price">$800.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Aliquam equat"><img src="./assets/assets_customer/img/product/sidebar/home1/2.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Aliquam equat">Aliquam equat</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$700.00</span>
                                        <span class="old-price">$750.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Pellentesque habi"><img src="./assets/assets_customer/img/product/sidebar/home1/3.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Pellentesque habi">Pellente habitant </a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$400.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Pellentesque habi "><img src="./assets/assets_customer/img/product/sidebar/home1/4.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Pellente habitant ">Pellente habitant </a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Occaecati ditate"><img src="./assets/assets_customer/img/product/sidebar/home1/5.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Occaecati ditate">Occaecati ditate</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$520.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Consequences"><img src="./assets/assets_customer/img/product/sidebar/home1/6.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Consequences">Consequences</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$600.00</span>
                                        <span class="old-price">$799.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Pleasure onally"><img src="./assets/assets_customer/img/product/sidebar/home1/7.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Pleasure onally">Pleasure onally</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$789.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Eget non arcu"><img src="./assets/assets_customer/img/product/sidebar/home1/8.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Eget non arcu">Eget non arcu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Facilisis sagittis"><img src="./assets/assets_customer/img/product/sidebar/home1/9.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Facilisis sagittis">Facilisis sagittis</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                        <span class="old-price">$599.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Nulla purus"><img src="./assets/assets_customer/img/product/sidebar/home1/10.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Nulla purus">Nulla purus</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$500.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Malesu tincidunt"><img src="./assets/assets_customer/img/product/sidebar/home1/11.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Malesu tincidunt">Malesu tincidunt</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$499.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Lectus  tincidunt"><img src="./assets/assets_customer/img/product/sidebar/home1/12.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Lectus  tincidunt">Lectus  tincidunt</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$980.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Ullamc tincidu"><img src="./assets/assets_customer/img/product/sidebar/home1/5.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Ullamc tincidu">Ullamc tincidu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$220.00</span>
                                        <span class="old-price">$180.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Mollis eget non"><img src="./assets/assets_customer/img/product/sidebar/home1/11.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Mollis eget non">Mollis eget non</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$999.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Various versions"><img src="./assets/assets_customer/img/product/sidebar/home1/8.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Various versions">Various versions</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$650.00</span>
                                        <span class="old-price">$550.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                    </div>
                </div>
                <!-- featured-product end -->
            </div>
        </div>
    </div>
</section>
<!-- slider-area end -->
<!-- deal of day product area start -->
<section class="block2 endofday-product-area">
    <div class="container">
        <div class="section-heading">
            <h2><span>Deal</span> of the day</h2>
        </div>			
        <!-- deal-of-day-product start -->
        <div class="deal-of-day-product owl-carousel">
            <!-- single product item start -->										
            <div class="block2-single-item">
                <div class="product-border">
                    <div class="block2-pro-img">
                        <a href="single-product.html" title="Fusce aliquam"><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                    </div>
                    <div class="block2-pro-text">
                        <h2><a class="product-title" href="single-product.html" title="Fusce aliquam">Fusce aliquam</a></h2>
                        <div class="rating-box">
                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                        </div>
                        <div class="product-price">
                            <span class="regular-price">$699.00</span>
                            <span class="old-price">$550.00</span>
                        </div>
                        <div class="product-description">
                            <p>Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante..</p>
                        </div>
                    </div>									
                </div>	
                <div class="box-timer">
                    <div class="timer">
                        <div data-countdown="2022/06/30"></div>
                    </div>									
                </div>							
            </div>
            <!-- single product item end -->
            <!-- single product item start -->										
            <div class="block2-single-item">
                <div class="product-border">
                    <div class="block2-pro-img">
                        <a href="single-product.html" title="Quisque in arcu"><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                    </div>
                    <div class="block2-pro-text">
                        <h2><a class="product-title" href="single-product.html" title="Quisque in arcu">Quisque in arcu</a></h2>
                        <div class="rating-box">
                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                        </div>
                        <div class="product-price">
                            <span class="regular-price">$699.00</span>
                            <span class="old-price">$800.00</span>
                        </div>
                        <div class="product-description">
                            <p>Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante..</p>
                        </div>
                    </div>									
                </div>	
                <div class="box-timer">
                    <div class="timer">
                        <div data-countdown="2022/06/10"></div>
                    </div>									
                </div>							
            </div>
            <!-- single product item end -->
            <!-- single product item start -->										
            <div class="block2-single-item">
                <div class="product-border">
                    <div class="block2-pro-img">
                        <a href="single-product.html" title="Proin lectus ipsum"><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                    </div>
                    <div class="block2-pro-text">
                        <h2><a class="product-title" href="single-product.html" title="Proin lectus ipsum">Proin lectus ipsum</a></h2>
                        <div class="rating-box">
                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                        </div>
                        <div class="product-price">
                            <span class="regular-price">$480.00</span>
                            <span class="old-price">$500.00</span>
                        </div>
                        <div class="product-description">
                            <p>Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante..</p>
                        </div>
                    </div>									
                </div>	
                <div class="box-timer">
                    <div class="timer">
                        <div data-countdown="2022/05/01"></div>
                    </div>									
                </div>							
            </div>
            <!-- single product item end -->
            <!-- single product item start -->										
            <div class="block2-single-item">
                <div class="product-border">
                    <div class="block2-pro-img">
                        <a href="single-product.html" title="Primis in faucibus"><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                    </div>
                    <div class="block2-pro-text">
                        <h2><a class="product-title" href="single-product.html" title="Primis in faucibus">Primis in faucibus</a></h2>
                        <div class="rating-box">
                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                        </div>
                        <div class="product-price">
                            <span class="regular-price">$950.00</span>
                            <span class="old-price">$999.00</span>
                        </div>
                        <div class="product-description">
                            <p>Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante..</p>
                        </div>
                    </div>									
                </div>	
                <div class="box-timer">
                    <div class="timer">
                        <div data-countdown="2022/11/12"></div>
                    </div>									
                </div>							
            </div>
            <!-- single product item end -->
            <!-- single product item start -->										
            <div class="block2-single-item">
                <div class="product-border">
                    <div class="block2-pro-img">
                        <a href="single-product.html" title="Pleasure onally"><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                    </div>
                    <div class="block2-pro-text">
                        <h2><a class="product-title" href="single-product.html" title="Pleasure onally">Pleasure onally</a></h2>
                        <div class="rating-box">
                            <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                        </div>
                        <div class="product-price">
                            <span class="regular-price">$850.00</span>
                            <span class="old-price">$800.00</span>
                        </div>
                        <div class="product-description">
                            <p>Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante..</p>
                        </div>
                    </div>									
                </div>	
                <div class="box-timer">
                    <div class="timer">
                        <div data-countdown="2019/01/01"></div>
                    </div>									
                </div>							
            </div>
            <!-- single product item end -->
        </div>
        <!-- deal-of-day-product end -->
    </div>
</section>
<!-- deal of day product area end -->
<!-- Bestseller products area start -->
<section class="tab-carousel-product">
    <div class="container">
        <div class="tab-product-area">
            <div class="bestseller-sec-heading section-heading">
                <h2><span>Bestseller</span> products</h2>
                <div class="tab-carousel-menu">
                    <ul class="nav nav-tabs product-nav">
                        <li><a href="#laptop_computer" data-bs-toggle="tab" class="active">Laptop & Computer</a></li>
                        <li><a href="#shaddam" data-bs-toggle="tab">bags</a></li>
                        <li><a href="#clothing" data-bs-toggle="tab">Clothing</a></li>
                        <li><a href="#lingerie" data-bs-toggle="tab">Lingerie</a></li>
                    </ul>
                </div>
                <!-- tabs menu end -->							
            </div>
            <!-- tab content start -->
            <div class="tab-content jump">
                <!-- tabs one start -->
                <div role="tabpanel" class="tab-pane active" id="laptop_computer">
                    <div class="tab-content-area tab-carousel-1">
                        <div class="product-carousel-1 owl-carousel">
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>	
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Aliquam equat</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$450.00</span>
                                            <span class="regular-price">$500.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec non est</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$350.00</span>
                                            <span class="regular-price">$499.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pellente habitant </a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec ac tempus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$799.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Quisque in arcu</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$299.00</span>
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$300.00</span>
                                            <span class="regular-price">$330.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/12.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Accumsan elit </a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$850.00</span>
                                            <span class="regular-price">$899.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$380.00</span>
                                            <span class="regular-price">$499.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$280.00</span>
                                            <span class="regular-price">$320.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Nunc facilisis</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$599.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$480.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure onally</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$270.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Consequences</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$430.00</span>
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Voluptas nulla</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$720.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                        </div>
                    </div>
                </div>
                <!-- tabs one end -->
                <!-- tabs two start -->
                <div role="tabpanel" class="tab-pane" id="shaddam">
                    <div class="tab-content-area tab-carousel-2">
                        <div class="product-carousel-2 owl-carousel">
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$300.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure onally</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$880.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/12.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Nunc facilisis</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$750.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$450.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Accumsan elit</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$480.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">														
                                            <span class="old-price">$400.00</span>
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="sale-stiker product-sticker">
                                        <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                    </div>											
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Quisque in arcu</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec ac tempus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$799.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$480.00</span>
                                            <span class="regular-price">$650.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Quisque in arcu</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$670.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                        </div>
                    </div>
                </div>
                <!-- tabs two end -->
                <!-- tabs three start -->
                <div role="tabpanel" class="tab-pane" id="clothing">
                    <div class="tab-content-area tab-carousel-3">
                        <div class="product-carousel-3 owl-carousel">
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Aliquam equat</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$599.00</span>
                                            <span class="regular-price">$650.00</span>						
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$899.00</span>
                                            <span class="regular-price">$950.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="sale-stiker product-sticker">
                                        <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                    </div>											
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Voluptas nulla</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$480.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$550.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$550.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Nunc facilisis</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$199.00</span>
                                            <span class="regular-price">$250.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Accumsan elit </a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$300.00</span>
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$890.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$980.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/12.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$950.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$499.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Quisque in arcu</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$720.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                        </div>
                    </div>
                </div>
                <!-- tabs three end -->
                <!-- tabs four start -->
                <div role="tabpanel" class="tab-pane" id="lingerie">
                    <div class="tab-content-area tab-carousel-4">
                        <div class="product-carousel-4 owl-carousel">
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Nunc facilisis</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$600.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure onally</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$450.00</span>
                                            <span class="regular-price">$477.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$880.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$690.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$699.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$899.00</span>
                                            <span class="regular-price">$990.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$799.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>	
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Aliquam equat</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$450.00</span>
                                            <span class="regular-price">$500.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec non est</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$350.00</span>
                                            <span class="regular-price">$499.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pellente habitant </a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>												
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec ac tempus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$799.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->
                            <!-- single-item start -->
                            <div class="item">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$980.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/12.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$950.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                            <!-- single-item end -->										
                        </div>
                    </div>
                </div>
                <!-- tabs four end -->
            </div>						
            <!-- tab content end -->
        </div>
    </div>
</section>
<!-- Bestseller products area end -->
<!-- block-img-add start -->
<div class="block-img-add">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-4">
                <div class="single-image-add">
                    <a href="#"><img src="./assets/assets_customer/img/add/banner11.jpg" alt="GreenTech" /></a>
                </div>
            </div>
            <div class="col-12 col-md-8">
                <div class="single-image-add">
                    <a href="#"><img src="./assets/assets_customer/img/add/banner12.jpg" alt="GreenTech" /></a>
                </div>						
            </div>
        </div>
    </div>
</div>
<!-- block-img-add end -->
<!-- most viewed product area start -->
<section class="tab-carousel-product">
    <div class="container">
        <div class="row">
            <div class="tab-product-area">
                <div class="Mostview-sec-heading section-heading">
                    <h2><span>Mostview</span> products</h2>
                    <div class="tab-carousel-menu">
                        <ul class="nav nav-tabs product-nav">
                            <li><a href="#Fashion_Dress" data-bs-toggle="tab" class="active">Fashion & Dress</a></li>
                            <li><a href="#Footwear_Man" data-bs-toggle="tab">Footwear Man</a></li>
                            <li><a href="#Footwear_Womens" data-bs-toggle="tab">Footwear Womens</a></li>
                        </ul>
                    </div>
                    <!-- tabs menu end -->							
                </div>
                <!-- tab content start -->
                <div class="tab-content jump">
                    <!-- tabs one start -->
                    <div role="tabpanel" class="tab-pane active" id="Fashion_Dress">
                        <div class="tab-content-area tab-carousel-5">
                            <div class="product-carousel-5 owl-carousel">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$999.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Voluptas nulla</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$260.00</span>
                                            <span class="regular-price">$299.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Consequences</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$697.00</span>
                                            <span class="regular-price">$784.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$879.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure onally</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$698.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Occaecati ditate</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$400.00</span>
                                            <span class="regular-price">$350.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Nunc facilisis</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$687.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                        </div>
                    </div>
                    <!-- tabs one end -->
                    <!-- tabs two start -->
                    <div role="tabpanel" class="tab-pane" id="Footwear_Man">
                        <div class="tab-content-area tab-carousel-6">
                            <div class="product-carousel-6 owl-carousel">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$900.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Accumsan elit</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/12.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Etiam gravida</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$500.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/1.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Quisque in arcu</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$799.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/2.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec ac tempus</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$354.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/3.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pellente habitant </a></h2>
                                        <div class="product-price">													<span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                        </div>
                    </div>
                    <!-- tabs two end -->
                    <!-- tabs three start -->
                    <div role="tabpanel" class="tab-pane" id="Footwear_Womens">
                        <div class="tab-content-area tab-carousel-7">
                            <div class="product-carousel-7 owl-carousel">
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/4.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Donec non est</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$780.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/5.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$987.00</span>
                                            <span class="regular-price">$876.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/6.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Consequences</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/7.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Primis in faucibus</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$963.00</span>
                                            <span class="regular-price">$920.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/8.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Pleasure onally</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$750.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/9.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Cras neque metus</a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$800.00</span>
                                            <span class="regular-price">$850.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/10.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Proin lectus ipsum</a></h2>
                                        <div class="product-price">
                                            <span class="regular-price">$687.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                                <!-- single-product-item start -->
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <div class="sale-stiker product-sticker">
                                            <img src="./assets/assets_customer/img/product/sale1.png" alt="product sticker" />
                                        </div>											
                                        <div class="product-sticker">
                                            <img src="./assets/assets_customer/img/product/new1.png" alt="product sticker" />
                                        </div>			
                                        <a href="single-product.html" title=""><img src="./assets/assets_customer/img/product/home1/11.jpg" alt="product image" /></a>
                                        <div class="single-product-overlay">
                                            <div class="rating-box">
                                                <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                                <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                            <div class="product-quick-view">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-copy"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-text">
                                        <h2><a class="product-title" href="single-product.html" title="">Accumsan elit </a></h2>
                                        <div class="product-price">
                                            <span class="old-price">$680.00</span>
                                            <span class="regular-price">$580.00</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <p><a href="#" title="Add to Cart">Add to Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-item end -->
                            </div>
                        </div>
                    </div>
                    <!-- tabs three end -->
                </div>						
                <!-- tab content end -->
            </div>
        </div>
    </div>
</section>		
<!-- most viewed product area end -->
<!-- new product area start -->
<section class="new-product-area">
    <div class="container">
        <div class="section-heading">
            <h2><span>new</span> Products</h2>
        </div>			
        <div class="row flex-row-reverse">
            <div class="col-12 col-lg-9 col-md-9">
                <!-- new-product start -->
                <div class="block4 sidebar-product">
                    <div class="new-product owl-carousel">
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Quisque in arcu"><img src="./assets/assets_customer/img/product/sidebar/home1/1.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Quisque in arcu">Quisque in arcu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                        <span class="old-price">$800.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Aliquam equat"><img src="./assets/assets_customer/img/product/sidebar/home1/2.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Aliquam equat">Aliquam equat</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$700.00</span>
                                        <span class="old-price">$750.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Pellente habitant "><img src="./assets/assets_customer/img/product/sidebar/home1/3.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Pellente habitant ">Pellente habitant </a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$400.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Eget non arcu"><img src="./assets/assets_customer/img/product/sidebar/home1/8.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Eget non arcu">Eget non arcu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Facilisis sagittis"><img src="./assets/assets_customer/img/product/sidebar/home1/9.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Facilisis sagittis">Facilisis sagittis</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$699.00</span>
                                        <span class="old-price">$599.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Nulla purus"><img src="./assets/assets_customer/img/product/sidebar/home1/10.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Nulla purus">Nulla purus</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$500.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Ullamc tincidu"><img src="./assets/assets_customer/img/product/sidebar/home1/11.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Ullamc tincidu">Ullamc tincidu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$220.00</span>
                                        <span class="old-price">$180.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Mollis eget non"><img src="./assets/assets_customer/img/product/sidebar/home1/4.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Mollis eget non">Mollis eget non</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$999.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Various versions"><img src="./assets/assets_customer/img/product/sidebar/home1/5.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Various versions">Various versions</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$650.00</span>
                                        <span class="old-price">$550.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Ullamc tincidu"><img src="./assets/assets_customer/img/product/sidebar/home1/6.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Ullamc tincidu">Ullamc tincidu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$220.00</span>
                                        <span class="old-price">$180.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Mollis eget non"><img src="./assets/assets_customer/img/product/sidebar/home1/7.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Mollis eget non">Mollis eget non</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$999.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Various versions"><img src="./assets/assets_customer/img/product/sidebar/home1/1.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Various versions">Various versions</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$650.00</span>
                                        <span class="old-price">$550.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Ullamc tincidu"><img src="./assets/assets_customer/img/product/sidebar/home1/2.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Ullamc tincidu">Ullamc tincidu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$220.00</span>
                                        <span class="old-price">$180.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Mollis eget non"><img src="./assets/assets_customer/img/product/sidebar/home1/3.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Mollis eget non">Mollis eget non</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$999.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Various versions"><img src="./assets/assets_customer/img/product/sidebar/home1/7.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Various versions">Various versions</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$650.00</span>
                                        <span class="old-price">$550.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                        <!-- single carousel item start -->
                        <div class="item">
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Ullamc tincidu"><img src="./assets/assets_customer/img/product/sidebar/home1/4.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Ullamc tincidu">Ullamc tincidu</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$220.00</span>
                                        <span class="old-price">$180.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Mollis eget non"><img src="./assets/assets_customer/img/product/sidebar/home1/9.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Mollis eget non">Mollis eget non</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$999.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->
                            <!-- single product item start -->										
                            <div class="block4-single-item">
                                <div class="block4-pro-img">
                                    <a href="single-product.html" title="Various versions"><img src="./assets/assets_customer/img/product/sidebar/home1/6.jpg" alt="product image" /></a>
                                </div>
                                <div class="block4-pro-text">
                                    <a class="product-title" href="single-product.html" title="Various versions">Various versions</a>
                                    <div class="rating-box">
                                        <a title="1 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="2 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="3 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="4 star" class="rated" href="#"><i class="fa fa-star-o"></i></a>
                                        <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                    <div class="product-price">
                                        <span class="regular-price">$650.00</span>
                                        <span class="old-price">$550.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- single product item end -->									
                        </div>
                        <!-- single carousel item end -->
                    </div>
                </div>
                <!-- new-product end -->
            </div>
            <div class="col-12 col-lg-3 col-md-3">
                <div class="single-image-add">
                    <a href="#"><img src="./assets/assets_customer/img/add/banner13.jpg" alt="GreenTech" /></a>
                </div>						
            </div>
        </div>
    </div>
</section>
<!-- new product area end -->
<!-- Shop by category area start -->
<section class="shop-by-category">
    <div class="container">
        <div class="section-heading">
            <h2><span>Shop</span> by categories</h2>
        </div>				
        <div class="row">
            <!-- single-category-box start -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">Games & Software</a></h2>
                        <ul>
                            <li><a href="#">TV & Video</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Car Electronics</a></li>
                            <li><a href="#">Cell Phones</a></li>
                            <li><a href="#">Desktops & Key</a></li>
                            <li><a href="#">Digital SLRs</a></li>
                            <li><a href="#">Digital Software</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/2.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->
            <!-- single-category-box start -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">Laptop & Computer</a></h2>
                        <ul>
                            <li><a href="#">Vintage Electronics</a></li>
                            <li><a href="#">Telecommunications?</a></li>
                            <li><a href="#">Portable Audio</a></li>
                            <li><a href="#">Video & Home</a></li>
                            <li><a href="#">Home Surveillance</a></li>
                            <li><a href="#">Home Telephones</a></li>
                            <li><a href="#">Communication</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/1.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->
            <!-- single-category-box start -->					
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">Fashion & Dress</a></h2>
                        <ul>
                            <li><a href="#">Footwear Man</a></li>
                            <li><a href="#">Footwear Womens</a></li>
                            <li><a href="#">Platinum Bands</a></li>
                            <li><a href="#">Gold Ring</a></li>
                            <li><a href="#">Platinum Rings</a></li>
                            <li><a href="#">Silver Ring</a></li>
                            <li><a href="#">Tungsten Ring</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/4.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->
            <!-- single-category-box start -->					
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">baby Toys & Kids</a></h2>
                        <ul>
                            <li><a href="#">Clog sandals</a></li>
                            <li><a href="#">Babies  2 months</a></li>
                            <li><a href="#">3+ Years</a></li>
                            <li><a href="#">Little Kids  1-5 years</a></li>
                            <li><a href="#">Big Kids  6-9 years</a></li>
                            <li><a href="#">Toys Just Landed</a></li>
                            <li><a href="#">Shop All Toys</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/3.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->
            <!-- single-category-box start -->					
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">Sport & Healthy</a></h2>
                        <ul>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Skateboarding</a></li>
                            <li><a href="#">Exercise & Fitness</a></li>
                            <li><a href="#">Fitness Tech</a></li>
                            <li><a href="#">Indoor Games</a></li>
                            <li><a href="#">Play Centres</a></li>
                            <li><a href="#">Pools & Slides</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/5.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->
            <!-- single-category-box start -->					
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-category-box">
                    <div class="shop-category-item">
                        <h2><a href="#">spot Accessories</a></h2>
                        <ul>
                            <li><a href="#">Sunglasses</a></li>
                            <li><a href="#">Hair Accessories</a></li>
                            <li><a href="#">Bags & Wallets</a></li>
                            <li><a href="#">Socks & Tights</a></li>
                            <li><a href="#">Scarves & Gloves</a></li>
                            <li><a href="#">Branded Shop</a></li>
                            <li><a href="#">The Beauty Shop</a></li>
                        </ul>
                    </div>
                    <div class="shop-category-image">
                        <img src="./assets/assets_customer/img/category/6.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- single-category-box end -->				
        </div>
    </div>
</section>
<!-- Shop by category area end -->
<!-- latestpost & about area start -->
<section class="latest-about">
    <div class="container">
        <div class="row">
            <!-- latest-post-area start -->
            <div class="col-12 col-md-12 col-lg-6">
                <div class="latestpost-sec-heading section-heading">
                    <h2><span>latest</span> post</h2>
                </div>					
                <div class="latest-post-area owl-carousel">
                    <!-- single post start -->
                    <div class="single-l-post">
                        <div class="l-post-img">
                            <a href="single-blog.html"><img src="./assets/assets_customer/img/post/blog11_1.jpg" alt="GreenTech" /></a>
                        </div>
                        <div class="l-post-text">
                            <div class="post-info">
                                <div class="post-time">
                                    <p>10 Jan 2015 <span>/</span></p>
                                </div>
                                <div class="posted-by">
                                    <p>post by <a href="#">Admin</a></p>
                                </div>
                            </div>
                            <div class="post-description">
                                <h2><a href="single-blog.html">green tech digital store</a></h2>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod...</p>
                                <a href="single-blog.html" class="readmore">readmore</a>
                            </div>
                        </div>
                    </div>
                    <!-- single post end -->
                    <!-- single post start -->
                    <div class="single-l-post">
                        <div class="l-post-img">
                            <a href="single-blog.html"><img src="./assets/assets_customer/img/post/blog11_1.jpg" alt="GreenTech" /></a>
                        </div>
                        <div class="l-post-text">
                            <div class="post-info">
                                <div class="post-time">
                                    <p>25 Feb 2015 <span>/</span></p>
                                </div>
                                <div class="posted-by">
                                    <p>post by <a href="#">Admin</a></p>
                                </div>
                            </div>
                            <div class="post-description">
                                <h2><a href="single-blog.html">green tech best store</a></h2>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod...</p>
                                <a href="single-blog.html" class="readmore">readmore</a>
                            </div>
                        </div>
                    </div>
                    <!-- single post end -->
                    <!-- single post start -->
                    <div class="single-l-post">
                        <div class="l-post-img">
                            <a href="single-blog.html"><img src="./assets/assets_customer/img/post/blog11_1.jpg" alt="GreenTech" /></a>
                        </div>
                        <div class="l-post-text">
                            <div class="post-info">
                                <div class="post-time">
                                    <p>30 Dec 2015 <span>/</span></p>
                                </div>
                                <div class="posted-by">
                                    <p>post by <a href="#">Admin</a></p>
                                </div>
                            </div>
                            <div class="post-description">
                                <h2><a href="single-blog.html">green tech furniture store</a></h2>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod...</p>
                                <a href="single-blog.html" class="readmore">readmore</a>
                            </div>
                        </div>
                    </div>
                    <!-- single post end -->
                </div>
            </div>
            <!-- latest-post-area end -->
            <!-- about-us-area start -->
            <div class="col-12 col-md-12 col-lg-6">
                <div class="about-sec-heading section-heading">
                    <h2><span>about</span> us</h2>
                </div>						
                <div class="about-us-area">
                    <div class="left-content">
                        <a href="#"><img src="./assets/assets_customer/img/about-us/about-logo.png" alt="GreenTech" /></a>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation suscipit lobortis nisl ut.</p>
                    </div>
                    <div class="right-content">
                        <img src="./assets/assets_customer/img/about-us/about.jpg" alt="GreenTech" />
                    </div>
                </div>
            </div>
            <!-- about-us-area end -->
        </div>
    </div>
</section>

<script>
    <%
        String sucessLogin = (String) session.getAttribute("successLogin");
        if (sucessLogin != null) {
            
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Login Successful!",
        showConfirmButton: false,
        timer: 1000
    });
     
    <% }
        session.removeAttribute("successLogin");
    %>
</script>