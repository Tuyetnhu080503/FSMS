
<%@ page import="Models.Voucher" %>

<style>
    .content-wrapper {
        margin: 20px;
    }
    .voucher-card {
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 20px;
        padding: 15px;
        display: flex;
        align-items: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        background-color: #fff;
    }
    .voucher-details {
        display: flex;
        flex-direction: column;
        width: 100%;
    }
    .voucher-details h2 {
        margin: 0 0 10px 0;
        font-size: 24px;
        color: #333;
    }
    .voucher-details p {
        margin: 0 0 5px 0;
        font-size: 16px;
        color: #555;
    }
    .voucher-details .discount {
        color: #e67e22;
        font-weight: bold;
    }
    .box-header {
        background-color: #f7f7f7;
        padding: 10px 15px;
        border-bottom: 1px solid #ddd;
    }
    .box-title {
        font-size: 18px;
        margin: 0;
    }
    .box-body {
        padding: 15px;
    }
    .content-header h1 {
        font-size: 28px;
        margin-bottom: 20px;
    }
</style>

<div class="content-wrapper">
    <section class="content-header">
        <h1>All Vouchers</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Voucher List</h3>
                    </div>
                    <div class="box-body">
                        <c:forEach var="voucher" items="${voucherList}">
                            <div class="voucher-card">
                                <div class="voucher-details">
                                    <h2>Voucher ID: ${voucher.voucherID}</h2>
                                    <p>Discount Amount: ${voucher.discountAmount}</p>
                                    <p>Discount Percentage:  ${voucher.discountPercentage}%</p>
                                    <p>Expiry Date: <c:out value="${voucher.expiryDate != null ? voucher.expiryDate : 'N/A'}"/></p>
                                    <p>Quantity: <c:out value="${voucher.quantity != null ? voucher.quantity : 'N/A'}"/></p>
                                    <p>Minimum Price: <c:out value="${voucher.minimumPrice != null ? voucher.minimumPrice : 'N/A'}"/></p>
                                    <p class="discount">Active: ${voucher.active ? 'Yes' : 'No'}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
