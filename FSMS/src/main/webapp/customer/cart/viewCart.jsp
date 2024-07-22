
<%@page import="java.sql.ResultSet"%>
<%
    ResultSet cartItemss = (ResultSet) request.getAttribute("cartItems");
    int totalPrice = 0;
%>

<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- cart table start -->
                <div class="cart-page-main-area">
                    <h2>Shopping Cart</h2>
                    <div class="table-responsive">
                        <table class="table cart-table">
                            <thead>
                                <tr>
                                    <th class="width-1">Remove</th>
                                    <th class="width-2">Images</th>
                                    <th class="width-3">Product Name</th>
                                    <th class="width-2">Color</th>
                                    <th class="width-2">Size</th>
                                    <th class="width-6">Unit Price</th>	
                                    <th class="width-7">Quantity</th>	
                                    <th class="width-8">Subtotal</th>	
                                </tr>														
                            </thead>
                            <tbody>
                                <%
                                    while (cartItemss.next()) {
                                        totalPrice += cartItemss.getInt("CartQuantity") * cartItemss.getInt("Price");
                                %>

                                <tr class="carttr_1">
                                    <td>
                                        <div class="cartpage-item-remove">
                                            <a href="/cart/delete?productID=<%=cartItemss.getString("ProductID")%>&productTypeID=<%=cartItemss.getString("ProductTypeID")%>" title="Remove">Remove</a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cartpage-image">
                                            <a href="/products/detail?id=<%=cartItemss.getString("ProductID")%>"><img src="${pageContext.request.contextPath}/assets/images/product/<%=cartItemss.getString("Image")%>" alt="" /></a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cartpage-pro-dec">
                                            <p><a href="/products/detail?id=<%=cartItemss.getString("ProductID")%>"><%=cartItemss.getString("Name")%></a></p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cartpage-pro-dec">
                                            <p><%=cartItemss.getString("Color")%></p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cartpage-pro-dec">
                                            <p><%=cartItemss.getString("Size")%></p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cart-pro-price">
                                            <p><%=cartItemss.getInt("Price")%>vnd</p>
                                            <p style="display: none" id="price-<%=cartItemss.getInt("ProductID") + "-" + cartItemss.getInt("ProductTypeID")%>"><%=cartItemss.getInt("Price")%></p>
                                        </div>											
                                    </td>
                                    <td>
                                        <div id="cart-plus-minus-effect-<%=cartItemss.getInt("ProductID") + "-" + cartItemss.getInt("ProductTypeID")%>" class="cart-plus-minus">
                                            <input id="product-quantity-<%=cartItemss.getInt("ProductID") + "-" + cartItemss.getInt("ProductTypeID")%>" class="cart-plus-minus-box cartItems" type="text" name="qtybutton" value="<%=cartItemss.getInt("CartQuantity")%>">
                                            <p style="font-size: 12px;display: none" id="<%=cartItemss.getInt("ProductID") + "-" + cartItemss.getInt("ProductTypeID")%>"><%=cartItemss.getInt("ProductTypeQuantity")%></p>
                                        </div>
                                        <p style="font-size: 12px"><%=cartItemss.getInt("ProductTypeQuantity")%> available</p>
                                    </td>
                                    <td>
                                        <div class="cart-pro-price">
                                            <p id="subprice-<%=cartItemss.getInt("ProductID") + "-" + cartItemss.getInt("ProductTypeID")%>" class="subprice"><%=cartItemss.getInt("CartQuantity") * cartItemss.getInt("Price")%>vnd</p>

                                        </div>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>									
                        </table>
                    </div>
                    <div class="cartpage-button">
                        <div class="button-left">
                            <a href="/products/list2" class="add-tag-btn cartpage-btn-1">Continue Shopping</a>
                        </div>
                        <div class="button-right">

                            <div class="cartpage-total-price">
                                <div class="cart-pro-price">
                                    <p id="total-price" style="margin-bottom: 10px">Total: <%=totalPrice%>vnd</p>
                                </div>
                                <a href="#" class="add-tag-btn">Proceed to Checkout</a>								
                            </div>
                        </div>	
                    </div>							
                </div>

                <script>
                    let cartItems = document.querySelectorAll(".cartItems");
                    cartItems.forEach(function (cartItem) {
                        let nextElement = cartItem.nextElementSibling;
                        let quantityInput = document.querySelector("#product-quantity-" + nextElement.id);
                        let plusMinusEffect = document.querySelector("#cart-plus-minus-effect-" + nextElement.id);

                        let price = document.querySelector("#price-" + nextElement.id);
                        let subPrice = document.querySelector("#subprice-" + nextElement.id);


                        let maxSize = parseInt(nextElement.textContent, 10)
                        // Thêm s? ki?n 'change' cho input 'product-quantity'
                        quantityInput.addEventListener("change", function () {
                            var quantity = this.value;
                            if (isNaN(Number(quantity))) {
                                this.value = 1;
                            } else if (quantity < 1) {
                                this.value = 1;
                            } else if (quantity > maxSize) {
                                this.value = maxSize;
                            }
                            subPrice.textContent = (parseInt(price.textContent, 10) * parseInt(this.value, 10)).toString() + "vnd"

                            //Total Price
                            var subpriceElements = document.querySelectorAll('.subprice');

                            var total = 0;

                            subpriceElements.forEach(function (element) {
                                var valueText = element.textContent.replace('vnd', '').trim();

                                var valueNumber = parseInt(valueText, 10);

                                if (!isNaN(valueNumber)) {
                                    total += valueNumber;
                                }
                                
                            });
                            let totalPrice = document.querySelector("#total-price");
                            totalPrice.textContent = "Total: " + total + "vnd"

                            let params = new URLSearchParams();
                            params.append("updateItems", "updateItems");
                            
                            let parts  = nextElement.id.split('-');
                            let productID  = parts[0]
                            let productTypeID  = parts[1]
                            
                            params.append("productID", productID);
                            params.append("productTypeID", productTypeID);
                            params.append("quantity", quantity);

                            fetch("/cart/update", {
                                method: "POST",
                                headers: {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                },
                                body: params.toString()
                            })
                                    .then(response => response.json())
                                    .then(data => fetchCartItems())
                                    .catch(error => console.error("Error:", error));
                            
                        });

                        plusMinusEffect.addEventListener("click", function () {
                            var quantity = quantityInput.value;
                            if (isNaN(Number(quantity))) {
                                quantityInput.value = 1;
                            } else if (quantity < 1) {
                                quantityInput.value = 1;
                            } else if (quantity > maxSize) {
                                quantityInput.value = maxSize;
                            }
                            subPrice.textContent = (parseInt(price.textContent, 10) * parseInt(quantityInput.value, 10)).toString() + "vnd"

                            //Total Price
                            var subpriceElements = document.querySelectorAll('.subprice');

                            var total = 0;

                            subpriceElements.forEach(function (element) {
                                var valueText = element.textContent.replace('vnd', '').trim();

                                var valueNumber = parseInt(valueText, 10);

                                if (!isNaN(valueNumber)) {
                                    total += valueNumber;
                                }

                            });
                            let totalPrice = document.querySelector("#total-price");
                            totalPrice.textContent = "Total: " + total + "vnd"


                            let params = new URLSearchParams();
                            params.append("updateItems", "updateItems");
                            
                            let parts  = nextElement.id.split('-');
                            let productID  = parts[0]
                            let productTypeID  = parts[1]
                            
                            params.append("productID", productID);
                            params.append("productTypeID", productTypeID);
                            params.append("quantity", quantity);

                            fetch("/cart/update", {
                                method: "POST",
                                headers: {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                },
                                body: params.toString()
                            })
                                    .then(response => response.json())
                                    .then(data => fetchCartItems())
                                    .catch(error => console.error("Error:", error));
                        });
                    })
                </script>                
            </div>
        </div>
    </div>	
</section>