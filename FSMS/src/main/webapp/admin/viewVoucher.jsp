<%@ page import="DAOs.VoucherDAO" %>
<%@ page import="java.sql.ResultSet" %>
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
                                    <div class="card card-table comman-shadow">
                                        <div class="card-body">

                                            <div class="page-header">
                                                <div class="row align-items-center">
                                                    <div class="col">
                                                        <h3 class="page-title">View Vouchers</h3>
                                                    </div>
                                                    
                                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                                        <a style="background: #ea7127;border-color:#ea7127 " href="/admin/voucher/create" class="btn btn-primary"><i class="fas fa-plus"></i> Add Voucher</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="table-responsive">
                                                <table id="viewVouchers" class="table table-hover table-striped table-bordered">
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Discount Amount</th>
                                                            <th>Discount Percentage</th>
                                                            <th>Expiry Date</th>
                                                            <th>Is Active</th>
                                                            <th>Created Date</th>
                                                            <th>Quantity</th>
                                                            <th>Minimum Price</th>
                                                            <th class="text-end">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            VoucherDAO voucherDAO = new VoucherDAO();
                                                            ResultSet rs = voucherDAO.getAllVouchers();
                                                            int count = 1;
                                                            while (rs.next()) { %> 
                                                        <tr>
                                                            <td><%=count++%></td>
                                                            <td><%=rs.getInt("DiscountAmount")%></td>
                                                            <td><%=rs.getInt("DiscountPercentage") != 0 ? rs.getInt("DiscountPercentage") + "%" : "N/A"%></td>
                                                            <td><%=rs.getDate("ExpiryDate")%></td>
                                                            <td><%=rs.getBoolean("IsActive") ? "Yes" : "No"%></td>
                                                            <td><%=rs.getDate("CreatedDate")%></td>
                                                            <td><%=rs.getInt("Quantity")%></td>
                                                            <td><%=rs.getInt("MinimumPrice")%></td>
                                                            <td>
                                                                <a href="/admin/vouchers/update/<%=rs.getInt("VoucherID")%>">
                                                                    <button style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <form id="formDeleteVoucher" action="/upload/deleteVoucher"
                                                                      method="post" enctype="multipart/form-data">
                                                                    <input type="hidden" name="voucherId" value="<%=rs.getInt("VoucherID")%>">
                                                                    <button type="submit" name="deleteVoucher" style="background:red;border-color: red;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-danger"><i class="feather-trash-2"></i>Delete</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% }
                                                            rs.close();
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
</div>

<!-- Optional: Include script for showing success message -->
<script>
    <% String createVoucher = (String) session.getAttribute("createVoucher");
        if (createVoucher != null && createVoucher.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Create Voucher Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("createVoucher");
        } %>
</script>

<script>
    <% String updateVoucher = (String) session.getAttribute("updateVoucher");
        if (updateVoucher != null && updateVoucher.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Update Voucher Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("updateVoucher");
        }%>
</script>
<script>
    <% String deleteVoucher = (String) session.getAttribute("deleteVoucher");
        if (deleteVoucher != null && deleteVoucher.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Delete Voucher Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("deleteVoucher");
        }%>
</script>

