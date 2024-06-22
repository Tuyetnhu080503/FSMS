<%@page import="Models.Account"%>
<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-xl-3"></div>
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="sec-heading-area">
                        <h2>My Profile</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="card">
                                <div class="card-body">
                                    <%
                                        Account account = (Account) session.getAttribute("acc");
                                    %>
                                    <div class="d-flex flex-column">
                                        <img style="width:100px; display: block; b" src="../assets/avatar/<%= account.getAvatar() %>" alt="alt"/>
                                        <span style="display: block; margin-left: 30px;margin-bottom: 20px">Avatar</span>
                                    </div>
                                    <h5 class="card-title d-flex justify-content-between">
                                        <span>General Information</span>
                                        <a class="edit-link" href="/account/profile/edit"><i class="far fa-edit me-1"></i>Edit</a>
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
                                    <h5 class="card-title d-flex justify-content-between"><a class="edit-link" href="/account/changepassword"><i class="far fa-edit me-1"></i>Change Password</a>
                                    </h5>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>	
</section>


<script>
    <%
        String changePassword = (String) session.getAttribute("changePassword");
        if (changePassword != null) {

    %>
    Swal.fire({
        icon: "success",
        title: "Change Password Sucessfully!",
        showConfirmButton: false,
        timer: 1500
    });

    <% }
        session.removeAttribute("changePassword");
    %>
</script>