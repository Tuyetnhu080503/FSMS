<%@page import="java.util.List"%>
<%@page import="Models.OrderStatus"%>
<%@page import="Models.Account"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="DAOs.OrderDAO" %>
<%@ page import="Models.Order" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Order order = (Order) request.getAttribute("order");
    Account account = (Account) request.getAttribute("account");
    List<OrderStatus> orderStatus = (List<OrderStatus>) request.getAttribute("orderStatus");
    int roleID = account.getRoleId();
    String currentStatus = order.getStatus();
%>
<div class="content-wrapper">
    <div class="container-full">
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
                                                        <h3 class="page-title">Update Order</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <form id="formUpdateOrder" action="/upload/updateOrder"
                                                  method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="orderId" value="<%=order.getOrderId()%>">
                                                <input type="hidden" name="updateOrder" value="true">
                                                <div class="form-group">
                                                    <label for="lastName">Last Name:</label>
                                                    <input type="text" id="lastName" class="form-control" value="<%=order.getLastname()%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="phoneNumber">Phone Number:</label>
                                                    <input type="text" id="phoneNumber" class="form-control" value="<%=order.getPhonenumber()%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="paymentMethod">Payment Method:</label>
                                                    <input type="text" id="paymentMethod" class="form-control" value="<%=order.getPaymentMethod()%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="deliveryAddress">Delivery Address:</label>
                                                    <input type="text" id="deliveryAddress" class="form-control" value="<%=order.getDeliveryaddress()%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="status">Status:</label>
                                                    <select name="status" id="status" class="form-control">
                                                        <% if ((roleID == 1 || roleID == 2) && "Pending".equals(currentStatus)) {%>
                                                        <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : ""%>>Pending</option>
                                                        <option value="Processing" <%= "Processing".equals(order.getStatus()) ? "selected" : ""%>>Processing</option>
                                                        <% } else if (roleID == 2 && "Processing".equals(currentStatus)) {%>
                                                        <option value="Processing" <%= "Processing".equals(order.getStatus()) ? "selected" : ""%>>Processing</option>
                                                        <option value="Delivering" <%= "Delivering".equals(order.getStatus()) ? "selected" : ""%>>Delivering</option>
                                                        <% } else if (roleID == 3 && "Delivering".equals(currentStatus)) {%>
                                                        <option value="Delivering" <%= "Delivering".equals(order.getStatus()) ? "selected" : ""%>>Delivering</option>
                                                        <option value="Delivered" <%= "Delivered".equals(order.getStatus()) ? "selected" : ""%>>Delivered</option>
                                                        <option value="Returns" <%= "Returns".equals(order.getStatus()) ? "selected" : ""%>>Returns</option>
                                                        <% } else {%>
                                                        <option value="<%=order.getStatus()%>" selected><%=order.getStatus()%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="deliveryAddress">Last Updated By:</label>
                                                    <input type="text" id="updatedBy" class="form-control" value="<%=order.getEmployeeFirstName()%> <%=order.getEmployeeLastName()%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="statusHistory">Status History:</label>
                                                </div>
                                                <div class="form-group">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <%
                                                                    for (OrderStatus status : orderStatus) {
                                                                %>
                                                                <th><%= status.getStatus()%></th>
                                                                    <% } %>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <%
                                                                    SimpleDateFormat newFormat = new SimpleDateFormat("HH:mm:ss dd-MM-yyyy");
                                                                    for (OrderStatus status : orderStatus) {
                                                                        Timestamp timestamp = status.getTime();
                                                                        String formattedTime = newFormat.format(timestamp);
                                                                %>
                                                                <td><%= formattedTime%></td>
                                                                <% } %>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <input type="hidden" name="updateOrder" value="updateOrder">

                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </form>
                                            <% String updateOrder = (String) session.getAttribute("updateOrder");
                                                if (updateOrder != null && updateOrder.equals("success")) { %>
                                            <script>
                                                Swal.fire({
                                                    icon: "success",
                                                    title: "Update Order Successfully!",
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                });
                                            </script>
                                            <% session.removeAttribute("updateOrder"); %>
                                            <% }%>
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
                                        