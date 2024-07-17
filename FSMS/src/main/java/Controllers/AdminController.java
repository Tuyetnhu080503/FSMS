package Controllers;

import DAOs.AccountDAO;
import DAOs.BannerDAO;
import DAOs.EmployeeDAO;
import DAOs.OrderDAO;
import Hash.MD5;
import Models.Account;
import Models.Banner;
import Models.EmployeeProfile;
import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
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

                if (account.getRoleId() != 4) { // != customer
                    EmployeeDAO emDAO = new EmployeeDAO();
                    EmployeeProfile empyPro = emDAO.getEmployeeProfileByAccountID(account.getAccountId());
                    request.setAttribute("employeePro", empyPro);
                }

                request.setAttribute("account", account);

                session.setAttribute("tabId", 7);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/banners")) {
                try {
                    BannerDAO bannerDAO = new BannerDAO();
                    List<Banner> banners = bannerDAO.getAllBanners();
                    request.setAttribute("Listb", banners);
                    session.setAttribute("tabId", 8);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (Exception e) {
                    // Handle exception appropriately
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Error fetching banners", e);
                    // Redirect or display error message
                    response.sendRedirect("/admin.jsp?error=fetching_banners");
                }

            } else if (path.endsWith("/crbanner")) {
                session.setAttribute("tabId", 9);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/banners/upbanner")) {
                String sid = request.getParameter("sid");
                BannerDAO dao = new BannerDAO();
                Banner p = dao.getBannerById(sid);

                request.setAttribute("detail", p);
                session.setAttribute("tabId", 10);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/hisOrder")) {
                try {
                    OrderDAO dao = new OrderDAO();
                    List<Order> list = dao.getAllOrders();
                    request.setAttribute("Listc", list);
                    session.setAttribute("tabId", 11);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (Exception e) {
                    // Handle exception appropriately
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Error fetching orders", e);
                    // Redirect or display error message
                    response.sendRedirect("/admin.jsp?error=fetching_orders");
                }
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
            } else if (path.endsWith("/revenue")) {
                try {
                    OrderDAO orderDAO = new OrderDAO();
                    List<Order> orders = orderDAO.getAllOrders(); // Retrieve all orders
                    List<Integer> orderIds = new ArrayList<>();
                    List<Long> totalPrice = new ArrayList<>();

                    // Calculate total revenue and gather data for chart
                    long totalRevenue = 0;
                    for (Order order : orders) {
                        orderIds.add(order.getOrderId());
                        totalPrice.add(order.getTotalPrice());
                        totalRevenue += order.getTotalPrice();
                    }

                    // Set data in request attributes
                    request.setAttribute("orderIds", orderIds);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("totalRevenue", totalRevenue);

                    session.setAttribute("tabId", 12);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } catch (Exception e) {
                    // Handle exception appropriately
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, "Error fetching orders for revenue", e);
                    // Redirect or display error message
                    response.sendRedirect("/admin.jsp?error=fetching_orders_for_revenue");
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
        String path = request.getRequestURI();

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
