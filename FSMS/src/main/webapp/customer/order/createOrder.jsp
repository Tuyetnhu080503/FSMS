<%@page import="Models.Account"%>
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


    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

    .card {
        width: 400px;
        height: 150px;
        border-radius: 5px;
        box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
        background-color: #ffeded !important;
        padding: 10px 10px;
        position: relative;
    }

    .main,
    .copy-button {
        display: flex;
        justify-content: space-between;
        padding: 0 10px;
        align-items: center;
    }
    .card::after {
        position: absolute;
        content: "";
        height: 40px;
        right: -20px;
        border-radius: 40px;
        z-index: 1;
        top: 50px;
        background-color:#fff;
        width: 40px;
    }

    .card::before {
        position: absolute;
        content: "";
        height: 40px;
        left: -20px;
        border-radius: 40px;
        z-index: 1;
        top: 50px;
        background-color: #fff;
        width: 40px;
    }

    .co-img img {
        width: 100px;
        height: 100px;
    }
    .vertical {
        border-left: 5px dotted black;
        height: 100px;
        position: absolute;
        left: 40%;
    }

    .content h1 {
        font-size: 35px;
        margin-left: -20px;
        color: #565656;
    }

    .content h1 span {
        font-size: 18px;
    }
    .content h2 {
        font-size: 18px;
        margin-left: -20px;
        color: #565656;
        text-transform: uppercase;
    }

    .content p {
        font-size: 16px;
        color: #696969;
        margin-left: -20px;
    }

    .copy-button {
        margin: 12px 0 -5px 0;
        height: 45px;
        border-radius: 4px;
        padding: 0 5px;
        border: 1px solid #e1e1e1;
    }

    .copy-button input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
        font-size: 15px;
    }

    .copy-button button {
        padding: 5px 20px;
        background-color: #dc143c;
        color: #fff;
        border: 1px solid transparent;
    }

    .buy{
        position: absolute;
        content: "";
        bottom: 20px;
        left:20px;
        background-color: #dc143c;
    }

    .voucher-list {
        max-height: 400px; /* Set a max height for the voucher list */
        overflow-y: auto; /* Enable vertical scrolling */
    }

    .voucher-list .card {
        margin-bottom: 10px;
        cursor: pointer;
    }

    .voucher-list .card.valid-voucher {
        border: 2px solid green;
    }

    .voucher-list .card.invalid-voucher {
        border: 2px solid red;
    }

    .clicking {
        border: 3px solid blue !important;
    }

    .login-danger{
        color: red;
    }
