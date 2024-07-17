<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="checkout-main-area">
                    <h2>Login</h2>
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
                                                    <h2>Login</h2>
                                                    <a style="display: block;margin-bottom: 10px" id="loginGoogle" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/login&response_type=code&client_id=457078457719-toc7bkb07iv1f0agnf4otfeusnegdhev.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary btn-block"><i style="margin-right:15px;font-size: 18px;" class="fab fa-google-plus-g"></i>Login With Google</a>
                                                    <label>Already registered?</label> <a href="/register" style="color: #00A0DC; text-decoration: underline">Register now!</a>
                                                    <form id="login" action="/login" method="post">
                                                        <div class="form-group">
                                                            <label>Username <sup>*</sup></label>
                                                            <input id="username" name="username" type="text" class="form-control" placeholder="Type your username">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Password <sup>*</sup></label>
                                                            <input id="password" name="password" type="password" class="form-control" placeholder="Type your password">
                                                            <div class="message"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <p style="color:red"><%=request.getAttribute("failLogin")!=null?request.getAttribute("failLogin"):""%></p>
                                                        </div>
                                                        <div class="block-button-right">
                                                            <a href="/account/forgot">Forgot your pasword?</a>
                                                            <input type="hidden" name="login" value="login"> 
                                                            <button class="btn btn-primary" type="submit">Login</button>
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
        form: "#login",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#username", "Username is required"),
            Validator.isRequire("#password", "Password is required"),
        ]
    });
</script>

<script>
    <%
        String resetOTP = (String) session.getAttribute("resetOTP");
        if (resetOTP != null) {
            
    %>
    Swal.fire({
        icon: "error",
        title: "Your account has been locked due to entering the wrong OTP code too many times!",
        showConfirmButton: true,
    });
     
    <% }
        session.removeAttribute("resetOTP");
    %>
</script>

    <script>
        <%
            String successUpdateNewPassword = (String) session.getAttribute("successUpdateNewPassword");
            if (successUpdateNewPassword != null) {

        %>
        Swal.fire({
            icon: "success",
            title: "Reset Password Sucessfully!",
            showConfirmButton: false,
            timer: 2000
        });

        <% }
            session.removeAttribute("successUpdateNewPassword");
        %>
    </script>