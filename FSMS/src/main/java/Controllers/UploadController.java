/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.EmployeeDAO;
import DAOs.ProductDAO;
import Hash.MD5;
import Models.Account;
import Models.EmployeeProfile;
import Models.Product;
import Models.ProductType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.Date;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxRequestSize = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10)
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
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            long price = Long.parseLong(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("category"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
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
                    response.sendRedirect("/admin/product/update");
                    return;
                }
            } else {
                // If no new image is uploaded, use the existing image name
                productImage = request.getParameter("productImage");
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
        } else if (request.getParameter("deleteProduct") != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            ProductDAO productDAO = new ProductDAO();
            int result = productDAO.deleteProduct(productId);
            if (result > 0) {
                session.setAttribute("deleteProduct", "success");
            } else {
                session.setAttribute("deleteProduct", "fail");
            }
            response.sendRedirect("/admin/product");
        }

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
