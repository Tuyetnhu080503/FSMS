<%@ page import="DAOs.ProductDAO" %>
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
                                    <div class="card card-table comman-shadow">
                                        <div class="card-body">

                                            <div class="page-header">
                                                <div class="row align-items-center">
                                                    <div class="col">
                                                        <h3 class="page-title">View Products</h3>
                                                    </div>
                                                    <div class="col-auto text-end float-end ms-auto download-grp">
                                                        <a style="background: #ea7127;border-color:#ea7127 " href="/admin/products/create" class="btn btn-primary"><i class="fas fa-plus"></i> Add Product</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="table-responsive">
                                                <table id="viewProducts" class="table table-hover table-striped table-bordered">
                                                    <thead class="student-thread">
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Price</th>
                                                            <th>Image</th>
                                                            <th>Category Name</th>
                                                            <th>Color</th>
                                                            <th>Size</th>
                                                            <th>Quantity</th>
                                                            <th class="text-end">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            ProductDAO productDAO = new ProductDAO();
                                                            ResultSet rs = productDAO.getAllProducts();
                                                            int count = 1;
                                                            while (rs.next()) {%> 
                                                        <tr>
                                                            <td><%=count++%></td>
                                                            <td><%=rs.getString("Name")%></td>
                                                            <td><%=rs.getString("Description")%></td>
                                                            <td><%=rs.getLong("Price")%></td>
                                                            <td><img  src="${pageContext.request.contextPath}/assets/images/product/<%=rs.getString("Image")%>" alt="Avatar"></td>
                                                            <td><%=rs.getString("CategoryName")%></td>
                                                            <td><%=rs.getString("Color")%></td>
                                                            <td><%=rs.getString("Size")%></td>
                                                            <td><%=rs.getInt("Quantity")%></td>
                                                            <td>
                                                                <a href="/admin/products/update/<%=rs.getInt("ProductID")%>">
                                                                    <button style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <form id="formDeleteProduct" action="/upload/deleteProduct"
                                                                      method="post" enctype="multipart/form-data">
                                                                    <input type="hidden" name="productId" value="<%=rs.getInt("ProductID")%>">
                                                                    <button type="submit" name="deleteProduct" style="background:red;border-color: red;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-danger"><i class="feather-trash-2"></i>Delete</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% }
                                                            rs.close();
                                                        %>
                                                    </tbody>
                                                </table>
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
    </div>
</div>

<!-- Optional: Include script for showing success message -->
<script>
    <% String createProduct = (String) session.getAttribute("createProduct");
        if (createProduct != null && createProduct.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Create Product Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("createProduct");
        } %>
</script>

<script>
    <% String updateProduct = (String) session.getAttribute("updateProduct");
        if (updateProduct != null && updateProduct.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Update Product Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("updateProduct");
        }%>
</script>
<script>
    <% String deleteProduct = (String) session.getAttribute("deleteProduct");
        if (deleteProduct != null && deleteProduct.equals("success")) { %>
    Swal.fire({
        icon: "success",
        title: "Delete Product Successfully!",
        showConfirmButton: false,
        timer: 2000
    });
    <% session.removeAttribute("deleteProduct");
        }%>
</script>
