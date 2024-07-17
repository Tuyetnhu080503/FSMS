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
                                                               <input id="expiryDate" name="expiryDate" class="form-control" type="date"
                                                                   placeholder="DD-MM-YYYY" value="<%= voucher != null ? voucher.getExpiryDate().toString().substring(0, 10) : ""%>">
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
                                                    <div class="col-12">
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
