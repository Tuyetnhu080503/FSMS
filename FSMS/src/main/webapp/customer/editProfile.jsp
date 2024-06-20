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
<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-xl-3"></div>
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="sec-heading-area">
                        <h2>Edit Profile</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <form id="formEditProfile" action="/account/profile/edit" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="form-title student-info">Customer Information <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                            </div>
                                            <div style="margin-bottom: 20px" class="col-12 col-sm-4">
                                                <div class="form-group">
                                                    <label>Upload Avatar</label>
                                                    <div style="margin-bottom: 20px" class="profile-image">
                                                        <img id="avatarImg" width="100" alt="User Image" src="/assets/avatar/new1.png">
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
                                                    <input id="firstname" name="firstname" class="form-control" type="text" value="Cu">
                                                    <div class="message"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Last Name <span class="login-danger">*</span></label>
                                                    <input id="lastname" name="lastname" class="form-control" type="text" value="Le Quoc">
                                                    <div class="message"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class=" form-group local-forms">
                                                    <label>Gender <span class="login-danger">*</span></label>
                                                    <select name="gender" class=" form-select form-control select">
                                                        <option value="Female">Female</option>
                                                        <option value="Male" selected="">Male</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label for="birthdate">Date Of Birth <span class="login-danger">*</span></label>
                                                    <input id="birthdate" name="birthdate" class="form-control" type="date" value="2003-02-27">
                                                    <div class="message"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Phone<span class="login-danger">*</span> </label>
                                                    <input id="phone" name="phone" class="form-control" type="text" value="0942341234">
                                                    <div class="message"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Address <span class="login-danger">*</span></label>
                                                    <input id="address" name="address" class="form-control" type="text" value="Can Tho 22">
                                                    <div class="message"></div>
                                                </div>
                                            </div>

                                            <input type="hidden" name="editProfile" value="editProfile">
                                            <div class="col-12">
                                                <div class="student-submit">
                                                    <button name="submit" style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary" value="editProfile">Submit</button>
                                                    <a style="margin-left: 10px" href="/account/profile" class="btn btn-primary">Back</a>
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
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>