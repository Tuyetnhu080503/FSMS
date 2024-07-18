<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Voucher"%>
<%@ page import="DAOs.VoucherDAO"%>
<%
    Voucher voucher = (Voucher) request.getAttribute("voucher");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                                            <form id="formUpdateVoucher" action="/upload/updateVoucher" method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12"> 
                                                        <h5 class="form-title student-info">Voucher Information</h5>
                                                    </div>
                                                    <div class="col-12">
                                                        <a id="banVoucher" href="/admin/vouchers/block/<%=voucher.getVoucherID()%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-danger"><i class="pe-7s-trash btn-icon-wrapper"></i>Lock Voucher</button></a> 
                                                        <a id="unbanVoucher" href="/admin/vouchers/unblock/<%=voucher.getVoucherID()%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-primary"><i class="pe-7s-tools btn-icon-wrapper"> </i>Unlock Voucher</button></a> 
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
                                                            <%
                                                                Timestamp expiryDate = voucher.getExpiryDate(); // Assuming voucher.getExpiryDate() returns java.sql.Date
                                                                String formattedExpiryDate = "";
                                                                if (expiryDate != null) {
                                                                    formattedExpiryDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(expiryDate);
                                                                }
                                                            %>

                                                            <input id="expiryDate" name="expiryDate" class="form-control" type="datetime-local"
                                                                   placeholder="YYYY-MM-DDTHH:mm"
                                                                   value="<%= formattedExpiryDate%>"
                                                                   >

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
                                                    <input type="hidden" name="voucherId" value="<%= voucher != null ? voucher.getVoucherID() : ""%>">

                                                    <input type="hidden" name="updateVoucher" value="updateVoucher">

                                                    <div class="col-12 col-sm-6">
                                                        <div class="student-submit">
                                                            <button style="background: #ea7127; border-color:#ea7127" type="submit" class="btn btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <%
                                                String updateVoucher = (String) session.getAttribute("updateVoucher");
                                                if ("fail".equals(updateVoucher)) {
                                                    String errorMessage = (String) session.getAttribute("errorMessage");
                                                    if (errorMessage != null) {
                                            %>
                                            <div class="alert alert-danger">
                                                <%= errorMessage%>
                                            </div>
                                            <script>
                                                Swal.fire({
                                                    icon: "error",
                                                    title: "Fail Update Voucher!",
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                });
                                            </script>
                                            <%
                                                        session.removeAttribute("errorMessage");
                                                    }
                                                }
                                                session.removeAttribute("updateVoucher");
                                            %>
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
    <%
                if (voucher.isActive()) {%>
                                            document.querySelector("#banVoucher").style.display = 'block';
    <%} else {%>
                                            document.querySelector("#unbanVoucher").style.display = 'block';
    <%}
    %>
</script>

<script>
    document.querySelector("#banVoucher").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Are you sure to block the voucher?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, block it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#banVoucher").href;
            }
        });
    });

    document.querySelector("#unbanVoucher").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to unblock the voucher?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, unblock it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#unbanVoucher").href;
            }
        });
    });
</script>
<script>
    // Initialize Validator
    Validator({
        form: "#formUpdateVoucher",
        message: ".message",
        invalid: "invalid",
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
