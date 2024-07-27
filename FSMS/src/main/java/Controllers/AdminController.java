/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.BannerDAO;
import DAOs.EmployeeDAO;
import DAOs.ProductDAO;
import DAOs.OrderDAO;
import DAOs.VoucherDAO;
import Hash.MD5;
import Models.Account;
import Models.Banner;
import Models.EmployeeProfile;
import Models.Order;
import Models.OrderStatus;
import Models.Product;
import Models.ProductType;
import Models.Voucher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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
                    List<OrderStatus> orderStatus = oDao.getListOrderStatusByOrderId(orderId);
                    AccountDAO accDAO = new AccountDAO();
                    Account account = accDAO.getAccountByAccountID(acc.getAccountId());
                    request.setAttribute("account", account);
                    request.setAttribute("order", order);
                    request.setAttribute("orderStatus", orderStatus);
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
            } else if (path.endsWith("/banners")) {
                try {
                    BannerDAO bannerDAO = new BannerDAO();
                    List<Banner> banners = bannerDAO.getAllBanners();
                    request.setAttribute("Listb", banners);
                    session.setAttribute("tabId", 16);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (Exception e) {
                    // Handle exception appropriately
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Error fetching banners", e);
                    // Redirect or display error message
                    response.sendRedirect("/admin.jsp?error=fetching_banners");
                }

            } else if (path.endsWith("/crbanner")) {
                session.setAttribute("tabId", 17);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/banners/upbanner")) {
                String sid = request.getParameter("sid");
                BannerDAO dao = new BannerDAO();
                Banner p = dao.getBannerById(sid);
                request.setAttribute("detail", p);
                session.setAttribute("tabId", 18);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/banners/delete/")) {
                try {
                    String[] idArray = path.split("/");
                    String bannerIdStr = idArray[idArray.length - 1];

                    if (bannerIdStr != null && !bannerIdStr.isEmpty()) {
                        int bannerId = Integer.parseInt(bannerIdStr);

                        BannerDAO bannerDAO = new BannerDAO();
                        bannerDAO.deleteBanner(bannerId);

                        // Set success message in session
                        session.setAttribute("deleteBannerMessage", "Banner deleted successfully.");
                    } else {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Banner ID is null or empty.");
                    }
                    response.sendRedirect("/admin/banners");
                } catch (NumberFormatException e) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Invalid banner ID format: " + e.getMessage());
                    session.setAttribute("deleteBannerError", "Failed to delete banner. Please try again.");
                    response.sendRedirect("/admin/banners");
                }
            } else if (path.endsWith("/hisOrder")) {
                try {
                    OrderDAO dao = new OrderDAO();
                    List<Order> list = dao.getAllOrders();
                    request.setAttribute("Listc", list);
                    session.setAttribute("tabId", 19);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (Exception e) {
                    // Handle exception appropriately
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Error fetching orders", e);
                    // Redirect or display error message
                    response.sendRedirect("/admin.jsp?error=fetching_orders");
                }

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
        } else if (request.getParameter("setMonth") != null) {
            String month = request.getParameter("month");
            System.out.println(month);
            mySession.setAttribute("month", month);
            response.sendRedirect("/admin");
        }
    }
}
