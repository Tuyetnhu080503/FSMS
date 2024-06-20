<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="checkout-main-area">
                    <h2>Forgot Password</h2>
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
                                                    <h2>Forgot Password</h2>
                                                    <label>Enter the registered email address.</label>
                                                    <label>Then we'll email a OTP to this address.</label>
                                                    <form id="forgotPassword" action="/account/forgot" method="post">
                                                        <div style="margin-top: 10px" class="form-group">
                                                            <label>Enter your email <sup>*</sup></label>
                                                            <input id="email" name="email" type="text" class="form-control" placeholder="Type your email">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <p style="color:red"><%=request.getAttribute("notSentOTP")!=null?request.getAttribute("notSentOTP"):""%></p>
                                                        </div>
                                                        <div class="block-button-left">
                                                            <input type="hidden" name="getNewPassword" value="getNewPassword"> 
                                                            <button style="font-size: 13px" class="btn btn-primary" type="submit">Get New Password</button>
                                                            <button style="font-size: 13px;margin-left: 10px" class="btn btn-danger"><a style="text-decoration: none;color: white" href="/login">Back to Login</a></button>
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
        form: "#forgotPassword",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email","Email must be right format. Example: abc@gmail.com")
        ]
    });
</script>

