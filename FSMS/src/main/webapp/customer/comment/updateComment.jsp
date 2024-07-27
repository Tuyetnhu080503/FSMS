<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CommentDAO"%>

<style>
    .nav-tabs .nav-link {
        color: #00A9E0;
    }

    .nav-tabs .nav-link.active {
        background-color: #00A9E0;
        color: white;
    }

    .nav-tabs .nav-item {
        flex: 1;
        text-align: center;
    }

    .nav-tabs {
        display: flex;
        justify-content: space-around;
    }

    .tab-content {
        border: 1px solid #ddd;
        border-top: none;
        padding: 20px;
        background-color: #f9f9f9;
    }

    .order-list {
        margin-top: 20px;
    }

    .order-item {
        background-color: #fff;
        padding: 15px;
        margin-bottom: 10px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        position: relative;
    }

    .product-list {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .product-item {
        display: flex;
        align-items: center;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #f1f1f1;
    }

    .product-item img {
        width: 100px;
        height: auto;
        margin-right: 10px;
    }

    .product-details {
        display: flex;
        flex-direction: column;
    }

    .order-footer {
        bottom: 15px;
        right: 15px;
        text-align: right;
        margin: 20px 0;
    }

    .total-price {
        font-family: 'Poppins', sans-serif;
    }


</style>
<section class="main-content-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-9 col-xl-9">
                <div class="checkout-main-area">
                    <h2>Comment</h2>
                    <div class="order-list">
                        <div class="order-item">
                            <form id="updateComment" action="/upload/updateComment"
                                                  method="post" enctype="multipart/form-data" >
                                <div class="product-list">
                                    <%
                                        String orderItemsStr = "";
                                        ResultSet rsC = (ResultSet) request.getAttribute("rsC");
                                        while (rsC.next()) {
                                            int rating = rsC.getInt("Rating");
                                            orderItemsStr += "-" + rsC.getString("OrderItemsID");
                                    %>
                                    <div style="margin-top: 30px" class="product-item" data-orderItemID="<%=rsC.getInt("OrderItemsID")%>">
                                        <img src="${pageContext.request.contextPath}/assets/images/product/<%=rsC.getString("Image")%>" alt="Product Image">
                                        <div class="product-details">
                                            <p><%=rsC.getString("Name")%></p>
                                            <p>Size: <%=rsC.getString("Size")%></p>
                                            <p>Color: <%=rsC.getString("Color")%></p>
                                            <p>Quantity: <%=rsC.getString("Quantity")%></p>
                                            <p>Price: <%=rsC.getString("UnitPrice")%></p>
                                        </div>
                                    </div>
                                    <p style="font-size: 20px">Reviews</p>
                                    <div class="table-responsive">
                                        <table class="table-data-sheet">
                                            <thead>
                                                <tr>
                                                    <th> </th>
                                                    <th>1 star</th>
                                                    <th>2 star</th>
                                                    <th>3 star</th>
                                                    <th>4 star</th>
                                                    <th>5 star</th>	
                                                </tr>														
                                            </thead>
                                            <tbody>
                                                <tr class="first">
                                                    <td class="left-align">User Vote</td>
                                                    <td>
                                                        <input type="radio" value="1" name="vote-<%=rsC.getString("OrderItemsID")%>" <%=rating == 1 ? "checked" : ""%>>
                                                    </td>
                                                    <td>
                                                        <input type="radio" value="2" name="vote-<%=rsC.getString("OrderItemsID")%>" <%=rating == 2 ? "checked" : ""%>>
                                                    </td>
                                                    <td>
                                                        <input type="radio" value="3" name="vote-<%=rsC.getString("OrderItemsID")%>" <%=rating == 3 ? "checked" : ""%>>
                                                    </td>
                                                    <td>
                                                        <input type="radio" value="4" name="vote-<%=rsC.getString("OrderItemsID")%>" <%=rating == 4 ? "checked" : ""%>>
                                                    </td>
                                                    <td>
                                                        <input type="radio" value="5" name="vote-<%=rsC.getString("OrderItemsID")%>" <%=rating == 5 ? "checked" : ""%>>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>															
                                    </div>
                                    <div class="col-12 col-sm-12">
                                        <div class="form-group local-forms">
                                            <label>Comment</label>
                                            <textarea style="font-size: 14px"  name="comment-<%=rsC.getString("OrderItemsID")%>" class="form-control address"
                                                      id="exampleFormControlTextarea1" rows="3"
                                                      placeholder="Enter Comment"><%=rsC.getString("Comment")%></textarea>
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div style="margin-bottom: 30px" class="form-group students-up-files" data-orderItemID="<%=rsC.getInt("OrderItemsID")%>">
                                            <label>Upload Image</label>
                                            <div style="margin-bottom: 20px" class="profile-image">
                                                <img style="<%=rsC.getString("CommentImage").equals("") ? "display:none;" : ""%>" class="avatarImg" width="100" alt="User Image"
                                                     src="${pageContext.request.contextPath}/assets/images/comment/<%=rsC.getString("CommentImage")%>">
                                            </div>
                                            <div class="upload">
                                                <input name="avatar-<%=rsC.getString("OrderItemsID")%>" type="file"
                                                        class="form-control form-control-sm uploadAvatar">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                    <div style="display: flex;justify-content: end">
                                        <input type="hidden" name="updateComment" value="updateComment">
                                        <input type="hidden" name="ids" value="<%=orderItemsStr.substring(1)%>">
                                        <%
                                            String encodedString = URLEncoder.encode(orderItemsStr.substring(1) , "UTF-8");
                                        %>
                                        <a class="cancel-order mb-2 mr-2 btn-icon btn btn-danger" href="/orders/comment/delete?id=<%=encodedString%>" style="margin-right: 20px">Delete</a>
                                        <button type="submit" style="background:#ee4d2d ;border-color: #ee4d2d;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>	
</section>


<script>
    const uploadAvatarElements = document.querySelectorAll('.uploadAvatar');
    uploadAvatarElements.forEach(function (element) {
        element.addEventListener('change', function (e) {
            const selectedFile = e.target.files[0];
            let isImg = false;
            const endFile = selectedFile.name.split(".").pop().toLowerCase();
            if (["jpeg", "jpg", "png", "gif", "webp"].includes(endFile)) {
                isImg = true;
            } else {
                isImg = false;
            }

            const parentDiv = element.closest('.students-up-files');
            const imgElement = parentDiv.querySelector('.avatarImg');

            if (isImg) {
                const imageURL = URL.createObjectURL(selectedFile);
                imgElement.src = imageURL;
                imgElement.style.display = 'block';
            } else {
                imgElement.src = "";
                imgElement.style.display = 'none';
            }
        });
    });
</script>