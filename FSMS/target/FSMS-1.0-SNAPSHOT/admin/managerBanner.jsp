<%@page import="DAOs.BannerDAO"%>
<%@page import="java.sql.ResultSet"%>

<!-- Include SweetAlert CSS and JavaScript -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap4.min.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>



<div class="content-wrapper">
    <section class="content-header">
        
        
    </section>

    <div class="container">
        
        <div class="table-responsive">
            
            <table id="viewBanners" class="table table-hover table-striped table-bordered">
    <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">View Banners</h3>
            </div>
            <div class="col-auto text-end float-end ms-auto download-grp">
                <a style="background: #ea7127;border-color:#ea7127 " href="/admin/crbanner" class="btn btn-primary"><i class="fas fa-plus"></i></a>
            </div>
        </div>
                <thead class="student-thread">
                    <tr>
                        <th>No.</th>
                        <th>Banner Name</th>
                        <th>Image</th>
                        <th>Content</th>
                        <th>Active</th>
                        <th>Created At</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="x" items="${Listb}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${x.bannerName}</td>
                        <td><img src="${x.image}" alt="${x.bannerName}" width="100"></td>
                        <td>${x.content}</td>
                        <td>${x.isActive ? 'Yes' : 'No'}</td>
                        <td>${x.createAt}</td>
                        <td class="text-center">
                            <a href="/admin/banners/upbanner?sid=${x.bannerId}" class="btn btn-warning btn-sm" style="color: white;">Update</a>
                            <a href="/admin/banners/delete/${x.bannerId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this banner?');" style="color: white;">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#viewBanners').DataTable();
    });
</script>
