package Controllers;

import DAOs.AccountDAO;
import DAOs.BannerDAO;
import DAOs.CartDAO;
import Models.Account;
import Models.Cart;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null) {
            acc = checkLoginFromCookies(request, response);
        }

        if (acc != null) {
            switch (acc.getRoleId()) {
                case 1:
                    response.sendRedirect("/admin");
                    break;
                case 2:
                    response.sendRedirect("/staff");
                    break;
                case 3:
                    response.sendRedirect("/shipper");
                    break;
                case 4:
                    loadBannerAndCartDetails(request);
                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            loadBannerAndCartDetails(request);
            session.setAttribute("tabId", 1);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if necessary
    }
    
    private Account checkLoginFromCookies(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cList = request.getCookies();
        if (cList != null) {
            for (Cookie c : cList) {
                if (c.getName().equals("login")) {
                    String username = c.getValue();
                    AccountDAO aDAO = new AccountDAO();
                    Account acc = aDAO.getAccountByUsername(username);
                    if (acc != null) {
                        request.getSession().setAttribute("acc", acc);
                        return acc;
                    }
                }
            }
        }
        return null;
    }

    private void loadBannerAndCartDetails(HttpServletRequest request) {
        BannerDAO bannerDAO = new BannerDAO();
        List<String> activeBannerImages = bannerDAO.getActiveBannerImages();
        request.setAttribute("activeBannerImages", activeBannerImages);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc != null) {
            try {
//                CartDAO dao = new CartDAO();
//                int customerId = dao.getCustomerIdByAccountId(acc.getAccountId());
//
//                if (customerId != -1) {
////                    List<Cart> cartlist = dao.getProductAndQuantityByCustomerID(customerId);
////                    request.setAttribute("cartItems", cartlist);
//                } else {
//                    request.setAttribute("error", "Customer ID not found for the given Account ID.");
//                }
            } catch (Exception e) {
                request.setAttribute("error", "Error retrieving cart details.");
            }
        }
    }
}
