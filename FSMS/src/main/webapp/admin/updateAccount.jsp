
<%@page import="Models.EmployeeProfile"%>
<%@page import="DAOs.EmployeeDAO"%>
<%@page import="Models.Account"%>
<%
    Account account = (Account) request.getAttribute("account");
    EmployeeProfile empyPro = null;
    if (account.getRoleId() != 4) {
        empyPro = (EmployeeProfile) request.getAttribute("employeePro");
    }
%>
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
                                            <form id="formUpdateStudent" action="/upload/updateAccount"
                                                  method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <h5 class="form-title student-info">Account Information</h5>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div style="margin-bottom: 30px" class="form-group students-up-files">
                                                            <label>Upload Avatar</label>
                                                            <div style="margin-bottom: 20px" class="profile-image">
                                                                <img id="avatarImg" width="100" alt="User Image"
                                                                     src="/assets/images/avatar/<%= account.getAvatar()%>">
                                                            </div>
                                                            <div class="upload">
                                                                <input id="uploadAvatar" name="avatar" type="file"
                                                                       class="form-control form-control-sm">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-8">
                                                        <a id="banAccount" href="${pageContext.request.contextPath}/admin/accounts/block/<%=account.getAccountId()%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-danger"><i class="pe-7s-trash btn-icon-wrapper"></i>Lock Account</button></a> 
                                                        <a id="unbanAccount" href="${pageContext.request.contextPath}/admin/accounts/unblock/<%=account.getAccountId()%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-primary"><i class="pe-7s-tools btn-icon-wrapper"> </i>Unlock Account</button></a> 
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>First Name <span class="login-danger">*</span></label>
                                                            <input id="firstname" name="firstname" class="form-control" type="text"
                                                                   placeholder="Enter First Name" value="<%= account.getFirstName()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Last Name <span class="login-danger">*</span></label>
                                                            <input id="lastname" name="lastname" class="form-control" type="text"
                                                                   placeholder="Enter Last Name" value="<%= account.getLastName()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Gender <span class="login-danger">*</span></label>
                                                            <select name="gender" class=" form-select form-control select">
                                                                <option <%=account.getGender().equals("Female") ? "selected" : ""%> value="Female">Female</option>
                                                                <option  <%=account.getGender().equals("Male") ? "selected" : ""%> value="Male">Male</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Date Of Birth <span class="login-danger">*</span></label>
                                                            <input id="birthdate" name="birthdate" class="form-control" type="date"
                                                                   placeholder="DD-MM-YYYY" value="<%= account.getDob()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Email <span class="login-danger">*</span></label>
                                                            <input id="email" name="email" class="form-control" type="text"
                                                                   placeholder="Enter Email"value="<%= account.getEmail()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Phone <span class="login-danger">*</span></label>
                                                            <input id="phone" name="phone" class="form-control" type="text"
                                                                   placeholder="Enter Phone" value="<%= account.getPhoneNumber()%>">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>

                                                    <c:if test="${account.getRoleId() != 4}">
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Employee Code <span class="login-danger">*</span></label>
                                                                <input id="employeeCode" name="employeeCode" class="form-control" type="text"
                                                                       placeholder="Enter Employee Code" value="<%= empyPro.getEmployeeCode()%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>CCCD <span class="login-danger">*</span></label>
                                                                <input id="cccd" name="cccd" class="form-control" type="text"
                                                                       placeholder="Enter CCCD" value="<%= empyPro.getCccd()%>">
                                                                <div class="message"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-sm-4">
                                                            <div class="form-group local-forms">
                                                                <label>Role <span class="login-danger">*</span></label>
                                                                <select name="role" class=" form-select form-control select">
                                                                    <option <%=account.getRoleId() == 1 ? "selected" : ""%> value="staff">Admin</option>
                                                                    <option <%=account.getRoleId() == 2 ? "selected" : ""%> value="staff">Staff</option>
                                                                    <option <%=account.getRoleId() == 3 ? "selected" : ""%> value="shipper">Shipper</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Address<span class="login-danger">*</span></label>
                                                            <textarea id="address" name="address" class="form-control"
                                                                      id="exampleFormControlTextarea1" rows="3"
                                                                      placeholder="Enter Address" ><%= account.getAddress()%></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>

                                                    <input type="hidden" name="updateAccount" value="updateAccount">
                                                    <input type="hidden" name="accountId" value="<%=account.getAccountId()%>">
                                                    <input type="hidden" name="roleId" value="<%=account.getRoleId()%>">
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
    document.querySelector("#uploadAvatar").addEventListener('change', (e) => {
        const selectedFile = e.target.files[0];
        let isImg = false;
        let endFile = selectedFile.name.split(".")[selectedFile.name.split(".").length - 1];
        if (endFile == "jpeg" || endFile == "jpg" || endFile == "png" || endFile == "gif" || endFile == "webp") {
            isImg = true;
        } else {
            isImg = false;
        }
        if (isImg) {
            const imageURL = URL.createObjectURL(selectedFile);
            document.querySelector('#avatarImg').src = imageURL;
            document.querySelector('#avatarImg').style.display = 'block';
        } else {
            document.querySelector('#avatarImg').src = "";
            document.querySelector('#avatarImg').style.display = 'none';
        }
    });
    Validator({
        form: "#formUpdateStudent",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isFutureDate("#birthdate", "Birthdate must be in past"),
            Validator.isRequire("#address", "Address is required"), <c:if test="${account.getRoleId() != 4}">
                                                        Validator.isRequire("#employeeCode", "Employee Code is required"),
                                                            Validator.isRequire("#cccd", "CCCD is required"),</c:if>
        ]
    });
    </script>

    <script>
        <%
            String updateAccount = (String) session.getAttribute("updateAccount");
            if (updateAccount == "fail") {

        %>
        Swal.fire({
            icon: "error",
            title: "Fail Update Account!",
            showConfirmButton: false,
            timer: 2000
        });

        <% }
            session.removeAttribute("updateAccount");
        %>
    </script>
        <script>
            <%
                if (account.isIsActive()) {%>
        document.querySelector("#banAccount").style.display = 'block';
            <%} else {%>
        document.querySelector("#unbanAccount").style.display = 'block';
            <%}
            %>
        </script>
        
        <script>
    document.querySelector("#banAccount").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Are you sure to block the account?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, block it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#banAccount").href;
            }
        });
    });

    document.querySelector("#unbanAccount").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to unblock the account?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, unblock it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#unbanAccount").href;
            }
        });
    });
</script>
<script>
        <%
            String duplicateEmail = (String) session.getAttribute("duplicateEmail");
            if (duplicateEmail == "fail") {

        %>
        Swal.fire({
            icon: "error",
            title: "Email Duplicate!",
            showConfirmButton: false,
            timer: 2000
        });

        <% }
            session.removeAttribute("duplicateEmail");
        %>
</script>