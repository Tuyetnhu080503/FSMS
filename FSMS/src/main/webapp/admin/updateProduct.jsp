<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Product"%>
<%@ page import="DAOs.ProductDAO"%>
<%@ page import="Models.ProductType"%>
<%
    Product product = (Product) request.getAttribute("product");
    ProductType productType = (ProductType) request.getAttribute("productType");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                                            <form id="formCreateProduct" action="/upload/updateProduct" method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="form-title student-info">Product Information</h5>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group students-up-files">
                                                            <label>Upload Product Image</label>
                                                            <div class="profile-image">
                                                                <img id="productImg" width="100" alt="Product Image" src="<%= product != null ? product.getImage(): "" %>" style="display: <%= product != null && product.getImage()!= null && !product.getImage().isEmpty() ? "block" : "none" %>">
                                                            </div>
                                                            <div class="upload">
                                                                <input id="uploadProductImage" name="productImage" type="file" class="form-control form-control-sm">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-8"></div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Product Name <span class="login-danger">*</span></label>
                                                            <input id="productName" name="productName" class="form-control" type="text" placeholder="Enter Product Name" value="<%= product != null ? product.getName() : "" %>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Description <span class="login-danger">*</span></label>
                                                            <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter Product Description"><%= product != null ? product.getDescription() : "" %></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Price <span class="login-danger">*</span></label>
                                                            <input id="price" name="price" class="form-control" type="number" placeholder="Enter Product Price" value="<%= product != null ? product.getPrice() : "" %>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Category <span class="login-danger">*</span></label>
                                                            <select name="category" class="form-select form-control select">
                                                                <!-- Populate categories dynamically -->
                                                                <option value="1">Category 1</option>
                                                                <option value="2">Category 2</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Color <span class="login-danger">*</span></label>
                                                            <input id="color" name="color" class="form-control" type="text" placeholder="Enter Product Color" value="<%= productType != null ? productType.getColor() : "" %>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Size <span class="login-danger">*</span></label>
                                                            <input id="size" name="size" class="form-control" type="text" placeholder="Enter Product Size" value="<%= productType != null ? productType.getSize() : "" %>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Quantity <span class="login-danger">*</span></label>
                                                            <input id="quantity" name="quantity" class="form-control" type="number" placeholder="Enter Product Quantity" value="<%= productType != null ? productType.getQuantity() : "" %>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="productId" value="<%= product != null ? product.getProductId() : "" %>">

                                                    <input type="hidden" name="updateProduct" value="updateProduct">
                                                    <div class="col-12">
                                                        <div class="student-submit">
                                                            <button style="background: #ea7127; border-color:#ea7127" type="submit" class="btn btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <% 
                                                String createProduct = (String) session.getAttribute("updateProduct");
                                                if ("fail".equals(createProduct)) {
                                                    String errorMessage = (String) session.getAttribute("errorMessage");
                                                    if (errorMessage != null) {
                                            %>
                                            <div class="alert alert-danger">
                                                <%= errorMessage %>
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
                                                session.removeAttribute("updateProduct");
                                            %>
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
