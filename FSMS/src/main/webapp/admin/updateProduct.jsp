<%@page import="java.sql.ResultSet"%>
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
                                                            <img name="productImg" id="profile-image" width="100" alt="User Image"
                                                                     src="/assets/images/product/<%= product.getImage()%>">
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
                                                            <input id="productName" name="productName" class="form-control" type="text" placeholder="Enter Product Name" value="<%=product.getName()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Description <span class="login-danger">*</span></label>
                                                            <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter Product Description"><%= product.getDescription()%></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Price <span class="login-danger">*</span></label>
                                                            <input id="price" name="price" class="form-control" type="number" placeholder="Enter Product Price" value="<%= product.getPrice()%>">
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
                                                                <option value="<%= categoryId%>" <%= categoryId == product.getCategoryId() ? "selected" : "" %>><%= categoryName%></option>
                                                                <% }%>
                                                            </select>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Color <span class="login-danger">*</span></label>
                                                            <input id="color" name="color" class="form-control" type="text" placeholder="Enter Product Color" value="<%= productType.getColor()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Size <span class="login-danger">*</span></label>
                                                            <input id="size" name="size" class="form-control" type="text" placeholder="Enter Product Size" value="<%=productType.getSize()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Quantity <span class="login-danger">*</span></label>
                                                            <input id="quantity" name="quantity" class="form-control" type="number" placeholder="Enter Product Quantity" value="<%=productType.getQuantity()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="productId" value="<%= product.getProductId()%>">

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
