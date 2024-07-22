<%@page import="Models.ProductType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Product"%>

<%
    Product product = (Product) request.getAttribute("product");

    ResultSet colors = (ResultSet) request.getAttribute("colors");

    ResultSet sizes = (ResultSet) request.getAttribute("sizes");

    ArrayList<ProductType> productTypes = (ArrayList<ProductType>) request.getAttribute("productTypes");
%>



<section class="main-content-area">
    <div class="container">
        <!-- bradcame start -->
        <div class="row">
            <div class="col-12">
                <div class="greentect_bradcame">
                    <ul>
                        <li><a href="/">home</a></li>
                        <li><a href="products/list2?page=1">Products</a></li>
                        <li>Detail</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- bradcame end -->
        <!-- single page product information start -->
        <div class="single-product-page-area">
            <div class="row">
                <div class="col-12 col-md-5 col-lg-5 col-xl-5">
                    <div class="single-product-image">
                        <div class="single-pro-main-image">
                            <a href="#"><img id="optima_zoom" src="${pageContext.request.contextPath}/assets/images/product/<%=product.getImage()%>" data-zoom-image="${pageContext.request.contextPath}/assets/images/product/<%=product.getImage()%>" alt="optima"/></a>
                        </div>
                    </div>							
                </div>
                <div class="col-12 col-md-7 col-lg-7 col-xl-7">
                    <div class="single-product-description">
                        <div class="pro-desc">
                            <h2><%=product.getName()%></h2>
                            <div class="review_forum">
                                <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                </div>	
                                <p><span><a href="#">0 Reviews (s)</a> | </span> <a href="#"> Add your review</a></p>
                            </div>
                            <div class="pro-availability">
                                <p class="availability">Availability :<span> In stock</span></p>					
                            </div>
                            <span class="regular-price"><%=product.getPrice()%> vnd</span>									
                            <div class="product-content">
                                <p><%=product.getDescription()%></p>
                            </div>
                        </div>
                        <div class="product-variation">
                            <div class="product-quantity">
                                <div class="">
                                    <label style="color: #a6a6a6;
                                           font-size: 14px;
                                           font-weight: normal;
                                           margin-right: 5px; margin-left: 10px">Color: </label>
                                    <select id="product-color" class="form-control" style="display: inline; width: auto; font-size: 13px" >

                                    </select>
                                </div>
                            </div>

                            <div class="product-quantity">
                                <div class="">
                                    <label style="color: #a6a6a6;
                                           font-size: 14px;
                                           font-weight: normal;
                                           margin-right: 5px; margin-left: 10px">Size: </label>
                                    <select id="product-size" class="form-control" style="display: inline; width: auto; font-size: 13px" >

                                    </select>
                                </div>
                            </div>
                            <div class="product-quantity">
                                <div class="cart-plus-minus" id="cart-plus-minus-effect">
                                    <label>Quantity: </label>
                                    <input id="product-quantity" class="cart-plus-minus-box" type="text" name="qtybutton" value="1">
                                </div>
                                <p id="quantity-available" style="margin-left: 30px; display: none"></p>
                            </div>
                            <style>
                                #add-cart{
                                    color:#3c3c3c;
                                }
                                #add-cart:hover{
                                    border-color:#00A9E0;
                                    color:#fff;
                                    cursor: pointer;
                                }
                            </style>
                            <div class="pro-add-to-cart">
                                <p id="add-to-cart-btn" style="text-align: left;width: fit-content"><a id="add-cart" title="Add to Cart" >Add to Cart</a></p>
                                <p id="valid-add-to-cart" style="text-align: left;width: fit-content; color: red; margin-top: 10px; display:none"> Please select product type</p>
                            </div>
                            <script>
                                let maxQuantity = 1000;
                                let productTypes = [];
                                let colors = [];
                                let sizes = [];
                                <% for (ProductType productType : productTypes) {%>
                                productTypes.push(["<%=productType.getColor()%>", "<%=productType.getSize()%>",<%=productType.getQuantity()%>,<%=productType.getProductTypeID()%>]);
                                <% }%>

                                <%while (colors.next()) {%>
                                colors.push("<%=colors.getString("Color")%>");
                                <%}%>

                                <%while (sizes.next()) {%>
                                sizes.push("<%=sizes.getString("Size")%>");
                                <%}%>

                                renderColor()
                                renderSize()

                                function renderColor() {
                                    document.getElementById("product-color").innerHTML = "";
                                    // Populate color options
                                    let colorSelect = document.getElementById("product-color");
                                    let option = document.createElement("option");
                                    option.value = "";
                                    option.textContent = "Select Color";
                                    colorSelect.appendChild(option);

                                    colors.forEach(color => {
                                        let option = document.createElement("option");
                                        option.value = color;
                                        option.textContent = color;
                                        colorSelect.appendChild(option);
                                    });
                                }


                                function renderSize() {
                                    // Populate size options
                                    document.getElementById("product-size").innerHTML = "";
                                    let sizeSelect = document.getElementById("product-size");

                                    let optionS = document.createElement("option");
                                    optionS.value = "";
                                    optionS.textContent = "Select Size";
                                    sizeSelect.appendChild(optionS);
                                    sizes.forEach(size => {
                                        option = document.createElement("option");
                                        option.value = size;
                                        option.textContent = size;
                                        sizeSelect.appendChild(option);
                                    });
                                }


                                document.getElementById("add-to-cart-btn").addEventListener("click", function () {
                                    let color = document.getElementById("product-color").value;
                                    let size = document.getElementById("product-size").value;


                                    if (color === "" || size === "") {
                                        document.getElementById("valid-add-to-cart").style.display = "block";
                                    } else {
                                        document.getElementById("valid-add-to-cart").style.display = "none";
                                        let productID = '<%=product.getProductId()%>';
                                        let quantity = document.getElementById("product-quantity").value;

                                        var params = new URLSearchParams();
                                        params.append("addToCart", "addToCart");
                                        params.append("productID", productID);
                                        params.append("quantity", quantity);

                                        for (let i = 0; i < productTypes.length; i++) {
                                            if (color === productTypes[i][0] && size === productTypes[i][1]) {
                                                params.append("productTypeID", productTypes[i][3]);
                                                break;
                                            }
                                        }

                                        function checkValidAction(data) {
                                            if(data.status == "success"){
                                                Swal.fire({
                                                position: "center",
                                                icon: "success",
                                                title: "Add To Cart Successful!",
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                            }
                                            else{
                                                Swal.fire({
                                                position: "center",
                                                icon: "error",
                                                title: "Exceed Product Quantity!",
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                            }
                                            fetchCartItems()
                                        }

                                        fetch("/cart/add", {
                                            method: "POST",
                                            headers: {
                                                "Content-Type": "application/x-www-form-urlencoded"
                                            },
                                            body: params.toString()
                                        })
                                                .then(response => response.json())
                                                .then(data => checkValidAction(data))
                                                .catch(error => console.error("Error:", error));
                                    }
                                });


                                document.getElementById("product-color").addEventListener("change", function () {

                                    if (this.value != "") {
                                        maxQuantity = 1000
                                        let sizeSelect = document.getElementById("product-size");

                                        document.getElementById("product-size").innerHTML = "";

                                        let optionS = document.createElement("option");
                                        optionS.value = "";
                                        optionS.textContent = "Select Size";
                                        sizeSelect.appendChild(optionS);
                                        for (let i = 0; i < productTypes.length; i++) {
                                            if (document.getElementById("product-color").value === productTypes[i][0]) {
                                                option = document.createElement("option");
                                                option.value = productTypes[i][1];
                                                option.textContent = productTypes[i][1];
                                                sizeSelect.appendChild(option);
                                            }
                                        }

                                        document.getElementById("quantity-available").style.display = "none";
                                    } else if (document.getElementById("product-size").value != "" && this.value != "") {
                                        for (let i = 0; i < productTypes.length; i++) {
                                            if (document.getElementById("product-size").value === productTypes[i][1] && this.value === productTypes[i][0]) {
                                                document.getElementById("quantity-available").style.display = "inline";
                                                document.getElementById("quantity-available").textContent = productTypes[i][2] + " products available";
                                                maxQuantity = productTypes[i][2]
                                            }
                                        }
                                    } else if (this.value == "") {
                                        maxQuantity = 1000
                                        document.getElementById("quantity-available").style.display = "none";
                                        renderSize()
                                        renderColor()
                                    } else {
                                        maxQuantity = 1000
                                        document.getElementById("quantity-available").style.display = "none";
                                    }
                                });

                                document.getElementById("product-size").addEventListener("change", function () {
                                    if (document.getElementById("product-color").value != "" && this.value != "") {
                                        for (let i = 0; i < productTypes.length; i++) {
                                            if (document.getElementById("product-color").value === productTypes[i][0] && this.value === productTypes[i][1]) {
                                                document.getElementById("quantity-available").style.display = "inline";
                                                document.getElementById("quantity-available").textContent = productTypes[i][2] + " products available";
                                                maxQuantity = productTypes[i][2]
                                            }
                                        }
                                    } else {
                                        document.getElementById("quantity-available").style.display = "none";
                                    }
                                });

                                document.getElementById("product-quantity").addEventListener("change", function () {
                                    var quantity = this.value;
                                    if (isNaN(Number(quantity))) {
                                        this.value = 1;
                                    } else if (quantity < 1) {
                                        this.value = 1;
                                    } else if (quantity > maxQuantity) {
                                        this.value = maxQuantity;
                                    }
                                });

                                document.getElementById("cart-plus-minus-effect").addEventListener("click", function () {
                                    var quantity = document.getElementById("product-quantity").value;
                                    if (isNaN(Number(quantity))) {
                                        document.getElementById("product-quantity").value = 1;
                                    } else if (quantity < 1) {
                                        document.getElementById("product-quantity").value = 1;
                                    } else if (quantity > maxQuantity) {
                                        document.getElementById("product-quantity").value = maxQuantity;
                                    }
                                });

                            </script>
                            <div class="product-cart-option">
                                <ul>
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                                </ul>
                            </div>
                        </div>	
                        <div class="single-product-social-share">
                            <img src="img/social-share.jpg" alt="" />
                        </div>										
                    </div>	
                </div>
            </div>
            <!-- product description tab start -->
            <div class="row">
                <div class="col-12">
                    <div class="product-more-info-tab">
                        <!-- Nav tabs -->
                        <ul class="more-info-tab nav nav-tabs">
                            <li><a href="#proDescription" data-bs-toggle="tab" class="active">Product description</a></li>
                            <li><a href="#proReview" data-bs-toggle="tab">reviews</a></li>
                            <li><a href="#proTag" data-bs-toggle="tab">product tags</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="product-tab-content tab-content jump">
                            <div class="tab-pane active" id="proDescription">
                                <div class="tab-description">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla. Donec a neque libero. Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellent  habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec Aliquam equat, purus felis vehicula felis, a dapibus enim lorem nec augue. Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus Males tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate Mollis eget non. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis. </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="proReview">
                                <div class="tab-review-info">
                                    <div class="review-author">
                                        <p><a href="https://example.com/">Admin </a><label> Review by </label> <span> Shaddam</span></p>
                                    </div>
                                    <div class="review-rating">
                                        <p>Quality </p>
                                        <p>price</p>
                                        <p>Value</p>
                                    </div>
                                    <div class="rev-post-time">
                                        <p>Plazathemes <i>(Posted on 9/12/2014)</i></p>
                                    </div>
                                </div>
                                <div class="tab-right-form-table">
                                    <div class="tab-table">
                                        <p>You're reviewing: Pellent  habitant </p>
                                        <label>How do you rate this product? *</label>
                                        <div class="table-responsive">
                                            <table class="table-data-sheet">
                                                <thead>
                                                    <tr>
                                                        <th> </th>
                                                        <th>1 star</th>
                                                        <th>2 star</th>
                                                        <th>3 star</th>
                                                        <th>4 star</th>
                                                        <th>5 star</th>	
                                                    </tr>														
                                                </thead>
                                                <tbody>
                                                    <tr class="first">
                                                        <td class="left-align">Quality</td>
                                                        <td>
                                                            <input type="radio" value="Quality" name="qty_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Quality" name="qty_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Quality" name="qty_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Quality" name="qty_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Quality" name="qty_rate">
                                                        </td>
                                                    </tr>
                                                    <tr class="meddle">
                                                        <td class="left-align">Price</td>
                                                        <td>
                                                            <input type="radio" value="Price" name="price_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Price" name="price_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Price" name="price_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Price" name="price_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Price" name="price_rate">
                                                        </td>
                                                    </tr>
                                                    <tr class="last">
                                                        <td class="left-align">Value</td>
                                                        <td>
                                                            <input type="radio" value="Value" name="value_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Value" name="value_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Value" name="value_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Value" name="value_rate">
                                                        </td>
                                                        <td>
                                                            <input type="radio" value="Value" name="value_rate">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>															
                                        </div>
                                    </div>
                                    <div class="tab-form">
                                        <div class="form-group">
                                            <label>Nickname <sup>*</sup></label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Summary of Your Review <sup>*</sup></label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Review <sup>*</sup></label>
                                            <textarea></textarea>
                                        </div>
                                        <div class="submit-review">
                                            <a href="#" class="add-tag-btn">Submit Review</a>
                                        </div>
                                    </div>											
                                </div>
                            </div>
                            <div class="tab-pane" id="proTag">
                                <div class="pro-tag-form">
                                    <h3>Other people marked this product with these tags :<br> <a href="#">men</a><span> (1)</span></h3>
                                    <label>Add Your Tags:</label>
                                    <input type="text" class="tag-box form-control" />
                                    <a href="#" class="add-tag-btn">Add Tags</a>
                                    <p>Use spaces to separate tags. Use single quotes (') for phrases.</p>
                                </div>
                            </div>									
                        </div>									
                    </div>										
                </div>						
            </div>
            <!-- product description tab end -->
        </div>
        <!-- single page product information end -->
        <!-- related product start -->
        <div class="related-product">
            <div class="section-heading">
                <h2><span>Related</span> Products</h2>
            </div>	
            <div class="product-carousel-5 owl-carousel">
                <!-- single-product-item start -->
                <div class="single-product-item">
                    <div class="product-image">
                        <div class="sale-stiker product-sticker">
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/1.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/2.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/3.jpg" alt="product image" /></a>
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
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/4.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/5.jpg" alt="product image" /></a>
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
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/6.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/7.jpg" alt="product image" /></a>
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
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/8.jpg" alt="product image" /></a>
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
        <!-- related product end -->
        <!-- upsell product start -->
        <div class="upsell-product">
            <div class="p-0-15 section-heading">
                <h2><span>upsell</span> Products</h2>
            </div>				
            <div class="product-carousel-6 owl-carousel">
                <!-- single-product-item start -->
                <div class="single-product-item">
                    <div class="product-image">
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/9.jpg" alt="product image" /></a>
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
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/10.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/11.jpg" alt="product image" /></a>
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
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/12.jpg" alt="product image" /></a>
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
                            <img src="img/product/sale1.png" alt="product sticker" />
                        </div>											
                        <div class="product-sticker">
                            <img src="img/product/new1.png" alt="product sticker" />
                        </div>			
                        <a href="single-product.html" title=""><img src="img/product/home1/1.jpg" alt="product image" /></a>
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
            </div>					
        </div>
        <!-- upsell product end -->
    </div>	
</section>