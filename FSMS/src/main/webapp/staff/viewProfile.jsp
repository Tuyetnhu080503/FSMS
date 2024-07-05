<%@page import="Models.EmployeeProfile"%>
<%@page import="DAOs.EmployeeDAO"%>
<%@page import="Models.Account"%>

<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">			
            <div class="row">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                            <div class="sec-heading-area">
                                <h2 style="font-size: 28px">My Profile</h2>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <%
                                        Account account = (Account) session.getAttribute("acc");
                                        EmployeeDAO emDAO = new EmployeeDAO();
                                        
                                        EmployeeProfile empyPro = emDAO.getEmployeeProfileByAccontID(account.getAccountId());
                                    %>
                                    <div class="d-flex flex-column">
                                        <img style="width:100px; display: block; " src="../assets/images/avatar/<%= account.getAvatar()%>" alt="alt"/>
                                        <span style="display: block; margin-left: 30px;margin-bottom: 20px">Avatar</span>
                                    </div>
                                    <h5 class="card-title d-flex justify-content-between">
                                        <span>General Information</span>
                                        <a class="edit-link" href="/staff/profile/edit"><i class="far fa-edit me-1"></i>Edit</a>
                                    </h5>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Username</p>
                                        <p class="col-sm-9"><%= account.getUsername()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Full Name</p>
                                        <p class="col-sm-9"><%= account.getFirstName() + " " + account.getLastName()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Gender</p>
                                        <p class="col-sm-9"><%= account.getGender()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Date of Birth</p>
                                        <p class="col-sm-9"><%= account.getDob()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Email</p>
                                        <p class="col-sm-9"><%= account.getEmail()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Mobile Phone</p>
                                        <p class="col-sm-9"><%= account.getPhoneNumber()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0">Address</p>
                                        <p class="col-sm-9"><%= account.getAddress()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0">EmployeeCode</p>
                                        <p class="col-sm-9"><%= empyPro.getEmployeeCode()%></p>
                                    </div>
                                    <div class="row">
                                        <p class="col-sm-3 text-muted text-sm-end mb-0">CCCD</p>
                                        <p class="col-sm-9"><%= empyPro.getCccd()%></p>
                                    </div>
                                    <h5 class="card-title d-flex justify-content-between"><a class="edit-link" href="/staff/profile/changepassword"><i class="far fa-edit me-1"></i>Change Password</a>
                                    </h5>

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
        String changePassword = (String) session.getAttribute("changePassword");
        if (changePassword != null) {

    %>
    Swal.fire({
        icon: "success",
        title: "Change Password Sucessfully!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("changePassword");
    %>
</script>


<script>
    <%
        String editStatus = (String) session.getAttribute("editStatus");
        if (editStatus == "success") {

    %>
    Swal.fire({
        icon: "success",
        title: "Update Profile Successfully!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("editStatus");
    %>
</script>