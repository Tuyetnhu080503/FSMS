/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;


import DAOs.AccountDAO;
import Models.Account;
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

            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = acc.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("editStatus", "fail");
                    response.sendRedirect(role + "/profile/edit");
                    return;
                }
            }

            Account accProfile = new Account(acc.getAccountId(), acc.getUsername(), acc.getPassword(),acc.getEmail(), firstName, lastName, birthdate, avatar, gender, phone, address, acc.isIsActive(), acc.getRoleId());

            AccountDAO accDAO = new AccountDAO();
            Account returnAccount = accDAO.updateCustomerProfile(accProfile, acc.getAccountId());
            
            if (returnAccount == null) {
                session.setAttribute("editStatus", "fail");
                response.sendRedirect(role + "/profile/edit");
            } else {
                session.setAttribute("editStatus", "success");
                session.setAttribute("acc", accProfile);
                response.sendRedirect(role + "/profile");
            }
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
