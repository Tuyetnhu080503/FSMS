<%@ page import="Models.Order" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>

<!-- Custom CSS -->
<style>

    .box {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 15px;
    }
    .box-header {
        background-color: #f4f4f4;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    .box-title {
        margin-top: 0;
        font-size: 18px;
        margin-bottom: 10px;
    }
    #orderTable {
        width: 100%;
    }
</style>

<div class="content-wrapper">
    <section class="content-header">

    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Order List</h3>
                    </div>
                    <div class="box-body">
                        <table id="orderTable" class="table table-hover table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer ID</th>
                                    <th>Status</th>
                                    <th>Total Price</th>
                                    <th>Create At</th>
                                    <th>Voucher ID</th>
                                    <th>Payment Method</th>
                                    <th>Payment ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${Listc}">
                                    <tr>
                                        <td>${o.orderId}</td>
                                        <td>${o.customerId}</td>
                                        <td>${o.status}</td>
                                        <td>$${o.totalPrice}</td>
                                        <td>${o.createAt}</td>
                                        <td>${o.voucherId}</td>
                                        <td>${o.paymentMethod}</td>
                                        <td>${o.paymentId}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    $(document).ready(function() {
        $('#orderTable').DataTable();
    });
</script>
