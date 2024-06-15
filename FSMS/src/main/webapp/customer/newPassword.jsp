<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="checkout-main-area">
                    <h2>New Password</h2>
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
                                                    <h2>New Password</h2>
                                                    <form id="newPassword" action="/account/newpassword" method="post" style="margin-top: 10px">
                                                        <div class="form-group">
                                                            <label>Email <sup></sup></label>
                                                            <input name="email" type="text" class="form-control" readonly="" value="<%=(String)session.getAttribute("email")%>">
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
                                                        
                                                        <div class="block-button-left">
                                                            <input type="hidden" name="newPassword" value="newPassword"> 
                                                            <button class="btn btn-primary" type="submit">Update</button>
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
        form: "#newPassword",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#newpassword", "Password is required"),
            Validator.isRequire("#confirm", "Confirm Pasword is required"),
            Validator.isConfirmPassword("#confirm","#newpassword", "Confirm password does not match new password")
        ]
    });
</script>