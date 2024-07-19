
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
    
    ResultSet rsoderIDs = (ResultSet)request.getAttribute("rsoderIDs");

    ResultSet rsoderIDInformation = (ResultSet)request.getAttribute("rsoderIDInformation");
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
    </ul>
    <div class="tab-content" id="orderStatusTabContent">
        <div class="tab-pane fade show active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
            <div class="order-list">
                <%while (rsoderIDs.next()) {%> 
                <!-- Render pending orders here -->
                <%while (rsoderIDInformation.next()) { %>
                <%if(rsoderIDs.getInt("OrderID") == rsoderIDInformation.getInt("OrderID")){%>
                <div class="order-item">
                    <div class="product-list">
                        <%if(rsoderIDInformation.getString("Status").trim().equals("Pending")){%>
                            <div class="product-item">
                            </div>
                        <%}%>
                    </div>
                    <div class="order-footer">
                        <div class="total-price">
                        </div>
                    </div>
                    <div style="display: flex;justify-content: end">
                        <a href="#"><button  style="margin-right: 30px; background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Pay Again</button></a>
                        <a href="/orders/detail"><button  style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail Order</button></a>
                    </div>
                </div>
                    <%}%>
                    <%}
                    %>
                <%}
                %>
            </div>
        </div>
        <div class="tab-pane fade" id="processing" role="tabpanel" aria-labelledby="processing-tab">
            <h3 class="mt-3">Processing Orders</h3>
            <div class="order-list">
                <!-- Render processing orders here -->

            </div>
        </div>
        <div class="tab-pane fade" id="shipped" role="tabpanel" aria-labelledby="shipped-tab">
            <h3 class="mt-3">Shipped Orders</h3>
            <div class="order-list">
                <!-- Render shipped orders here -->

            </div>
        </div>
        <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab">
            <h3 class="mt-3">Delivered Orders</h3>
            <div class="order-list">
                <!-- Render delivered orders here -->

            </div>
        </div>
        <div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
            <h3 class="mt-3">Return Orders</h3>
            <div class="order-list">
                <!-- Render return orders here -->

            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