</style>
<%Account accs = (Account)session.getAttribute("acc"); %>
<section style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <form id="formCreateOrder" action="/orders/create" method="post">
                <div class="col">
                    <h1 style="font-size: 25px">Checkout</h1>

                    <div class="order-item">

                        <div class="form-group local-forms">
                            <label>Full Name <span class="login-danger">*</span></label>
                            <input id="fullname" name="fullname" class="form-control" type="text"
                                   placeholder="Enter Full Name" value="<%=accs.getFirstName() + " " + accs.getLastName() %>">
                            <div class="message"></div>
                        </div>
                        <div class="form-group local-forms">
                            <label>Phone <span class="login-danger">*</span></label>
                            <input id="phone" name="phone" class="form-control" type="text"
                                   placeholder="Enter Phone" value="<%=accs.getPhoneNumber()%>">
                            <div class="message"></div>
                        </div>
                        <div class="form-group local-forms">
                            <label>Address<span class="login-danger">*</span></label>
                            <textarea style="margin-top: 10px" id="address" name="address" class="form-control"
                                      rows="2" placeholder="Enter Address"><%=accs.getAddress()%></textarea>
                            <div class="message"></div>
                        </div>

                    </div>

                    <div class="order-item">
                        <table class="table cart-table">
                            <thead>
                                <tr>
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
                                    ResultSet cartItemss = (ResultSet) request.getAttribute("cartItems");
                                    ResultSet voucherRs = (ResultSet) request.getAttribute("voucherRs");
                                    int totalPrice = 0;
                                    while (cartItemss.next()) {
                                        totalPrice += cartItemss.getInt("CartQuantity") * cartItemss.getInt("Price");
                                %>
                                <tr class="carttr_1">

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
                                        <p><%=cartItemss.getInt("CartQuantity")%></p>
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


                        <div class="order-footer">
                            <div class="total-price">
                                <strong>Total Product Price: <span style="color:#ee4d2d"><%=totalPrice%>vnd</span></strong>
                            </div>
                        </div>
                    </div>

                    <div class="order-item">
                        <div style="display: flex;justify-content: space-between">
                            <span class="lead fw-normal">Voucher</span>

                            <span style="font-size: 16px;color: #05a!important" class="lead fw-normal btn voucher-button"><span id="voucher-click" style="color:red;margin-right: 20px;font-size: 20px;font-weight: bold"></span>Choose Voucher</span>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="voucherModal" tabindex="-1" role="dialog" aria-labelledby="voucherModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="voucherModalLabel">Choose Voucher</h5>
                                        <button type="button" class="close voucher-close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="voucher-list" style="display: flex;align-items: center;flex-direction: column">
                                            <!-- Voucher items will be added here dynamically -->
                                            <%while (voucherRs.next()) {%>
                                            <div class="card <%=voucherRs.getInt("MinimumPrice") <= totalPrice ? "valid-voucher" : "invalid-voucher"%> " data-voucher-id="<%=voucherRs.getInt("VoucherID")%>" data-voucher-amount="<%=voucherRs.getInt("DiscountAmount")%>" data-voucher-percent="<%=voucherRs.getInt("DiscountPercentage") == 0 ? 0 : voucherRs.getInt("DiscountPercentage")%>" data-total-price="<%=totalPrice%>" data-quantity="<%=voucherRs.getInt("Quantity")%>">
                                                <div class="main">
                                                    <div class="co-img">
                                                        <a href="/voucher?id=<%=voucherRs.getInt("VoucherID")%>"><img src="${pageContext.request.contextPath}/assets/images/voucher/voucher.png" alt=""/></a>
                                                    </div>
                                                    <div class="vertical"></div>
                                                    <div class="content">
                                                        <h2 style="font-size: 15px">Maximum discount <%=voucherRs.getInt("DiscountAmount")%></h2>
                                                        <p style="font-size: 15px">Minimum order <%=voucherRs.getInt("MinimumPrice")%></p>

                                                        <h1 style="font-size: 20px"><%=voucherRs.getInt("DiscountPercentage") == 0 ? "" : voucherRs.getInt("DiscountPercentage") + "%"%> <span style="font-size: 15px"><%=voucherRs.getInt("DiscountPercentage") == 0 ? "" : "Coupon"%></span></h1>
                                                        <p style="font-size: 15px">Valid till <%=voucherRs.getDate("ExpiryDate")%></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                    <input type="hidden" name="voucherID" id="voucherID" value="0">
                    <input type="hidden" name="totalFinal" id="total-final" value="<%=totalPrice%>">
                    <input type="hidden" name="voucherQuantity" id="voucherQuantity" value="0">
                    <div class="order-item">
                        <div class="order-footer">
                            <div class="total-price">
                                <strong>Total Product Price: <span style="color:#ee4d2d"><%=totalPrice%>vnd</span></strong>
                            </div>
                            <div class="total-price"><strong>Voucher: <span id="voucher-dec" style="color:#ee4d2d">0vnd</span></strong></div>
                            <div class="total-price"><strong>Total: <span id="total-f" style="color:#ee4d2d"><%=totalPrice%>vnd</span></strong></div>
                            <div class="total-price"><strong>Shipping Method: <span style="color:#ee4d2d">Cash on Delivery</span></strong></div>

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


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->                            
<script>
    Validator({
        form: "#formCreateOrder",
        message: ".message", // Selector class
        invalid: "invalid", // Class name for invalid input
        rules: [
            Validator.isRequire("#fullname", "Full Name is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
        ]
    });
</script>
<script>
    $(document).ready(function () {
        // Show the modal when "Choose Voucher" is clicked
        $('.voucher-button').click(function () {
            $('#voucherModal').modal('show');
        });

        $('.voucher-close').click(function () {
            $('#voucherModal').modal('hide');
        });

        // Handle voucher selection
        $('.voucher-list').on('click', '.card.valid-voucher', function () {


            const cards = document.querySelectorAll('.card.valid-voucher');
            cards.forEach(card => {
                card.classList.remove('clicking');
            });

            this.classList.add('clicking');


            var voucherId = $(this).data('voucher-id');
            var voucherAmount = $(this).data('voucher-amount');
            var voucherPercent = $(this).data('voucher-percent');
            var totalOrder = $(this).data('total-price');
            var quantity = $(this).data('quantity');
            // Implement the logic to apply the voucher here, e.g., update the total price

            console.log(voucherId)
            console.log(voucherAmount)
            console.log(voucherPercent)
            console.log(totalOrder)
            console.log(quantity)

            if (voucherPercent != 0) {
                if (((voucherAmount / 100) * totalOrder) > voucherAmount) {
                    // voucherAmount
                    document.getElementById("voucher-dec").textContent = "-" + voucherAmount + "vnd";
                    document.getElementById("total-f").textContent = (totalOrder - voucherAmount) + "vnd";
                    document.getElementById("voucherID").value = voucherId;
                    document.getElementById("total-final").value = (totalOrder - voucherAmount);
                    document.getElementById("voucherQuantity").value = quantity;
                    document.getElementById("voucher-click").textContent = "-" + voucherAmount + "vnd";
                } else {
                    //(voucherAmount/100)*totalOrder
                    document.getElementById("voucher-dec").textContent = "-" + (voucherAmount / 100) * totalOrder + "vnd";
                    document.getElementById("total-f").textContent = (totalOrder - (voucherAmount / 100) * totalOrder) + "vnd";
                    document.getElementById("voucherID").value = voucherId;
                    document.getElementById("total-final").value = (totalOrder - (voucherAmount / 100) * totalOrder);
                    document.getElementById("voucherQuantity").value = quantity;
                    document.getElementById("voucher-click").textContent = "-" + (voucherAmount / 100) * totalOrder + "vnd";
                }
            } else {
                //voucherAmount
                document.getElementById("voucher-dec").textContent = "-" + voucherAmount + "vnd";
                document.getElementById("total-f").textContent = (totalOrder - voucherAmount) + "vnd";
                document.getElementById("voucherID").value = voucherId;
                document.getElementById("total-final").value = (totalOrder - voucherAmount);
                document.getElementById("voucherQuantity").value = quantity;
                document.getElementById("voucher-click").textContent = "-" + voucherAmount + "vnd";
            }

            // Hide the modal
            $('#voucherModal').modal('hide');
        });

        // Optional: Add click event for invalid vouchers to show a message or redirect
        $('.voucher-list').on('click', '.card.invalid-voucher', function () {

        });
    });
</script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

