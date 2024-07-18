<%@ page import="DAOs.OrderDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Orders</title>
    <link rel="stylesheet" href="path/to/your/css/file.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                                    <div class="card card-table comman-shadow">
                                        <div class="card-body">

                                            <div class="page-header">
                                                <div class="row align-items-center">
                                                    <div class="col">
                                                        <h3 class="page-title">View Orders</h3>
                                                    </div>
                                                     <div class="form-group">
                                                        <input type="text" id="searchInput" class="form-control" placeholder="Search...">
                                                    </div>
                                                    
                                                </div>
                                            </div>

                                            <div class="table-responsive">
                                                <table id="viewOrders" class="table table-hover table-striped table-bordered">
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Last Name</th>
                                                            <th>Phone Number</th>
                                                            <th>Status</th>
                                                            <th>Payment Method</th>
                                                            <th>Delivery Address</th>
                                                            <th class="text-end">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            OrderDAO orderDAO = new OrderDAO();
                                                            ResultSet rs = orderDAO.getAllOrder();
                                                            int count = 1;
                                                            while (rs.next()) { %> 
                                                        <tr>
                                                            <td><%=count++%></td>
                                                            <td><%=rs.getString("Lastname")%></td>
                                                            <td><%=rs.getString("Phonenumber")%></td>
                                                            <td><%=rs.getString("Status")%></td>
                                                            <td><%=rs.getString("PaymentMethod")%></td>
                                                            <td><%=rs.getString("Deliveryaddress")%></td>
                                                            <td>
                                                                <a href="/admin/orders/update/<%=rs.getInt("OrderID")%>">
                                                                    <button style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <form id="formDeleteOrder" action="/upload/deleteOrder" method="post">
                                                                    <input type="hidden" name="orderId" value="<%=rs.getInt("OrderID")%>">
                                                                    <button type="submit" name="deleteOrder" style="background:red;border-color: red;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-danger"><i class="feather-trash-2"></i>Delete</button>
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
    <% String createOrder = (String) session.getAttribute("createOrder");
        if (createOrder != null && createOrder.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Create Order Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("createOrder");
        } %>
</script>

<script>
    <% String updateOrder = (String) session.getAttribute("updateOrder");
        if (updateOrder != null && updateOrder.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Update Order Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("updateOrder");
        }%>
</script>
<script>
    <% String deleteOrder = (String) session.getAttribute("deleteOrder");
        if (deleteOrder != null && deleteOrder.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Delete Order Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("deleteOrder");
        }%>
</script>
<script>
    document.getElementById('searchInput').addEventListener('input', function () {
        var filter = this.value.toUpperCase();
        var rows = document.querySelector('#viewOrders tbody').rows;

        for (var i = 0; i < rows.length; i++) {
            var visible = false;
            var cells = rows[i].cells;

            for (var j = 1; j < cells.length - 1; j++) {
                var cell = cells[j].textContent.toUpperCase();
                if (cell.indexOf(filter) > -1) {
                    visible = true;
                    break;
                }
            }

            rows[i].style.display = visible ? '' : 'none';
        }
    });
</script>

</body>
</html>