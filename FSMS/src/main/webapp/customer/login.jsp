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
                                                    <label>Already registered?</label> <a href="/register" style="color: #00A0DC; text-decoration: underline">Register now!</a>
                                                    <form action="/login" method="post">
                                                        <div class="form-group">
                                                            <label>Username <sup>*</sup></label>
                                                            <input name="username" type="text" class="form-control" placeholder="Type your username" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Password <sup>*</sup></label>
                                                            <input name="password" type="password" class="form-control" placeholder="Type your password" required>
                                                        </div>

                                                        <div class="block-button-right">
                                                            <a href="#">Forgot your pasword?</a>
                                                            
                                                            <button name="login" value="login" class="btn btn-primary" type="submit">Login</button>
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