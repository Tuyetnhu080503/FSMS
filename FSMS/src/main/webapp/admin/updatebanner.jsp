<%@page import="Models.Banner"%>
<%@page import="DAOs.BannerDAO"%>
<%@page import="Models.Account"%>

<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="sec-heading-area">
                        <h2 style="font-size: 28px">Update Banner</h2>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <%-- Display success or error messages --%>
                            <c:if test="${not empty updateBannerMessageError}">
                                <script>
                                    // Display error message with SweetAlert
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: '${updateBannerMessageError}'
                                    });
                                </script>
                            </c:if>
                            <%-- Display name conflict error messages --%>
                            <c:if test="${not empty updateBannerSameNameMessageError}">
                                <script>
                                    // Display name conflict error message with SweetAlert
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: '${updateBannerSameNameMessageError}'
                                    });
                                </script>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/UploadController" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="updateBanner">
                                <input type="hidden" name="bannerId" value="${detail.bannerId}">
                                <div class="form-group">
                                    <label for="bannerId">Banner ID</label>
                                    <input type="text" class="form-control" id="bannerId" name="bannerId" value="${detail.bannerId}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="bannerName">Banner Name</label>
                                    <input type="text" class="form-control" id="bannerName" name="bannerName" value="${detail.bannerName}" required>
                                </div>
                                <div class="form-group">
                                    <label for="image">Current Image</label><br>
                                    <img src="${detail.image}" alt="${detail.bannerName}" class="img-thumbnail" style="max-width: 200px;"><br><br>
                                    <label for="newImage">New Image (optional)</label>
                                    <input type="file" class="form-control-file" id="newImage" name="newImage">
                                </div>
                                <div class="form-group">
                                    <label for="content">Content</label>
                                    <textarea class="form-control" id="content" name="content" rows="5" required>${detail.content}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="isActive">Active</label><br>
                                    <select class="form-control" id="isActive" name="isActive">
                                        <option value="true" ${detail.isActive ? 'selected' : ''}>Yes</option>
                                        <option value="false" ${!detail.isActive ? 'selected' : ''}>No</option>
                                    </select>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary">Update Banner</button>
                                    <a href="/admin/banners" class="btn btn-default">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>


<!-- SweetAlert2 CSS and JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
