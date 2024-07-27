<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Voucher"%>
<style>
        /* Custom styles for voucher detail page */
        .card {
            width: 100%;
            border-radius: 5px;
            box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
            background-color: #ffeded !important;
            padding: 10px;
            position: relative;
            margin-bottom: 20px;
        }
        .main,
        .copy-button {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .card::after,
        .card::before {
            position: absolute;
            content: "";
            height: 40px;
            border-radius: 40px;
            z-index: 1;
            top: 50px;
            background-color: #eee;
            width: 40px;
        }
        .card::after {
            right: -20px;
        }
        .card::before {
            left: -20px;
        }
        .co-img img {
            width: 100px;
            height: 100px;
        }
        .vertical {
            border-left: 5px dotted black;
            height: 100px;
            position: absolute;
            left: 40%;
        }
        .content h1 {
            font-size: 35px;
            margin-left: -20px;
            color: #565656;
        }
        .content h1 span {
            font-size: 18px;
        }
        .content h2 {
            font-size: 18px;
            margin-left: -20px;
            color: #565656;
            text-transform: uppercase;
        }
        .content p {
            font-size: 16px;
            color: #696969;
            margin-left: -20px;
        }
        .copy-button {
            margin: 12px 0 -5px 0;
            height: 45px;
            border-radius: 4px;
            padding: 0 5px;
            border: 1px solid #e1e1e1;
        }
        .copy-button input {
            width: 100%;
            height: 100%;
            border: none;
            outline: none;
            font-size: 15px;
        }
        .copy-button button {
            padding: 5px 20px;
            background-color: #dc143c;
            color: #fff;
            border: 1px solid transparent;
        }
        .buy {
            position: absolute;
            bottom: 20px;
            left: 20px;
            background-color: #dc143c;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
        }
        .voucher-details {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .voucher-details h3 {
            font-size: 20px;
            font-weight: bold;
        }
        .voucher-details p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
    ResultSet voucherRs = (ResultSet)request.getAttribute("voucher");
    voucherRs.next();
%>
<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="main">
                        <div style="margin-left: 20px" class="co-img">
                            <img src="/assets/images/voucher/voucher.png" alt="Voucher Image">
                        </div>
                        <div class="vertical"></div>
                        <div class="content">
                            <h2>Maximum discount <%=voucherRs.getInt("DiscountAmount")%>vnd</h2>
                            <p>Minimum order <%=voucherRs.getInt("MinimumPrice")%>vnd</p>
                            <h1><%=voucherRs.getInt("DiscountPercentage") == 0? "":voucherRs.getInt("DiscountPercentage")+ "%" %> <span><%=voucherRs.getInt("DiscountPercentage") == 0? "":"Coupon"%></span></h1>
                            <p>Valid till <%=voucherRs.getDate("ExpiryDate")%></p>
                        </div>
                    </div>
                </div>

                <div class="voucher-details">
                    <h3>Voucher Description</h3>
                    <p>This voucher provides a maximum discount of <%=voucherRs.getInt("DiscountAmount")%>vnd on a minimum order of <%=voucherRs.getInt("MinimumPrice")%>vnd. <%=voucherRs.getInt("DiscountPercentage") == 0? "": "You can enjoy a " +voucherRs.getInt("DiscountPercentage")+ "%" + " discount on your purchas" %>. The voucher is valid till <%=voucherRs.getDate("ExpiryDate")%>. Make sure to apply it at checkout to avail the discount.</p>
                    <p><strong>Terms and Conditions:</strong></p>
                    <ul>
                        <li>This voucher is valid for a single transaction only.</li>
                        <li>The discount amount is capped at <%=voucherRs.getInt("DiscountAmount")%>vnd.</li>
                        <li>Cannot be combined with other promotions or discounts.</li>
                        <li>The voucher is non-transferable and cannot be exchanged for cash.</li>
                        <li>The voucher is valid till <%=voucherRs.getDate("ExpiryDate")%>.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>