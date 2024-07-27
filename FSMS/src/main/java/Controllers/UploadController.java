/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.BannerDAO;
import DAOs.CommentDAO;
import DAOs.EmployeeDAO;
import DAOs.OrderDAO;
import DAOs.ProductDAO;
import DAOs.VoucherDAO;
import Hash.MD5;
import Models.Account;
import Models.Banner;
import Models.Comment;
import Models.EmployeeProfile;
import Models.Product;
import Models.ProductType;
import Models.Voucher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.UUID;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxRequestSize = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10)
@WebServlet("/UploadController")
public class UploadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String action = request.getParameter("action");

        if (request.getParameter("editProfile") != null) {
            String role = "";
            switch (acc.getRoleId()) {
                case 1:
                    role = "/admin";
                    break;
                case 2:
                    role = "/staff";
                    break;
                case 3:
                    role = "/shipper";
                    break;
                case 4:
                    role = "/account";
                    break;
                default:
                    break;
            }

            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String cccd = "";

            if (!role.equals("/account")) {
                cccd = request.getParameter("cccd");
            }

            String avatar = "";
            Part avatarPart = request.getPart("avatar");
            if (Paths.get(avatarPart.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(avatarPart.getSubmittedFileName()).toString();
                    avatarPart.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("editStatus", "fail");
                    response.sendRedirect(role + "/profile/edit");
                    return;
                }
            }

            Account accProfile = new Account(acc.getAccountId(), acc.getUsername(), acc.getPassword(), acc.getEmail(), firstName, lastName, birthdate, avatar, gender, phone, address, acc.isIsActive(), acc.getRoleId());

            AccountDAO accDAO = new AccountDAO();
            Account returnAccount = accDAO.updateCustomerProfile(accProfile, acc.getAccountId());

            if (!role.equals("/account")) {
                EmployeeDAO emDAO = new EmployeeDAO();
                emDAO.updateEmployeeCCCD(acc.getAccountId(), cccd);
            }

            if (returnAccount == null) {
                session.setAttribute("editStatus", "fail");
                response.sendRedirect(role + "/profile/edit");
            } else {
                session.setAttribute("editStatus", "success");
                session.setAttribute("acc", accProfile);
                response.sendRedirect(role + "/profile");
            }
        } else if (request.getParameter("createAccount") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String pass_hash = MD5.getMd5(password);
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String employeeCode = request.getParameter("employeeCode");
            String cccd = request.getParameter("cccd");
            String address = request.getParameter("address");
            String role = request.getParameter("role");
            int roleId = 0;
            if (role.equals("staff")) {
                roleId = 2;
            } else if (role.equals("shipper")) {
                roleId = 3;
            }

            String avatar = "";
            Part avatarPart = request.getPart("avatar");
            if (Paths.get(avatarPart.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(avatarPart.getSubmittedFileName()).toString();
                    avatarPart.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("createAccount", "fail");
                    response.sendRedirect("/admin/accounts/create");
                    return;
                }
            }

            Account accProfile = new Account(username, pass_hash, email, firstName, lastName, birthdate, avatar, gender, phone, address, true, roleId);

            AccountDAO accDAO = new AccountDAO();
            Account returnAccount = accDAO.addAccount(accProfile);

            EmployeeDAO emDAO = new EmployeeDAO();
            int accountID = emDAO.getAccountIdByUsername(returnAccount.getUsername());
            emDAO.addEmployee(new EmployeeProfile(accountID, cccd, employeeCode));

            if (returnAccount == null) {
                session.setAttribute("createAccount", "fail");
                response.sendRedirect("/admin/accounts/create");
            } else {
                session.setAttribute("createAccount", "success");
                response.sendRedirect("/admin/accounts");
            }

        } else if (request.getParameter("updateAccount") != null) {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            // Check duplicate email
            AccountDAO accDAO = new AccountDAO();
            if (accDAO.checkDuplicateEmail(email, accountId)) {
                session.setAttribute("duplicateEmail", "fail");
                response.sendRedirect("/admin/accounts/update/" + accountId);
                return;
            }

            if (roleId != 4) {
                String employeeCode = request.getParameter("employeeCode");
                String cccd = request.getParameter("cccd");
                String role = request.getParameter("role");
                if (role.equals("staff")) {
                    roleId = 2;
                } else if (role.equals("shipper")) {
                    roleId = 3;
                } else {
                    roleId = 1;
                }
                EmployeeDAO emDAO = new EmployeeDAO();
                emDAO.updateEmployee(accountId, cccd, employeeCode);
            }

            String avatar = "";
            Part avatarPart = request.getPart("avatar");
            if (Paths.get(avatarPart.getSubmittedFileName()).toString().isEmpty()) {
                avatar = accDAO.getAvatarByAccountId(accountId);
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(avatarPart.getSubmittedFileName()).toString();
                    avatarPart.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("updateAccount", "fail");
                    response.sendRedirect("/admin/accounts/update/" + accountId);
                    return;
                }
            }

            Account accProfile = new Account(accountId, "", "", email, firstName, lastName, birthdate, avatar, gender, phone, address, true, roleId);
            Account returnAccount = accDAO.updateAccount(accProfile);

            if (returnAccount == null) {
                session.setAttribute("updateAccount", "fail");
                response.sendRedirect("/admin/accounts/update/" + accountId);
            } else {
                session.setAttribute("updateAccount", "success");
                response.sendRedirect("/admin/accounts");
            }
        } else if (request.getParameter("createProduct") != null) {
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            long price = Long.parseLong(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // Handling product image upload
            String productImage = "";
            Part productImagePart = request.getPart("productImage");
            if (!Paths.get(productImagePart.getSubmittedFileName()).toString().isEmpty()) {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/product");
                    productImage = Paths.get(productImagePart.getSubmittedFileName()).toString();
                    productImagePart.write(realPath + "/" + productImage);
                } catch (Exception ex) {
                    session.setAttribute("createProduct", "fail");
                    session.setAttribute("errorMessage", "Failed to upload product image: " + ex.getMessage());
                    response.sendRedirect("/admin/product/create");
                    return;
                }
            } else {
                session.setAttribute("createProduct", "fail");
                session.setAttribute("errorMessage", "Product image is required.");
                response.sendRedirect("/admin/product/create");
                return;
            }

            Product product = new Product(productName, description, price, productImage, categoryId);
            ProductType productType = new ProductType(color, size, quantity);

            ProductDAO productDAO = new ProductDAO();
            try {
                boolean isExist = productDAO.isProductExist(productName, color, size);
                if (isExist) {
                    session.setAttribute("createProduct", "fail");
                    session.setAttribute("errorMessage", "Product already exists.");
                    response.sendRedirect("/admin/product/create");
                    return;
                }
                int result = productDAO.createProduct(product, productType);
                if (result > 0) {
                    session.setAttribute("createProduct", "success");
                    session.setAttribute("errorMessage", "product added success.");

                    response.sendRedirect("/admin/product");
                } else {
                    session.setAttribute("createProduct", "fail");
                    session.setAttribute("errorMessage", "Failed to create product in the database.");
                    response.sendRedirect("/admin/product/create");
                }
            } catch (Exception e) {
                session.setAttribute("createProduct", "fail");
                session.setAttribute("errorMessage", "Database error: " + e.getMessage());
                response.sendRedirect("/admin/product/create");
            }

        } else if (request.getParameter("updateProduct") != null) {
            ProductDAO dao = new ProductDAO();
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            long price = Long.parseLong(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String productImage = "";
            Part productImagePart = request.getPart("productImage");
            if (Paths.get(productImagePart.getSubmittedFileName()).toString().isEmpty()) {
                productImage = dao.getImgPathByProductId(productId);
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    productImage = Paths.get(productImagePart.getSubmittedFileName()).toString();
                    productImagePart.write(realPath + "/" + productImage);
                } catch (Exception ex) {
                    session.setAttribute("updateAccount", "fail");
                    response.sendRedirect("/admin/products/update/" + productId);
                    return;
                }
            }

            // Update Product and ProductType in database
            Product product = new Product(productId, productName, description, price, productImage, categoryId);
            ProductType productType = new ProductType(color, size, quantity);

            ProductDAO productDAO = new ProductDAO();
            try {
                int result = productDAO.updateProduct(product, productType);
                if (result > 0) {
                    session.setAttribute("updateProduct", "success");
                    response.sendRedirect("/admin/product");
                } else {
                    session.setAttribute("updateProduct", "fail");
                    response.sendRedirect("/admin/product/update/" + productId);
                }
            } catch (Exception e) {
                session.setAttribute("updateProduct", "fail");
                response.sendRedirect("/admin/product/update/" + productId);
            }
        } else if (request.getParameter(
                "deleteProduct") != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            ProductDAO productDAO = new ProductDAO();
            int result = productDAO.deleteProduct(productId);
            if (result > 0) {
                session.setAttribute("deleteProduct", "success");
            } else {
                session.setAttribute("deleteProduct", "fail");
            }
            response.sendRedirect("/admin/product");
        } else if (request.getParameter(
                "updateOrder") != null) {
            String orderId = request.getParameter("orderId");
            String status = request.getParameter("status");

            try {
                OrderDAO orderDAO = new OrderDAO();
                int employeeId = orderDAO.getEmployeeIdByAccountId(acc.getAccountId());
                int result = orderDAO.updateOrderStatus(orderId, status, employeeId);
                if (result > 0) {
                    session.setAttribute("updateOrder", "success");
                } else {
                    session.setAttribute("updateOrder", "fail");
                }
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("updateOrder", "fail");
            }
            AccountDAO accDAO = new AccountDAO();
            Account account = accDAO.getAccountByAccountID(acc.getAccountId());
            if (acc.getRoleId() == 1) {
                response.sendRedirect("/admin/order");
            } else if (acc.getRoleId() == 2) {
                response.sendRedirect("/staff/orders");
            } else if (acc.getRoleId() == 3) {
                response.sendRedirect("/shipper/orders");
            } 
        } else if (request.getParameter(
                "deleteOrder") != null) {
            try {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDAO orderDAO = new OrderDAO();
                int result = orderDAO.deleteOrder(orderId);
                if (result > 0) {
                    session.setAttribute("deleteOrder", "success");
                } else {
                    session.setAttribute("deleteOrder", "fail");
                }
                response.sendRedirect("/admin/order");
            } catch (SQLException ex) {
                Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("updateVoucher") != null) {
            int voucherId = Integer.parseInt(request.getParameter("voucherId"));
            int discountAmount = Integer.parseInt(request.getParameter("discountAmount"));
            Integer discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));

            // Parse and handle expiryDate correctly
            Timestamp expiryDate = null;
            String expiryDateStr = request.getParameter("expiryDate");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                java.util.Date parsedDate = dateFormat.parse(expiryDateStr);
                expiryDate = new Timestamp(parsedDate.getTime());
            } catch (ParseException e) {
                // Handle parse exception, e.g., log the error or redirect with an error message
                session.setAttribute("updateVoucher", "fail");
                response.sendRedirect("/admin/voucher/update/" + voucherId);
                return; // Exit the method if parsing fails
            }

            boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
            Integer quantity = Integer.parseInt(request.getParameter("quantity"));
            Integer minimumPrice = Integer.parseInt(request.getParameter("minimumPrice"));

            // Create a Voucher object
            Voucher voucher = new Voucher(voucherId, discountAmount, discountPercentage, expiryDate, isActive, quantity, minimumPrice);

            try {
                VoucherDAO voucherDAO = new VoucherDAO();
                boolean result = voucherDAO.updateVoucher(voucher);
                if (result) {
                    session.setAttribute("updateVoucher", "success");
                    response.sendRedirect("/admin/voucher");
                } else {
                    session.setAttribute("updateVoucher", "fail");
                    response.sendRedirect("/admin/voucher/update/" + voucherId);
                }
            } catch (Exception e) {
                session.setAttribute("updateVoucher", "fail");
                response.sendRedirect("/admin/voucher/update/" + voucherId);
            }
        } else if (request.getParameter(
                "deleteVoucher") != null) {
            try {
                int orderId = Integer.parseInt(request.getParameter("voucherId"));
                VoucherDAO voucherDAO = new VoucherDAO();
                boolean result = voucherDAO.deleteVoucher(orderId);
                if (result) {
                    session.setAttribute("deleteVoucher", "success");
                } else {
                    session.setAttribute("deleteVoucher", "fail");
                }
                response.sendRedirect("/admin/voucher");
            } catch (SQLException ex) {
                Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("createVoucher") != null) {
            try {
                int discountAmount = Integer.parseInt(request.getParameter("discountAmount"));
                int discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));

                // Parse and handle expiryDate correctly
                Timestamp expiryDate = null;
                String expiryDateStr = request.getParameter("expiryDate");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                try {
                    java.util.Date parsedDate = dateFormat.parse(expiryDateStr);
                    expiryDate = new Timestamp(parsedDate.getTime());
                } catch (ParseException e) {
                    // Handle parse exception, e.g., log the error or redirect with an error message
                    Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, "Error parsing expiryDate", e);
                    session.setAttribute("createVoucher", "fail");
                    response.sendRedirect("/admin/voucher/create");
                    return; // Exit the method if parsing fails
                }

                boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
                Timestamp createdDate = new Timestamp(System.currentTimeMillis()); // Assuming current date/time
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int minimumPrice = Integer.parseInt(request.getParameter("minimumPrice"));

                // Create a Voucher object
                Voucher voucher = new Voucher(discountAmount, discountPercentage, expiryDate, isActive, createdDate, quantity, minimumPrice);

                // Use VoucherDAO to add voucher to database
                VoucherDAO voucherDAO = new VoucherDAO();
                boolean result = voucherDAO.addVoucher(voucher);

                if (result) {
                    session.setAttribute("createVoucher", "success");
                    response.sendRedirect("/admin/voucher");
                } else {
                    session.setAttribute("createVoucher", "fail");
                    response.sendRedirect("/admin/voucher/create");
                }
            } catch (Exception e) {
                Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, "Error creating voucher", e);
                session.setAttribute("createVoucher", "fail");
                response.sendRedirect("/admin/voucher/create");
            }
        } else if (request.getParameter("registerAccount") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String pass_hash = MD5.getMd5(password);
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String role = "Customer";
            int roleId = 4;
            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("registerAccount", "fail");
                    response.sendRedirect("/account/register");
                }
            }

            Account accProfile = new Account(username, pass_hash, email, firstName, lastName, birthdate, avatar, gender, phone, address, true, roleId);

            AccountDAO accDAO = new AccountDAO();

            Account returnAccount = accDAO.addAccount(accProfile);

            if (returnAccount == null) {
                session.setAttribute("registerAccount", "fail");
                response.sendRedirect("/account/register");
            } else {
                session.setAttribute("registerAccount", "success");

                response.sendRedirect("/login");
            }
        } else if ("updateBanner".equals(action)) {
            updateBanner(request, response);
        } else if ("addBanner".equals(action)) {
            addBanner(request, response);
        } else if (request.getParameter("updateComment") != null) {
            String[] ids = request.getParameter("ids").split("-");
            
            
            CommentDAO cDAO = new CommentDAO();
            for (String part : ids) {
                int star = Integer.parseInt(request.getParameter("vote-" + part));
                String comment = request.getParameter("comment-" + part);
                Timestamp currentTimestamp = Timestamp.from(Instant.now());
                
                String avatar = "";
                Part avatarPart = request.getPart("avatar-" + part);
                if (Paths.get(avatarPart.getSubmittedFileName()).toString().isEmpty()) {
                    avatar = cDAO.getImageByID(Integer.parseInt(part));
                } else {
                    try {
                        String realPath = request.getServletContext().getRealPath("/assets/images/comment");
                        avatar = Paths.get(avatarPart.getSubmittedFileName()).toString();
                        avatarPart.write(realPath + "/" + avatar);
                    } catch (Exception ex) {
                        session.setAttribute("updateComment", "fail"); ////
                        response.sendRedirect("/orders");
                        return;
                    }
                }
                
                cDAO.updateComment(new Comment(Integer.parseInt(part),comment,star,avatar,currentTimestamp));
            }
            
            session.setAttribute("updateComment", "success");
            response.sendRedirect("/orders");
        } else if (request.getParameter("createComment") != null) {
            String[] ids = request.getParameter("ids").split("-");
            
            
            CommentDAO cDAO = new CommentDAO();
            for (String part : ids) {
                int star = Integer.parseInt(request.getParameter("vote-" + part));
                String comment = request.getParameter("comment-" + part);
                Timestamp currentTimestamp = Timestamp.from(Instant.now());
                
                String avatar = "";
                Part avatarPart = request.getPart("avatar-" + part);
                if (Paths.get(avatarPart.getSubmittedFileName()).toString().isEmpty()) {
                    avatar = "";
                } else {
                    try {
                        String realPath = request.getServletContext().getRealPath("/assets/images/comment");
                        avatar = Paths.get(avatarPart.getSubmittedFileName()).toString();
                        avatarPart.write(realPath + "/" + avatar);
                    } catch (Exception ex) {
                        session.setAttribute("createComment", "fail"); ////
                        response.sendRedirect("/orders");
                        return;
                    }
                }
                
                cDAO.addComment(new Comment(Integer.parseInt(part),comment,star,avatar,currentTimestamp));
            }
            
            session.setAttribute("createComment", "success");
            response.sendRedirect("/orders");
        }
    }

    private void updateBanner(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = request.getParameter("bannerId");
        String pbannerName = request.getParameter("bannerName");
        String pcontent = request.getParameter("content");
        boolean pisActive = Boolean.parseBoolean(request.getParameter("isActive"));

        BannerDAO dao = new BannerDAO();

        if (dao.checkBannerNameExists(pbannerName)) {
            session.setAttribute("updateBannerSameNameMessageError", "Banner with name '" + pbannerName + "' already exists.");
            response.sendRedirect(request.getContextPath() + "/admin/banners/upbanner?sid=" + sid);
            return;
        }

        String pimage = null;
        Part part = request.getPart("newImage");
        if (part != null && part.getSize() > 0) {
            String fileName = UUID.randomUUID() + "_" + Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String realPath = request.getServletContext().getRealPath("/assets/images/imagebanner");

            if (realPath != null) {
                File uploadDir = new File(realPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
            } else {
                session.setAttribute("updateBannerMessageError", "Server error: Upload directory not found.");
                response.sendRedirect(request.getContextPath() + "/admin/banners/upbanner?sid=" + sid);
                return;
            }

            try {
                part.write(realPath + "/" + fileName);
                pimage = "/assets/images/imagebanner/" + fileName;
            } catch (IOException e) {
                session.setAttribute("updateBannerMessageError", "Failed to upload image: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/admin/banners/upbanner?sid=" + sid);
                return;
            }
        } else {
            Banner existingBanner = dao.getBannerById(sid);
            pimage = existingBanner.getImage(); // Use existing image if no new image is uploaded
        }

        try {
            dao.updateBanner(pbannerName, pimage, pcontent, pisActive, sid);
            session.setAttribute("updateBannerMessage", "Banner updated successfully!");
        } catch (Exception e) {
            session.setAttribute("updateBannerMessageError", "Failed to update banner: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/admin/banners");
    }

    private void addBanner(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String bannerName = request.getParameter("bannerName");
        String content = request.getParameter("content");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

        BannerDAO bannerDAO = new BannerDAO();

        // Check if banner name already exists
        if (bannerDAO.checkBannerNameExists(bannerName)) {
            session.setAttribute("addBannerSameNameMessageError", "Banner with name '" + bannerName + "' already exists.");
            response.sendRedirect(request.getContextPath() + "/admin/banners/crbanner");
            return;
        }

        // Handle file upload for banner image
        Part part = request.getPart("image");
        if (part == null || part.getSize() == 0) {
            session.setAttribute("addBannerMessageError", "Image file is required.");
            response.sendRedirect(request.getContextPath() + "/admin/banners/crbanner");
            return;
        }

        String fileName = UUID.randomUUID() + "_" + Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String realPath = request.getServletContext().getRealPath("/assets/images/imagebanner");

        if (realPath != null) {
            File uploadDir = new File(realPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create the directory if it does not exist
            }
        } else {
            session.setAttribute("addBannerMessageError", "Server error: Upload directory not found.");
            response.sendRedirect(request.getContextPath() + "/admin/banners/crbanner");
            return;
        }

        try {
            part.write(realPath + "/" + fileName);
            String imagePath = "/assets/images/imagebanner/" + fileName;
            bannerDAO.addBanner(bannerName, imagePath, content, isActive);
            session.setAttribute("addBannerMessage", "Banner created successfully!");
        } catch (IOException e) {
            session.setAttribute("addBannerMessageError", "Failed to upload image: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/banners/crbanner");
            return;
        } catch (Exception e) {
            session.setAttribute("addBannerMessageError", "Failed to create banner: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/banners/crbanner");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/admin/banners");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (!contentDisposition.contains("filename=")) {
            return null;
        }
        int beginIndex = contentDisposition.indexOf("filename=") + 10;
        int endIndex = contentDisposition.length() - 1;

        return contentDisposition.substring(beginIndex, endIndex);
    }

}
