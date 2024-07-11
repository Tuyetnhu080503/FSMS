<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Voucher" %>
<%@ page import="DAOs.VoucherDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve voucher object from request attribute
    Voucher voucher = (Voucher) request.getAttribute("voucher");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Voucher</title>
    <style>
        .message {
            color: red; /* Change message color to red */
        }
    </style>
</head>
<body>
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="myaccount-dashboard-area cart-page-main-area">
                        <div class="page-wrapper">
                            <div class="content container-fluid">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card comman-shadow">
                                            <div class="card-body">
                                                <form id="formCreateVoucher" action="/upload/createVoucher" method="post" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <h5 class="form-title student-info">Create Voucher</h5>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Discount Amount <span class="login-danger">*</span></label>
                                                                <input id="discountAmount" name="discountAmount" class="form-control" type="number" placeholder="Enter Discount Amount" value="<%= voucher != null ? voucher.getDiscountAmount() : ""%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Discount Percentage</label>
                                                                <input id="discountPercentage" name="discountPercentage" class="form-control" type="number" placeholder="Enter Discount Percentage" value="<%= voucher != null && voucher.getDiscountPercentage() != null ? voucher.getDiscountPercentage() : ""%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Expiry Date <span class="login-danger">*</span></label>
                                                                <input id="expiryDate" name="expiryDate" class="form-control" type="date" placeholder="Enter Expiry Date" value="<%= voucher != null ? voucher.getExpiryDate().toString().substring(0, 10) : ""%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Is Active <span class="login-danger">*</span></label>
                                                                <select id="isActive" name="isActive" class="form-control">
                                                                    <option value="true" <%= voucher != null && voucher.isActive() ? "selected" : ""%>>Yes</option>
                                                                    <option value="false" <%= voucher != null && !voucher.isActive() ? "selected" : ""%>>No</option>
                                                                </select>
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Quantity</label>
                                                                <input id="quantity" name="quantity" class="form-control" type="number" placeholder="Enter Quantity" value="<%= voucher != null && voucher.getQuantity() != null ? voucher.getQuantity() : ""%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Minimum Price</label>
                                                                <input id="minimumPrice" name="minimumPrice" class="form-control" type="number" placeholder="Enter Minimum Price" value="<%= voucher != null && voucher.getMinimumPrice() != null ? voucher.getMinimumPrice() : ""%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>

                                                        <input type="hidden" name="createVoucher" value="createVoucher">
                                                        <div class="col-12">
                                                            <div class="student-submit">
                                                                <button style="background: #ea7127; border-color:#ea7127" type="submit" class="btn btn-primary">Create Voucher</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <%-- Error Message Display --%>
                                                <% String createVoucher = (String) session.getAttribute("createVoucher"); %>
                                                <% if ("fail".equals(createVoucher)) { %>
                                                    <% String errorMessage = (String) session.getAttribute("errorMessage"); %>
                                                    <% if (errorMessage != null) { %>
                                                        <div class="alert alert-danger">
                                                            <%= errorMessage %>
                                                        </div>
                                                        <script>
                                                            Swal.fire({
                                                                icon: "error",
                                                                title: "Failed to Create Voucher!",
                                                                showConfirmButton: false,
                                                                timer: 2000
                                                            });
                                                        </script>
                                                    <% } %>
                                                    <% session.removeAttribute("errorMessage"); %>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
    </div>
    <script>
    // Initialize Validator
    Validator({
        form: "#formCreateVoucher",
        message: ".message",
        invalid: "login-danger",
        rules: [
            Validator.isRequire("#discountAmount", "Discount Amount is required"),
            Validator.isRequire("#discountPercentage", "Discount Percentage is required"),
            Validator.isRequire("#expiryDate", "Expiry Date is required"),
            Validator.isRequire("#isActive", "Status is required"),
            Validator.isPositive("#discountAmount", "Discount Amount must be greater than 0"),
            Validator.isPositive("#discountPercentage", "Discount Percentage must be greater than 0"),
            Validator.isPositive("#quantity", "Quantity must be greater than 0"),
            Validator.isPositive("#minimumPrice", "Minimum Price must be greater than 0")
        ]
    });
    </script>
</body>
</html>
