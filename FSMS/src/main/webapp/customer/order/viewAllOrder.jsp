
<%@page import="DTO.ViewOrder"%>
<%@page import="DTO.ViewOrderIDs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
<style>
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

    ArrayList<ViewOrderIDs> orderIDList = (ArrayList<ViewOrderIDs>) request.getAttribute("orderIDList");

    ArrayList<ViewOrder> orderList = (ArrayList<ViewOrder>) request.getAttribute("orderList");
%>

<div class="container mt-5">
    <h1 style="text-transform: uppercase;margin-bottom: 20px">Order Status</h1>
    <ul class="nav nav-tabs nav-justified" id="orderStatusTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="pending" aria-selected="true">Pending</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="processing-tab" data-toggle="tab" href="#processing" role="tab" aria-controls="processing" aria-selected="false">Processing</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="shipped-tab" data-toggle="tab" href="#shipped" role="tab" aria-controls="shipped" aria-selected="false">Delivering</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="delivered-tab" data-toggle="tab" href="#delivered" role="tab" aria-controls="delivered" aria-selected="false">Delivered</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="return-tab" data-toggle="tab" href="#return" role="tab" aria-controls="return" aria-selected="false">Returns</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="cancel-tab" data-toggle="tab" href="#cancel" role="tab" aria-controls="cancel" aria-selected="false">Cancel</a>
        </li>
    </ul>
    <div class="tab-content" id="orderStatusTabContent">
        <div class="tab-pane fade show active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
            <div class="order-list">
                <%
                    boolean isHaveOrderPending = false ;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Pending")) {
                            isHaveOrderPending = true;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>
                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a class="cancel-order" href="/orders/cancel?id=<%=orderID.getId()%>"><button  style="margin-right: 20px" class="mb-2 mr-2 btn-icon btn btn-danger"><i class="feather-edit-3"></i>Cancel</button></a>
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
                
                <%
                    if(isHaveOrderPending==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
            </div>
        </div>
        <div class="tab-pane fade" id="processing" role="tabpanel" aria-labelledby="processing-tab">
            <div class="order-list">
                <!-- Render processing orders here -->
                <%
                    boolean isHaveOrderProcessing = false ;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Processing")) {
                            isHaveOrderProcessing = true ;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>

                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
                
                <%
                    if(isHaveOrderProcessing==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
                
            </div>
        </div>
        <div class="tab-pane fade" id="shipped" role="tabpanel" aria-labelledby="shipped-tab">
            <div class="order-list">
                <!-- Render shipped orders here -->
                <%
                    boolean isHaveOrderDelivering = false ;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Delivering")) {
                            isHaveOrderDelivering = true ;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>

                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
                
                <%
                    if(isHaveOrderDelivering==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
            </div>
        </div>
        <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab">
            <div class="order-list">
                <!-- Render delivered orders here -->
                <%
                    boolean isHaveOrderDelivered = false ;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Delivered")) {
                            isHaveOrderDelivered = true ;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>

                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;margin-right: 20px" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Review Shop</button></a>
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
                
                <%
                    if(isHaveOrderDelivered==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
            </div>
        </div>
        <div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
            <div class="order-list">
                <!-- Render return orders here -->
                <%
                    boolean isHaveOrderReturns = false ;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Returns")) {
                            isHaveOrderReturns = true ;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>

                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %> 
                <%
                    if(isHaveOrderReturns==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
            </div>
        </div>
        <div class="tab-pane fade" id="cancel" role="tabpanel" aria-labelledby="cancel-tab">
            <div class="order-list">
                <!-- Render return orders here -->
                <%
                    boolean isHaveOrderCancel = false;
                    for (ViewOrderIDs orderID : orderIDList) {
                        if (orderID.getStatus().trim().equals("Cancel")) {
                            isHaveOrderCancel = true ;
                %>
                <div class="order-item">
                    <div class="product-list">
                        <%  
                            for (ViewOrder order : orderList) {
                                if (orderID.getId()== order.getId()) {
                        %>
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/assets/images/product/<%=order.getImage() %>" alt="Product Image">
                            <div class="product-details">
                                <p><%=order.getName()%></p>
                                <p>Size: <%=order.getSize()%></p>
                                <p>Color: <%=order.getColor()%></p>
                                <p>Quantity: <%=order.getQuantity() %></p>
                                <p>Price: <%=order.getUnitPrice() %></p>
                            </div>
                        </div>
                        <%}%>

                        <%
                    }%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                            <strong>Total Price: <span style="color:#ee4d2d"><%=orderID.getTotalPrice()%>vnd</span></strong>
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="/orders/detail?id=<%=orderID.getId()%>"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                <%
                        }
                    }
                %> 
                <%
                    if(isHaveOrderCancel==false){
                    %>
                    <h2>
                        No orders yet
                    </h2>
                    <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    <%
        String addOrder = (String) session.getAttribute("addOrder");
        if (addOrder == "success") {

    %>
    Swal.fire({
        icon: "success",
        title: "Create Order Successfully!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("addOrder");
    %>
        
        
    document.querySelectorAll("a.cancel-order").forEach(function(element) {
        element.addEventListener("click", function(event) {
            event.preventDefault();
            Swal.fire({
                title: "Are you sure?",
                text: "Are you sure to cancel the order?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, cancel it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = element.href;
                }
            });
        });
});

</script>