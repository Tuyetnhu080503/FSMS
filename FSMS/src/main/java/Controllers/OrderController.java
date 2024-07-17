package Controllers;

import Models.Account;
import DAOs.OrderDAO;
import Models.Order;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * OrderController handles order-related requests.
 */
public class OrderController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(OrderController.class.getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Common processing logic can be added here if needed.
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isLoggedIn(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("tabId", 2);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc != null) {
            logger.log(Level.INFO, "Account ID: {0}", acc.getAccountId());

            // Retrieve orders for the logged-in customer
            OrderDAO orderDAO = new OrderDAO();
            int customerId = orderDAO.getCustomerIdByAccountId(acc.getAccountId());
            logger.log(Level.INFO, "Customer ID: {0}", customerId);

            if (customerId != -1) {
                List<Order> customerOrderList = orderDAO.getOrdersByCustomerId(customerId);
                // Set orders and customerId as request attributes
                request.setAttribute("CustomerOrderList", customerOrderList);
                request.setAttribute("customerId", customerId);
            } else {
                request.setAttribute("error", "Customer ID not found for the given Account ID.");
            }
        } else {
            logger.log(Level.SEVERE, "Account is null in session.");
            request.setAttribute("error", "Account not found in session.");
        }

        session.setAttribute("tabId", 10);
        request.getRequestDispatcher("/customer.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "OrderController handles order-related requests.";
    }

    /**
     * Checks if the user is logged in.
     *
     * @param request servlet request
     * @return true if logged in, false otherwise
     */
    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        return acc != null;
    }
}
