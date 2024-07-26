<%@page import="Models.ProductType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Product"%>

<%
    Product product = (Product) request.getAttribute("product");

    ResultSet colors = (ResultSet) request.getAttribute("colors");

    ResultSet sizes = (ResultSet) request.getAttribute("sizes");

    ArrayList<ProductType> productTypes = (ArrayList<ProductType>) request.getAttribute("productTypes");
    
    ResultSet allComment = (ResultSet) request.getAttribute("allComment");
    
    int starAVG = (int) request.getAttribute("starAVG");
            
    int commentNumber = (int) request.getAttribute("commentNumber");

%>

<style>


    .card {
        border: none;
        box-shadow: 5px 6px 6px 2px #e9ecef;
        border-radius: 4px;
    }

    .dots{

        height: 4px;
        width: 4px;
        margin-bottom: 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
    }

    .badge{

        padding: 7px;
        padding-right: 9px;
        padding-left: 16px;
        box-shadow: 5px 6px 6px 2px #e9ecef;
    }

    .user-img{

        margin-top: 4px;
    }

    .check-icon{

        font-size: 17px;
        color: #c3bfbf;
        top: 1px;
        position: relative;
        margin-left: 3px;
    }

    .form-check-input{
        margin-top: 6px;
        margin-left: -24px !important;
        cursor: pointer;
    }


    .form-check-input:focus{
        box-shadow: none;
    }


    .icons i{

        margin-left: 8px;
    }
    .reply{

        margin-left: 12px;
    }

    .reply small{

        color: #b7b4b4;

    }

    .small, small{
        font-size: 16px;
    }
    .reply small:hover{

        color: green;
        cursor: pointer;

    }
    
    .comment-list {
        max-height: 1200px; 
        overflow-y: auto; 
    }
</style>

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
                                <%if(starAVG == 1){%>
                                    <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                </div>	
                                <%}else if(starAVG == 2){%>
                                    <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                </div>	
                                
                                <%}else if(starAVG == 3){%>
                                <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                </div>
                                
                                <%}else if(starAVG == 4){%>
                                <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                </div>
                                
                                <%}else if(starAVG == 5){%>
                                <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                </div>
                                <%}else{%>
                                 <div class="rating-box">
                                    <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="4 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                    <a title="5 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                </div>
                                <%}%>
                                
                                <p><span><a href="#"><%=commentNumber %> Reviews (s)</a> </span>
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
                                let minQuantity = 1;
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

                                    if (document.getElementById("product-quantity").value == 0) {
                                        Swal.fire({
                                            position: "center",
                                            icon: "error",
                                            title: "Product is out of stock!",
                                            showConfirmButton: false,
                                            timer: 2000
                                        })
                                        return;
                                    }
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
                                            if (data.login == "fail") {
                                                Swal.fire({
                                                    position: "center",
                                                    icon: "error",
                                                    title: "You must be login before add to cart!",
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                })
                                                return;
                                            }
                                            if (data.status == "success") {
                                                Swal.fire({
                                                    position: "center",
                                                    icon: "success",
                                                    title: "Add To Cart Successful!",
                                                    showConfirmButton: false,
                                                    timer: 1000
                                                })
                                            } else {
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
                                                if (productTypes[i][2] == 0) {
                                                    document.getElementById("product-quantity").value = 0;
                                                    minQuantity = 0;
                                                }
                                                else{
                                                    document.getElementById("product-quantity").value = 1;
                                                    minQuantity = 1;
                                                }
                                                console.log(productTypes[i][2])
                                            }
                                        }
                                    } else {
                                        document.getElementById("quantity-available").style.display = "none";
                                    }
                                });

                                document.getElementById("product-quantity").addEventListener("change", function () {
                                    var quantity = this.value;
                                    if (isNaN(Number(quantity))) {
                                        this.value = minQuantity;
                                    } else if (quantity < 1) {
                                        this.value = minQuantity;
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
                            <li><a href="#proReview" data-bs-toggle="tab" class="active" >reviews (<%=commentNumber %>)</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="product-tab-content tab-content jump">
                            <div class="tab-pane active" id="proReview">
                                <div class="container">
                                    <div class="row comment-list">
                                        <%while(allComment.next()){
                                            int star = allComment.getInt("Rating");
                                            String image = allComment.getString("Image");
                                            System.out.println("Image value:" + image);
                                            %>
                                            <div class="col-md-12 mt-2">
                                                <div class="card p-3">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div class="user d-flex flex-row align-items-center">
                                                            <img src="${pageContext.request.contextPath}/assets/images/avatar/<%=allComment.getString("Avatar") %>" width="50" class="user-img rounded-circle mr-2">
                                                            <span><small style="margin-left: 20px" class="font-weight-bold text-primary"><%=allComment.getString("Firstname") + " "+  allComment.getString("Lastname")%></small> 
                                                            </span>
                                                        </div>
                                                        <small><%=allComment.getDate("CreateAt")%></small>
                                                    </div>
                                                    <div class="action d-flex  align-items-center">
                                                    <%if(star == 1){%>
                                                            <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>	
                                                        <%}else if(star == 2){%>
                                                            <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>	

                                                        <%}else if(star == 3){%>
                                                        <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#"><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>

                                                        <%}else if(star == 4){%>
                                                        <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>

                                                        <%}else if(star == 5){%>
                                                        <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#" class="rated"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                        <%}else{%>
                                                         <div style="margin-left: 70px" class="rating-box">
                                                            <a title="1 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="2 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="3 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="4 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                            <a title="5 star" href="#" class=""><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                        <%}%>
                                                        <div style="margin-left: 10px " class="rating-box">
                                                            | <%=allComment.getString("Color")%>, Size <%=allComment.getString("Size")%>
                                                        </div>

                                                    </div>
                                                    <small style="margin-left: 70px" class="font-weight-bold mt-2"><%=allComment.getString("Comment")%></small>
                                                    <%if(!image.equals("")){%>
                                                        <img style="margin-left: 70px" src="${pageContext.request.contextPath}/assets/images/comment/<%=image%>" width="100">
                                                    <%}%>
                                                </div>
                                            </div>
                                        <%}%>
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

    </div>	
</section>