<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<style>
    /* Custom styles for order detail page */
    .track-line {
        height: 2px !important;
        background-color: #488978;
        opacity: 1;
    }

    .dot {
        height: 10px;
        width: 10px;
        margin-left: 3px;
        margin-right: 3px;
        margin-top: 0px;
        background-color: #488978;
        border-radius: 50%;
        display: inline-block;
    }

    .big-dot {
        height: 25px;
        width: 25px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
        background-color: #488978;
        border-radius: 50%;
        display: inline-block;
    }

    .big-dot i {
        font-size: 12px;
    }

    .card-stepper {
        z-index: 0
    }

    .nav-tabs .nav-link {
        color: #00A9E0;
    }

    .nav-tabs .nav-link.active {
        background-color: #00A9E0;
        color: white;
    }

    .nav-tabs .nav-item {
        flex: 1;
        text-align: center;
    }

    .nav-tabs {
        display: flex;
        justify-content: space-around;
    }

    .tab-content {
        border: 1px solid #ddd;
        border-top: none;
        padding: 20px;
        background-color: #f9f9f9;
    }

    .order-list {
        margin-top: 20px;
    }

    .order-item {
        background-color: #fff;
        padding: 15px;
        margin-bottom: 10px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        position: relative;
        margin-top: 20px;
    }

    .product-list {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .product-item {
        display: flex;
        align-items: center;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #f1f1f1;
    }

    .product-item img {
        width: 100px;
        height: auto;
        margin-right: 10px;
    }

    .product-details {
        display: flex;
        flex-direction: column;
    }

    .order-footer {
        bottom: 15px;
        right: 15px;
        text-align: right;
        margin: 20px 0;
    }

    .total-price {
        font-family: 'Poppins', sans-serif;
    }

</style>

<section style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <form id="formCreateOrder" action="/orders/create" method="post">
                <div class="col">
                    <h1 style="font-size: 25px">Checkout</h1>

                    <div class="order-item">
                        <span class="lead fw-normal">Address</span>
                        <div class="form-group local-forms">
                            <textarea style="margin-top: 10px" id="address" name="address" class="form-control"
                                      rows="2" placeholder="Enter Address"></textarea>
                            <div class="message"></div>
                        </div>
                    </div>

                    <div class="order-item">
                        <div class="product-list">
                            <%
                                ResultSet cartItemss = (ResultSet) request.getAttribute("cartItems");
                                int totalPrice = 0;
                                while (cartItemss.next()) {
                                    totalPrice += cartItemss.getInt("CartQuantity") * cartItemss.getInt("Price");
                            %>
                            <div class="product-item">
                                <img src="${pageContext.request.contextPath}/assets/images/product/<%=cartItemss.getString("Image")%>" alt="Product Image">
                                <div class="product-details">
                                    <p><%=cartItemss.getString("Name")%></p>
                                    <p>Size: <%=cartItemss.getString("Size")%></p>
                                    <p>Color: <%=cartItemss.getString("Color")%></p>
                                    <p>Quantity: <%=cartItemss.getString("CartQuantity")%></p>
                                    <p>Price:<%=cartItemss.getString("Price")%></p>
                                    <p>SubPrice:<%=cartItemss.getInt("Price") * cartItemss.getInt("CartQuantity")%></p>
                                </div>
                            </div>
                            <%}%>
                        </div>

                        <div class="order-footer">
                            <div class="total-price">
                                <strong>Total Product Price: <span style="color:#ee4d2d"><%=totalPrice%>vnd</span></strong>
                            </div>
                        </div>
                    </div>

                    <div class="order-item">
                        <span class="lead fw-normal">Voucher</span>
                        
                    </div>

                    <div class="order-item">
                        <span class="lead fw-normal">Payment Method</span>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="cod" checked>
                            <label class="form-check-label" for="cod">
                                Cash on Delivery
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="vnpay" value="vnpay">
                            <label class="form-check-label" for="vnpay">
                                VN Pay
                            </label>
                        </div>
                    </div>

                    <div class="order-item">
                        <div class="order-footer">
                            <div class="total-price">
                                <strong>Total Product Price: <span style="color:#ee4d2d"><%=totalPrice%>vnd</span></strong>
                            </div>
                            <div class="total-price"><strong>Voucher: <span style="color:#ee4d2d">vnd</span></strong></div>
                            <div class="total-price"><strong>Total: <span style="color:#ee4d2d">vnd</span></strong></div>
                            <div class="total-price"><strong>Shipping Method: <span style="color:#ee4d2d"></span></strong></div>
                            <div>
                                <button style="background: #ea7127;border-color:#ea7127;margin-top: 20px" type="submit" class="btn btn-primary">Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    Validator({
        form: "#formCreateOrder",
        message: ".message", // Selector class
        invalid: "invalid", // Class name for invalid input
        rules: [
            Validator.isRequire("#address", "Address is required"),
        ]
    });
</script>
