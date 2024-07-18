<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<div class="content-wrapper">
    <section class="content-header">
        <h1>Create New Banner</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Banner Details</h3>
                    </div>
                    <div class="box-body">
                        <%-- Display success or error messages --%>
                        <c:if test="${not empty addBannerMessageError}">
                            <script>
                                // Display error message with SweetAlert
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: '${addBannerMessageError}'
                                });
                            </script>
                        </c:if>
                        <%-- Display name conflict error messages --%>
                        <c:if test="${not empty addBannerSameNameMessageError}">
                            <script>
                                // Display name conflict error message with SweetAlert
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: '${addBannerSameNameMessageError}'
                                });
                            </script>
                        </c:if>
                        <form action="${pageContext.request.contextPath}/UploadController" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="addBanner">
                            <div class="form-group">
                                <label for="bannerName">Banner Name</label>
                                <input type="text" class="form-control" id="bannerName" name="bannerName" required>
                            </div>
                            <div class="form-group">
                                <label for="image">Image</label>
                                <input type="file" class="form-control" id="image" name="image" required>
                            </div>
                            <div class="form-group">
                                <label for="content">Content</label>
                                <textarea class="form-control" id="content" name="content" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="isActive">Active</label>
                                <select class="form-control" id="isActive" name="isActive">
                                    <option value="true">Yes</option>
                                    <option value="false">No</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Create Banner</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Include SweetAlert JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
