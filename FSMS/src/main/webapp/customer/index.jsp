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
            <div class="col-12 col-lg-3"></div>

        </div>
    </div>
</section>
<!-- slider-area end -->
<!-- deal of day product area start -->
<!-- deal of day product area end -->
<!-- Bestseller products area start -->
<!-- Bestseller products area end -->
<!-- block-img-add start -->

<!-- block-img-add end -->
<!-- most viewed product area start -->

<!-- most viewed product area end -->
<!-- new product area start -->

<!-- new product area end -->
<!-- Shop by category area start -->

<!-- Shop by category area end -->
<!-- latestpost & about area start -->


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