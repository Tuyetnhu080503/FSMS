<style>
    .login-danger,
    .star-red {
        color: #ff0000;
    }
    #formRegisterAccountCustomer input{
        font-size: 14px;
    }
    #formRegisterAccountCustomer button{
        font-size: 14px;
    }
    #formRegisterAccountCustomer a{ 
        font-size: 14px;
    }
    #formRegisterAccountCustomer textarea{ 
        font-size: 14px;
    }
</style>
<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-xl-3"></div>
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="sec-heading-area">
                        <h2>Register Account</h2>
                    </div>
                  
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <form id="formRegisterAccountCustomer" action="/upload/createAccount"
                                                  method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="form-title student-info"> Register Account </h5>
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
                                                            <label>Address<span class="login-danger">*</span></label>
                                                            <textarea id="address" name="address" class="form-control"
                                                                      id="exampleFormControlTextarea1" rows="3"
                                                                      placeholder="Enter Address"></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    

                                                    <input type="hidden" name="registerAccount" value="registerAccount">
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


<script>
    Validator({
        form: "#formRegisterAccountCustomer",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#username", "Username is required"),
            Validator.isRequire("#password", "Password is required"),
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isFutureDate("#birthdate", "Birthdate must be in past"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#uploadAvatar", "Avatar must be require"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>

<script>
    <%
        String createAccount = (String) session.getAttribute("registerAccount");
        if (createAccount == "fail") {

    %>
    Swal.fire({
        icon: "error",
        title: "Fail Create Account!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("registerAccount");
    %>
</script>