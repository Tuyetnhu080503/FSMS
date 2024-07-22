


<style>
    /* Custom styles for order detail page */
    .track-line {
        height: 2px !important;
        background-color: #488978;
        opacity: 1;
    }

    .dot {
        height: 10px;
        width: 10px;
        margin-left: 3px;
        margin-right: 3px;
        margin-top: 0px;
        background-color: #488978;
        border-radius: 50%;
        display: inline-block
    }

    .big-dot {
        height: 25px;
        width: 25px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
        background-color: #488978;
        border-radius: 50%;
        display: inline-block;
    }

    .big-dot i {
        font-size: 12px;
    }

    .card-stepper {
        z-index: 0
    }

</style>
<section style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card card-stepper" style="border-radius: 10px;">
                    <div class="card-body p-4">

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-column">
                                <span class="lead fw-normal">Your order has been delivered</span>
                                <span class="text-muted small">by DHFL on 21 Jan, 2020</span>
                            </div>
                            
                        </div>
                        <hr class="my-4">

                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                            <span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span class="dot"></span>
                            <hr class="flex-fill track-line"><span
                                class="d-flex justify-content-center align-items-center big-dot dot">
                                <i class="fa fa-check text-white"></i></span>
                        </div>

                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="d-flex flex-column align-items-start"><span>15 Mar</span><span>Order placed</span>
                            </div>
                            <div class="d-flex flex-column justify-content-center"><span>15 Mar</span><span>Order
                                    placed</span></div>
                            <div class="d-flex flex-column justify-content-center align-items-center"><span>15
                                    Mar</span><span>Order Dispatched</span></div>
                            <div class="d-flex flex-column align-items-center"><span>15 Mar</span><span>Out for
                                    delivery</span></div>
                            <div class="d-flex flex-column align-items-end"><span>15 Mar</span><span>Delivered</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
