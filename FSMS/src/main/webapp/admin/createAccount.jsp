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
                                            <form id="formCreateStudent" action="/upload/createAccount"
                                                  method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="form-title student-info">Account Information</h5>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div style="margin-bottom: 30px" class="form-group students-up-files">
                                                            <label>Upload Avatar</label>
                                                            <div style="margin-bottom: 20px" class="profile-image">
                                                                <img style="display: none" id="avatarImg" width="100" alt="User Image"
                                                                     src="">
                                                            </div>
                                                            <div class="upload">
                                                                <input id="uploadAvatar" name="avatar" type="file"
                                                                       class="form-control form-control-sm">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-8"></div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Username <span class="login-danger">*</span></label>
                                                            <input id="username" name="username" class="form-control" type="text"
                                                                   placeholder="Enter Username">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Password <span class="login-danger">*</span></label>
                                                            <input id="password" name="password" class="form-control" type="password"
                                                                   placeholder="Enter Password">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>First Name <span class="login-danger">*</span></label>
                                                            <input id="firstname" name="firstname" class="form-control" type="text"
                                                                   placeholder="Enter First Name">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Last Name <span class="login-danger">*</span></label>
                                                            <input id="lastname" name="lastname" class="form-control" type="text"
                                                                   placeholder="Enter Last Name">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Gender <span class="login-danger">*</span></label>
                                                            <select name="gender" class=" form-select form-control select">
                                                                <option value="Female">Female</option>
                                                                <option value="Male">Male</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Date Of Birth <span class="login-danger">*</span></label>
                                                            <input id="birthdate" name="birthdate" class="form-control" type="date"
                                                                   placeholder="DD-MM-YYYY">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Email <span class="login-danger">*</span></label>
                                                            <input id="email" name="email" class="form-control" type="text"
                                                                   placeholder="Enter Email">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Phone <span class="login-danger">*</span></label>
                                                            <input id="phone" name="phone" class="form-control" type="text"
                                                                   placeholder="Enter Phone">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Employee Code <span class="login-danger">*</span></label>
                                                            <input id="employeeCode" name="employeeCode" class="form-control" type="text"
                                                                   placeholder="Enter Employee Code">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>CCCD <span class="login-danger">*</span></label>
                                                            <input id="cccd" name="cccd" class="form-control" type="text"
                                                                   placeholder="Enter CCCD">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Role <span class="login-danger">*</span></label>
                                                            <select name="role" class=" form-select form-control select">
                                                                <option value="staff">Staff</option>
                                                                <option value="shipper">Shipper</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Address<span class="login-danger">*</span></label>
                                                            <textarea id="address" name="address" class="form-control"
                                                                      id="exampleFormControlTextarea1" rows="3"
                                                                      placeholder="Enter Address"></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    

                                                    <input type="hidden" name="createAccount" value="createAccount">
                                                    <div class="col-12">
                                                        <div class="student-submit">
                                                            <button style="background: #ea7127;border-color:#ea7127" type="submit"
                                                                    class="btn btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
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
    Validator({
        form: "#formCreateStudent",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#username", "Username is required"),
            Validator.isRequire("#password", "Password is required"),
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#employeeCode", "Employee Code is required"),
            Validator.isRequire("#cccd", "CCCD is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#uploadAvatar", "Avatar must be require"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>

<script>
    <%
        String createAccount = (String) session.getAttribute("createAccount");
        if (createAccount == "fail") {

    %>
    Swal.fire({
        icon: "error",
        title: "Fail Create Account!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("createAccount");
    %>
</script>