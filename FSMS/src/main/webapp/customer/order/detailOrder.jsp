


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
        display: inline-block
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


<%
    ResultSet rsoderIDInformation = (ResultSet) request.getAttribute("rsoderIDInformation");

%>
<section style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card card-stepper" style="border-radius: 10px;">
                    <div class="card-body p-4">

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-column">
                                <span class="lead fw-normal">Order Status</span>
                            </div>

                        </div>
                        <hr class="my-4">
                        <%  LocalDateTime timestamp = LocalDateTime.now();
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                            ResultSet order = (ResultSet) request.getAttribute("order");
                            ResultSet orderStatus = (ResultSet) request.getAttribute("orderStatus");
                            String currentStatus = "";
                            String pendingTime = "";
                            while (order.next()) {
                                currentStatus = order.getString("Status");
                                pendingTime = order.getTimestamp("Createat").toLocalDateTime().format(formatter);
                            }
                            
                        %>
                        <%if (currentStatus.equals("Pending")) {%>

                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                            
                            <span class="d-flex justify-content-center align-items-center big-dot dot"><i class="fa fa-check text-white"></i></span>
                            <hr class="flex-fill"><span class="dot"></span>
                            <hr class="flex-fill"><span class="dot"></span>
                            <hr class="flex-fill"><span class="dot"></span>
                        </div>

                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="d-flex flex-column align-items-start"><span><%=pendingTime%></span><span>Pending</span>
                            </div>
                            <div class="d-flex flex-column justify-content-center"><span></span><span>Processing
                                </span></div>
                            <div class="d-flex flex-column justify-content-center align-items-center"><span></span><span>Delivering</span></div>
                            <div class="d-flex flex-column align-items-center"><span></span><span>Delivered</span></div>
                        </div>

                        <%} else if (currentStatus.equals("Processing")) {
                            orderStatus.next();
                            String processingTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                            
                        %>
                            

                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                            <span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="d-flex justify-content-center align-items-center big-dot dot"><i class="fa fa-check text-white"></i></span>
                            <hr class="flex-fill"><span class="dot"></span>
                            <hr class="flex-fill"><span
                                class="dot">
                                </span>
                        </div>

                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="d-flex flex-column align-items-start"><span><%=pendingTime%></span><span>Pending</span>
                            </div>
                            <div class="d-flex flex-column justify-content-center"><span><%=processingTime%></span><span>Processing
                                </span></div>
                            <div class="d-flex flex-column justify-content-center align-items-center"><span></span><span>Delivering</span></div>
                            <div class="d-flex flex-column align-items-center"><span></span><span>Delivered</span></div>
                        </div>

                        <%} else if (currentStatus.equals("Delivering")) {
                            orderStatus.next();
                            String status = orderStatus.getString("Status");
                            String processingTime = "";
                            String deliveringTime = "";
                            if(status.equals("Processing")){
                                processingTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                                orderStatus.next();
                                deliveringTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                            }
                            else{
                                deliveringTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                                orderStatus.next();
                                processingTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                            }
                        %>
                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                            <span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="d-flex justify-content-center align-items-center big-dot"><i class="fa fa-check text-white"></i></span>
                            <hr class="flex-fill"><span
                                class=" dot">
                                </span>
                        </div>

                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="d-flex flex-column align-items-start"><span><%=pendingTime%></span><span>Pending</span>
                            </div>
                            <div class="d-flex flex-column justify-content-center"><span><%=processingTime%></span><span>Processing
                                </span></div>
                            <div class="d-flex flex-column justify-content-center align-items-center"><span><%=deliveringTime%></span><span>Delivering</span></div>
                            <div class="d-flex flex-column align-items-center"><span></span><span>Delivered</span></div>
                        </div>

                        <%} else if (currentStatus.equals("Delivered")) {
                            String processingTime = "";
                            String deliveringTime = "";
                            String deliveredTime = "";
                            while(orderStatus.next()){
                                if(orderStatus.getString("Status").equals("Processing")){
                                    processingTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                                }
                                else if(orderStatus.getString("Status").equals("Delivering")){
                                    deliveringTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                                }
                                else{
                                    deliveredTime = orderStatus.getTimestamp("Time").toLocalDateTime().format(formatter);
                                }
                            }
                        %>
                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                            <span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span
                                class="d-flex justify-content-center align-items-center big-dot dot">
                                <i class="fa fa-check text-white"></i></span>
                        </div>

                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="d-flex flex-column align-items-start"><span><%=pendingTime%></span><span>Pending</span>
                            </div>
                            <div class="d-flex flex-column justify-content-center"><span><%=processingTime %></span><span>Processing
                                </span></div>
                            <div class="d-flex flex-column justify-content-center align-items-center"><span><%=deliveringTime %></span><span>Delivering</span></div>
                            <div class="d-flex flex-column align-items-center"><span><%=deliveredTime %></span><span>Delivered</span></div>
                        </div>

                        <%} else if (currentStatus.equals("Returns")) {%>
                            <span style="color: red !important;font-size: 20px" class="text-muted small">The order has been returned</span>
                        <%}%>

                    </div>
                </div>

                <div class="order-item">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex flex-column">
                            <span class="lead fw-normal">Address</span>
                            <%                                String address = (String) request.getAttribute("address");
                            %>
                            <span class="text-muted small"><%=address%></span>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <div class="product-list">
                        <%
                            int total = 0;
                            String paymentMethod = "";
                            while (rsoderIDInformation.next()) {
                                total = rsoderIDInformation.getInt("TotalPrice");
                                paymentMethod = rsoderIDInformation.getString("PaymentMethod");
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=rsoderIDInformation.getString("Image")%>" alt="Product Image">
                            <div class="product-details">
                                <p><%=rsoderIDInformation.getString("Name")%></p>
                                <p>Size: <%=rsoderIDInformation.getString("Size")%></p>
                                <p>Color: <%=rsoderIDInformation.getString("Color")%></p>
                                <p>Quantity: <%=rsoderIDInformation.getString("Quantity")%></p>
                                <p>Price:<%=rsoderIDInformation.getString("UnitPrice")%></p>
                                <p>SubPrice:<%=rsoderIDInformation.getInt("UnitPrice") * rsoderIDInformation.getInt("Quantity")%></p>
                            </div>
                        </div>
                        <%}%>
                    </div>

                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Product Price: <span style="color:#ee4d2d"><%=total%>vnd</span></strong>
                        </div>
                        <%
                            int voucher = (int) request.getAttribute("voucher");
                        %>
                        <div class="total-price"><strong>Voucher: <span style="color:#ee4d2d"><%=voucher == 0 ? "0" : -voucher%>vnd</span></strong></div>
                        <div class="total-price"><strong>Total: <span style="color:#ee4d2d"><%=total - voucher%>vnd</span></strong></div>
                        <div class="total-price"><strong>Shipping Method: <span style="color:#ee4d2d"><%=paymentMethod.equals("B") ? "VN Pay" : "Payment On Delivery"%></span></strong</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
