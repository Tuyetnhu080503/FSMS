package Controllers;

import DAOs.AccountDAO;
import DAOs.BannerDAO;
import DAOs.EmployeeDAO;
import Hash.MD5;
import Models.Account;
import Models.Banner;
import Models.EmployeeProfile;

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
import java.util.List;
import java.util.UUID;

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
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
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
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
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
            
            //check duplicate email
            AccountDAO accDAO = new AccountDAO();
            if(accDAO.checkDuplicateEmail(email, accountId)){
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
            Part part = request.getPart("avatar");
           
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = accDAO.getAvatarByAccountId(accountId);
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/images/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
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

        } else if ("updateBanner".equals(action)) {
            updateBanner(request, response);
        } else if ("addBanner".equals(action)) {
            addBanner(request, response);
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
