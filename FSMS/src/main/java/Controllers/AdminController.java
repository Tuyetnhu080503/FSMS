/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.EmployeeDAO;
import DAOs.ProductDAO;
import DAOs.OrderDAO;
import DAOs.VoucherDAO;
import Hash.MD5;
import Models.Account;
import Models.EmployeeProfile;
import Models.Order;
import Models.Product;
import Models.ProductType;
import Models.Voucher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc != null && acc.getRoleId() == 1) { // is admin
            if (path.endsWith("/profile")) {
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/profile/edit")) {
                session.setAttribute("tabId", 3);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/profile/changepassword")) {
                session.setAttribute("tabId", 4);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/accounts")) {
                session.setAttribute("tabId", 5);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/accounts/create")) {
                session.setAttribute("tabId", 6);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/accounts/update")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                AccountDAO accDAO = new AccountDAO();
                Account account = accDAO.getAccountByAccountID(id);

                if (account.getRoleId() != 4) {//!= customer
                    EmployeeDAO emDAO = new EmployeeDAO();
                    EmployeeProfile empyPro = emDAO.getEmployeeProfileByAccountID(account.getAccountId());
                    request.setAttribute("employeePro", empyPro);
                }

                request.setAttribute("account", account);

                session.setAttribute("tabId", 7);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/accounts/block/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                AccountDAO accountDAO = new AccountDAO();
                accountDAO.banAccountByAccountID(id);
                response.sendRedirect("/admin/accounts/update/" + id);
            } else if (path.startsWith("/admin/accounts/unblock/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                AccountDAO accountDAO = new AccountDAO();
                accountDAO.unbanAccountByAccountID(id);
                response.sendRedirect("/admin/accounts/update/" + id);
            } else if (path.endsWith("/product")) {
                session.setAttribute("tabId", 8);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/product/create")) {

                session.setAttribute("tabId", 9);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/products/update")) {
                String[] idArray = path.split("/");
                int productId = Integer.parseInt(idArray[idArray.length - 1]);

                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductById(productId);

                request.setAttribute("product", product);
                ProductType productType = productDAO.getProductTypeByProductId(productId);
                request.setAttribute("productType", productType);
                session.setAttribute("tabId", 10);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);

            } else if (path.endsWith("/admin/order")) {
                session.setAttribute("tabId", 11);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/orders/update")) {
                try {
                    String[] idArray = path.split("/");
                    int orderId = Integer.parseInt(idArray[idArray.length - 1]);
                    OrderDAO oDao = new OrderDAO();
                    Order order = oDao.getOrderById(orderId);
                    request.setAttribute("order", order);
                    session.setAttribute("tabId", 12);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (path.endsWith("/admin/voucher")) {
                session.setAttribute("tabId", 13);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/vouchers/update")) {
                try {
                    String[] idArray = path.split("/");
                    int voucherId = Integer.parseInt(idArray[idArray.length - 1]);
                    VoucherDAO vdao = new VoucherDAO();
                    Voucher voucher = vdao.getVoucherByID(voucherId);
                    request.setAttribute("voucher", voucher);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }

                session.setAttribute("tabId", 14);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/voucher/create")) {
                session.setAttribute("tabId", 15);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/products/block/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                ProductDAO pDAO = new ProductDAO();
                pDAO.banProductById(id);
                response.sendRedirect("/admin/products/update/" + id);
            } else if (path.startsWith("/admin/products/unblock/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                ProductDAO pDAO = new ProductDAO();
                pDAO.unbanProductById(id);
                response.sendRedirect("/admin/products/update/" + id);
            } else if (path.startsWith("/admin/vouchers/block/")) {
                try {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);

                    VoucherDAO vDAO = new VoucherDAO();
                    vDAO.banVoucherById(id);
                    response.sendRedirect("/admin/vouchers/update/" + id);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (path.startsWith("/admin/vouchers/unblock/")) {
                try {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    
                    VoucherDAO vDAO = new VoucherDAO();
                    vDAO.unbanVoucherById(id);
                    response.sendRedirect("/admin/vouchers/update/" + id);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else { // route = "/admin"
                session.setAttribute("tabId", 1);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();

        if (request.getParameter("changePassword") != null) {
            String password = request.getParameter("oldpassword");
            String newPassword = request.getParameter("newpassword");

            String pass = MD5.getMd5(password);

            AccountDAO accDAO = new AccountDAO();
            Account curAcc = (Account) mySession.getAttribute("acc");
            String email = curAcc.getEmail();

            boolean isRightPassword = accDAO.checkRightPasswordByEmail(email, pass);

            if (isRightPassword) {
                String newpass = MD5.getMd5(newPassword);
                accDAO.changePasswordByEmail(email, newpass);
                mySession.setAttribute("changePassword", "yes");
                response.sendRedirect("/admin/profile");
            } else {
                request.setAttribute("wrongPass", "The old password is incorrect");
                mySession.setAttribute("tabId", 4);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
        }
    }
}
