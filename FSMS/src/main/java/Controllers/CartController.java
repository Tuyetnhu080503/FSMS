package Controllers;

import DAOs.CartDAO;
import Models.Account;
import Models.Cart;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/CartController")
public class CartController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(CartController.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        if (!isLoggedIn(request)) {
            session.setAttribute("tabId", 2);
            response.sendRedirect("/customer.jsp");
            return;
        }
        
        Account acc = (Account) session.getAttribute("acc");

        if (acc != null) {
            try {
                CartDAO dao = new CartDAO();
                int customerId = dao.getCustomerIdByAccountId(acc.getAccountId());

                if (customerId != -1) {
                    List<Cart> cartList = dao.getProductAndQuantityByCustomerID(customerId);
                    request.setAttribute("cartItems", cartList);
                    session.setAttribute("tabId", 15); // Set tabId to 15 to show cart
                } else {
                    request.setAttribute("error", "Customer ID not found for the given Account ID.");
                    session.setAttribute("tabId", 2); // Set tabId to 2 in case of error
                }
            } catch (Exception e) {
                request.setAttribute("error", "Error retrieving cart details.");
                logger.log(Level.SEVERE, "Error retrieving cart details", e);
                session.setAttribute("tabId", 2); // Set tabId to 2 in case of error
            }
        } else {
            session.setAttribute("tabId", 2); // Set tabId to 2 if account is not found
            response.sendRedirect("/customer.jsp");
            return;
        }
        
        request.getRequestDispatcher("/customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        if (acc == null) {
            session.setAttribute("tabId", 2);
            response.sendRedirect("/customer.jsp");
            return;
        }

        try {
            CartDAO dao = new CartDAO();
            int customerId = dao.getCustomerIdByAccountId(acc.getAccountId());
            
            if (customerId != -1) {
                String action = request.getParameter("action");
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 1; // Default quantity to 1 if not present

                switch (action) {
                    case "increment":
                        dao.updateCartItem(customerId, productId, quantity + 1);
                        break;
                    case "decrement":
                        if (quantity > 1) {
                            dao.updateCartItem(customerId, productId, quantity - 1);
                        }
                        break;
                    case "delete":
                        dao.deleteCartItem(customerId, productId);
                        break;
                    default:
                        request.setAttribute("error", "Invalid action.");
                        session.setAttribute("tabId", 15);
                        request.getRequestDispatcher("/customer.jsp").forward(request, response);
                        return;
                }
                
                // Reload cart items and set tabId to 15
                List<Cart> cartList = dao.getProductAndQuantityByCustomerID(customerId);
                request.setAttribute("cartItems", cartList);
                session.setAttribute("tabId", 15);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Customer ID not found for the given Account ID.");
                session.setAttribute("tabId", 15);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error processing cart update.");
            logger.log(Level.SEVERE, "Error processing cart update", e);
            session.setAttribute("tabId", 15);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "CartController handles cart operations";
    }

    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        return acc != null;
    }
}
