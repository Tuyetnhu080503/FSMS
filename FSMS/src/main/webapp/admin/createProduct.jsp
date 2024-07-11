<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<style>
    .message {
        color: red; /* Change message color to red */
    }
</style>
<div class="content-wrapper">
    <div class="container-full">
        <section class="content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <form id="formCreateProduct" action="/upload/createProduct" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title student-info">Product Information</h5>
                                    </div>
                                    <div class="col-12 col-sm-3">
                                        <div class="form-group students-up-files">
                                            <label>Upload Product Image</label>
                                            <div class="profile-image">
                                                <img id="productImg" width="100" alt="Product Image" src="" style="display: none">
                                            </div>
                                            <div class="upload">
                                                <input id="uploadProductImage" name="productImage" type="file" class="form-control form-control-sm">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Product Name <span class="login-danger">*</span></label>
                                            <input id="productName" name="productName" class="form-control" type="text" placeholder="Enter Product Name">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Description <span class="login-danger">*</span></label>
                                            <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter Product Description"></textarea>
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Price <span class="login-danger">*</span></label>
                                            <input id="price" name="price" class="form-control" type="number" placeholder="Enter Product Price">
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
                                            <select id="color" name="color" class="form-control">
                                                <option value="">Select Color</option>
                                                <option value="Red">Red</option>
                                                <option value="Blue">Blue</option>
                                                <option value="Green">Green</option>
                                                <option value="Yellow">Yellow</option>
                                                <option value="Other">Other</option>
                                            </select>
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Size <span class="login-danger">*</span></label>
                                            <select id="size" name="size" class="form-control">
                                                <option value="">Select Size</option>
                                                <option value="S">S</option>
                                                <option value="M">M</option>
                                                <option value="L">L</option>
                                                <option value="XL">XL</option>
                                                <option value="XXL">XXL</option>
                                            </select>
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Quantity <span class="login-danger">*</span></label>
                                            <input id="quantity" name="quantity" class="form-control" type="number" placeholder="Enter Product Quantity">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="createProduct" value="createProduct">
                                    <div class="col-12">
                                        <div class="student-submit text-center">
                                            <button style="background: #ea7127; border-color:#ea7127" type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%
                                String createProduct = (String) session.getAttribute("createProduct");
                                if ("fail".equals(createProduct)) {
                                    String errorMessage = (String) session.getAttribute("errorMessage");
                                    if (errorMessage != null) {
                            %>
                            <div class="alert alert-danger mt-3">
                                <%= errorMessage%>
                            </div>
                            <script>
                                Swal.fire({
                                    icon: "error",
                                    title: "Fail Create Product!",
                                    showConfirmButton: false,
                                    timer: 2000
                                });
                            </script>
                            <%
                                        session.removeAttribute("errorMessage");
                                    }
                                }
                                session.removeAttribute("createProduct");
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
