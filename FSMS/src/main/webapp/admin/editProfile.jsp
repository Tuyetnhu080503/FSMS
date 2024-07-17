<%@page import="Models.EmployeeProfile"%>
<%@page import="DAOs.EmployeeDAO"%>
<%@page import="Models.Account"%>
<style>
    .login-danger,
    .star-red {
        color: #ff0000;
    }
    #formEditProfile input{
        font-size: 14px;
    }
    #formEditProfile button{
        font-size: 14px;
    }
    #formEditProfile a{
        font-size: 14px;
    }
</style>

<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">			
            <div class="row">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="main-content-area">
                                <div class="container">
                                    <div class="row">
                                        <!--<div class="col-lg-3 col-xl-3"></div>-->
                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="myaccount-dashboard-area cart-page-main-area">
                                                <div class="sec-heading-area">
                                                    <h2>Edit Profile</h2>
                                                </div>
                                                <%
                                                    Account account = (Account) session.getAttribute("acc");
                                                    EmployeeDAO emDAO = new EmployeeDAO();

                                                    EmployeeProfile empyPro = emDAO.getEmployeeProfileByAccountID(account.getAccountId());
                                                %>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <form id="formEditProfile" action="/upload/profile/edit" method="post" enctype="multipart/form-data">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <h5 class="form-title student-info">Customer Information <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                                                        </div>
                                                                        <div style="margin-bottom: 20px" class="col-12 col-sm-4">
                                                                            <div class="form-group">
                                                                                <label>Upload Avatar</label>
                                                                                <div style="margin-bottom: 20px" class="profile-image">
                                                                                    <img id="avatarImg" width="100" alt="User Image" src="/assets/images/avatar/<%= account.getAvatar()%>">
                                                                                </div>
                                                                                <div class="upload">
                                                                                    <input name="avatar" type="file" id="uploadAvatar" class="form-control form-control-sm">
                                                                                    <div class="message"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-8"></div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label>First Name <span class="login-danger">*</span></label>
                                                                                <input id="firstname" name="firstname" class="form-control" type="text" value="<%=account.getFirstName()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label>Last Name <span class="login-danger">*</span></label>
                                                                                <input id="lastname" name="lastname" class="form-control" type="text" value="<%=account.getLastName()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class=" form-group local-forms">
                                                                                <label>Gender <span class="login-danger">*</span></label>
                                                                                <select name="gender" class=" form-select form-control select">
                                                                                    <option <%=account.getGender().equals("Female") ? "selected" : ""%> value="Female">Female</option>
                                                                                    <option <%=account.getGender().equals("Male") ? "selected" : ""%> value="Male" selected="">Male</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label for="birthdate">Date Of Birth <span class="login-danger">*</span></label>
                                                                                <input id="birthdate" name="birthdate" class="form-control" type="date" value="<%= account.getDob()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label>Phone<span class="login-danger">*</span> </label>
                                                                                <input id="phone" name="phone" class="form-control" type="text" value="<%= account.getPhoneNumber()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label>Address <span class="login-danger">*</span></label>
                                                                                <input id="address" name="address" class="form-control" type="text" value="<%= account.getAddress()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-4">
                                                                            <div class="form-group local-forms">
                                                                                <label>CCCD <span class="login-danger">*</span></label>
                                                                                <input id="cccd" name="cccd" class="form-control" type="text" value="<%= empyPro.getCccd()%>">
                                                                                <div class="message"></div>
                                                                            </div>
                                                                        </div>

                                                                        <input type="hidden" name="editProfile" value="editProfile">
                                                                        
                                                                        <div class="col-12">
                                                                            <div class="student-submit">
                                                                                <button name="submit" style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary" value="editProfile">Submit</button>
                                                                                <a style="margin-left: 10px" href="/admin/profile" class="btn btn-primary">Back</a>
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
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>






<script>
    document.querySelector("#uploadAvatar").addEventListener('change', (e) => {
        const selectedFile = e.target.files[0];
        let isImg = false;
        let endFile = selectedFile.name.split(".")[selectedFile.name.split(".").length - 1];
        if (endFile == "jpeg" || endFile == "jpg" || endFile == "png" || endFile == "gif" || endFile == "webp") {
            isImg = true;
        } else {
            isImg = false;
        }
        if (isImg) {
            const imageURL = URL.createObjectURL(selectedFile);
            document.querySelector('#avatarImg').src = imageURL;
            document.querySelector('#avatarImg').style.display = 'block';
        } else {
            document.querySelector('#avatarImg').src = "";
            document.querySelector('#avatarImg').style.display = 'none';
        }
    });
    Validator({
        form: "#formEditProfile",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isFutureDate("#birthdate", "Birthdate must be in past"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isRequire("#cccd", "CCCD is required"),
            Validator.isPhone("#phone", "Phone is not valid"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>

<script>
    <%
        String failUpdate = (String) session.getAttribute("editStatus");
        if (failUpdate == "fail") {

    %>
    Swal.fire({
        icon: "error",
        title: "Fail Update!",
        showConfirmButton: false,
        timer: 1000
    });

    <% }
        session.removeAttribute("editStatus");
    %>
</script>