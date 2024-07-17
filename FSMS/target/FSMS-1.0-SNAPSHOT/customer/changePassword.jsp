
<style>
    .login-danger,
    .star-red {
        color: #ff0000;
    }
    #changePassword input{
        font-size: 14px;
    }
    #changePassword button{
        font-size: 14px;
    }
    #changePassword a{
        font-size: 14px;
    }
</style>
<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="checkout-main-area">
                    <h2>Change Password</h2>
                    <div class="checkout-area">
                        <div class="panel-group greentech-panel-group greentech-panel-icon" id="greentechaccordion">
                            <!-- START SINGLE PANEL -->
                            <div class="greentech-panel panel panel-default">

                                <div id="collapseOne" class="panel-collapse collapse show" data-bs-parent="#greentechaccordion">
                                    <div class="panel-body greentech-panel-body">
                                        <div class="checkout-method">
                                            <div class="row">
                                                <div class="method-left col-12 col-md-6">
                                                </div>
                                                <div class="method-right col-12 col-md-6">
                                                    <h2>Change Password</h2>
                                                    <form id="changePassword" action="/account/changepassword" method="post" style="margin-top: 10px">
                                                        <div class="form-group">
                                                            <label>Old Password <sup>*</sup></label>
                                                            <input id="oldpassword" name="oldpassword" type="password" class="form-control" placeholder="Type your old password">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>New Password <sup>*</sup></label>
                                                            <input id="newpassword" name="newpassword" type="password" class="form-control" placeholder="Type your new password">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Confirm Password <sup>*</sup></label>
                                                            <input id="confirm" name="confirm" type="password" class="form-control" placeholder="Type your confirm password">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <p style="color:red"><%=request.getAttribute("wrongPass")!=null?request.getAttribute("wrongPass"):""%></p>
                                                        </div>
                                                        <div class="block-button-left">
                                                            <input type="hidden" name="changePassword" value="changePassword"> 
                                                            <button class="btn btn-primary" style="background: #ea7127;border-color:#ea7127" type="submit">Update</button>
                                                            <a href="/account/profile" style="margin-left: 10px" class="btn btn-primary" >Back</a  >
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
                </div>
            </div>

        </div>
    </div>	
</section>

<script>
    Validator({
        form: "#changePassword",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#oldpassword", "Old Password is required"),
            Validator.isRequire("#newpassword", "New Password is required"),
            Validator.isRequire("#confirm", "Confirm Pasword is required"),
            Validator.isConfirmPassword("#confirm","#newpassword", "Confirm password does not match new password")
        ]
    });
</script>
