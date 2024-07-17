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
                                                    <h2>Enter OTP</h2>
                                                    <form id="otp" action="/account/otp" method="post">
                                                        <div style="margin-top: 10px" class="form-group">
                                                            <label>Enter OTP <sup>*</sup></label>
                                                            <input id="otp" name="otp" type="number" class="form-control" placeholder="Type your OTP">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <p style="color:red"><%=request.getAttribute("failOTP") != null ? "You have entered incorrectly " + Integer.toString((int) session.getAttribute("enterOTP")) + " times. If you enter incorrectly 5 times, your account will be locked." : ""%></p>
                                                        </div>
                                                        <div class="block-button-left">
                                                            <input type="hidden" name="getOTP" value="getOTP"> 
                                                            <button style="font-size: 13px" class="btn btn-primary" type="submit">Reset Password</button>
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
        form: "#otp",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isExactNumber("#otp", 6, "OTP must be six digits"),
        ]
    });
</script>

<script>
    <%
        String sucessOTP = (String) session.getAttribute("sentOTP");
        if (sucessOTP != null) {

    %>
    Swal.fire({
//        position: "top-end",
        icon: "success",
        title: "OTP is sent to your email!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("sentOTP");
    %>
</script>

<script>
    <%
        String failOTP = (String) session.getAttribute("failOTP");
        if (failOTP != null) {

    %>
    Swal.fire({
//        position: "top-end",
        icon: "success",
        title: "OTP is sent to your email!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("sentOTP");
    %>
</script>
