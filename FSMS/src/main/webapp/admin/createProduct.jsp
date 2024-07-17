<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">			
            <div class="row">
                <div class="myaccount-dashboard-area cart-page-main-area">
                    <div class="page-wrapper">
                        <div class="content container-fluid">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card comman-shadow">
                                        <div class="card-body">
                                            <form id="formCreateProduct" action="/upload/createProduct" method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="form-title student-info">Product Information</h5>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div style="margin-bottom: 30px" class="form-group students-up-files">
                                                            <label>Upload Product Image</label>
                                                            <div style="margin-bottom: 20px" class="profile-image">
                                                                <img style="display: none" id="productImg" width="100" alt="User Image"
                                                                     src="">
                                                            </div>
                                                            <div class="upload">
                                                                <input id="uploadProductImage" name="productImage" type="file"
                                                                       class="form-control form-control-sm">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-8"></div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Product Name <span class="login-danger">*</span></label>
                                                            <input id="productName" name="productName" class="form-control" type="text"
                                                                   placeholder="Enter Product Name">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Description <span class="login-danger">*</span></label>
                                                            <input id="description" name="description" class="form-control" type="text"
                                                                   placeholder="Enter Description">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Price<span class="login-danger">*</span></label>
                                                            <input id="price" name="price" class="form-control" type="text"
                                                                   placeholder="Enter Price">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Category <span class="login-danger">*</span></label>
                                                            <select id="category" name="categoryId" class="form-control">
                                                                <option value="">Select Category</option>
                                                                <%
                                                                    DAOs.CategoryDAO dao = new DAOs.CategoryDAO();
                                                                    ResultSet rs = dao.getAllCategory();
                                                                    while (rs.next()) {
                                                                        int categoryId = rs.getInt("CategoryID");
                                                                        String categoryName = rs.getString("Name");
                                                                %>
                                                                <option value="<%= categoryId%>"><%= categoryName%></option>
                                                                <% } %>
                                                            </select>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Color <span class="login-danger">*</span></label>
                                                            <input id="color" name="color" class="form-control" type="text" placeholder="Enter Product Color">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Size <span class="login-danger">*</span></label>
                                                            <input id="size" name="size" class="form-control" type="text" placeholder="Enter Product Size">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Quantity <span class="login-danger">*</span></label>
                                                            <input id="quantity" name="quantity" class="form-control" type="text"
                                                                   placeholder="Enter Quantity">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                   


                                                    <input type="hidden" name="createProduct" value="createProduct">
                                                    <div class="col-12">
                                                        <div class="student-submit">
                                                            <button style="background: #ea7127;border-color:#ea7127" type="submit"
                                                                    class="btn btn-primary">Submit</button>
                                                        </div>
                                                    </div>
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
        </section>
        <!-- /.content -->
    </div>
</div>

<script>
// Initialize Validator
    Validator({
        form: "#formCreateProduct",
        message: ".message",
        invalid: "login-danger",
        rules: [
            Validator.isRequire("#uploadProductImage", "Product Image is required"),
            Validator.isImage("#uploadProductImage", "Product must be image"),
            Validator.isRequire("#productName", "Product Name is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#price", "Price is required"),
            Validator.isPositive("#price", "Product price must be greater than 0"),
            Validator.isRequire("#category", "Category is required"),
            Validator.isRequire("#color", "Color is required"),
            Validator.isRequire("#size", "Size is required"),
            Validator.isRequire("#quantity", "Quantity is required")
        ]
    });
</script>

<script>
    <%
        String createAccount = (String) session.getAttribute("createProduct");
        if (createAccount == "fail") {

    %>
    Swal.fire({
        icon: "error",
        title: "Fail Create Product! Product is already exist!",
        showConfirmButton: false,
        timer: 2000
    });

    <% }
        session.removeAttribute("createProduct");
    %>
</script>