
<%@page import="DAOs.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
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
                                                        <h3 class="page-title">View Accounts</h3>
                                                    </div>
                                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                                        <a style="background: #ea7127;border-color:#ea7127 " href="/admin/accounts/create" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="table-responsive">
                                                <table id="viewAccounts" class="table table-hover table-striped table-bordered">
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Username</th>
                                                            <th>Full Name</th>
                                                            <th>Email</th>
                                                            <th>Phone Number</th>
                                                            <th>Status</th>
                                                            <th class="text-end">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            AccountDAO mDAO = new AccountDAO();
                                                            ResultSet rs = mDAO.getAll();
                                                            int count = 1;
                                                            while (rs.next()) {%> 
                                                        <tr>
                                                            <td><%=count++%></td>
                                                            <td><%=rs.getString("Username")%></td>
                                                            <td><a href="/admin/accounts/update/<%=rs.getInt("AccountID")%>" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/images/avatar/<%=rs.getString("Avatar")%>" alt="Avatar"></a><%=rs.getString("Lastname") + " " + rs.getString("Firstname")%></td>
                                                            <td><%=rs.getString("Email")%></td>
                                                            <td><%=rs.getString("Phonenumber")%></td>
                                                            <td><%=rs.getBoolean("Isactive") == true ? "<button class=\"btn btn-primary btn-sm btn-rounded\">Active</button>" : "<button class=\"btn btn-danger btn-sm btn-rounded\">Blocked</button>"%></td>
                                                            <td><a href="/admin/accounts/update/<%=rs.getInt("AccountID")%>"><button  style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button></a></td>
                                                        </tr>
                                                        <%}
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


<script>
    <%
        String createAccount = (String) session.getAttribute("createAccount");
        if (createAccount == "success") {

    %>
    Swal.fire({
        icon: "success",
        title: "Create Account Successfully!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("createAccount");
    %>
</script>

<script>
    <%
        String updateAccount = (String) session.getAttribute("updateAccount");
        if (updateAccount == "success") {

    %>
    Swal.fire({
        icon: "success",
        title: "Update Account Successfully!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("updateAccount");
    %>
</script>