<%@ page import="Models.Order" %>

<style>
        /* Styles for content wrapper and sections */
        .content-wrapper {
            padding: 20px;
            background-color: #f0f0f0;
        }
        .content-header {
            background-color: #00A9E0;
            color: #fff;
            padding: 10px;
            margin-bottom: 20px;
        }
        .content {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
        }
        /* Styles for box and box header */
        .box {
            border-top: 3px solid #3c8dbc;
            margin-bottom: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.1);
        }
        .box-header {
            background-color: #f9f9f9;
            color: #444;
            padding: 10px;
            border-bottom: 1px solid #f4f4f4;
        }
        /* Styles for order cards */
        .order-card {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .order-card h2 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #3c8dbc;
        }
        .order-card p {
            margin-bottom: 5px;
        }
        .content-header h1 {
            color: #fff; /* Set text color of h1 to white */
        }
    </style>
<div class="content-wrapper">
    <section class="content-header">
        <h1>Order History for Customer ${customerId}</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Order List</h3>
                    </div>
                    <div class="box-body">
                        <c:forEach var="o" items="${CustomerOrderList}">
                            <div class="order-card">
                                <h2>Order ID: ${o.orderId}</h2>
                                <p>Status: ${o.status}</p>
                                <p>Total Price: $${o.totalPrice}</p>
                                <p>Create At: ${o.createAt}</p>
                                <p>Voucher ID: ${o.voucherId}</p>
                                <p>Payment Method: ${o.paymentMethod}</p>
                                <p>Payment ID: ${o.paymentId}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
