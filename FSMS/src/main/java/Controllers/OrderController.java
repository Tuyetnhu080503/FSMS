package Controllers;

import Models.Account;
import DAOs.OrderDAO;
import DTO.ViewOrder;
import DTO.ViewOrderIDs;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
        String path = request.getRequestURI();

        if (acc != null) {
            if (path.endsWith("/orders")) {
                try {
                    Account cuurentAcc = (Account) session.getAttribute("acc");
                    OrderDAO orDAO = null;
                    try {
                        orDAO = new OrderDAO();
                    } catch (SQLException ex) {
                        Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    ResultSet rsoderIDs = orDAO.getAllsOrderID(cuurentAcc.getAccountId());
                    
                    ResultSet rsoderIDInformation = orDAO.getAllOrdersInformation(cuurentAcc.getAccountId());
                    
                    ArrayList<ViewOrderIDs> orderIDList = new ArrayList<>();
                    
                    ArrayList<ViewOrder> orderList = new ArrayList<>();
                    
                    while(rsoderIDs.next()){
                        orderIDList.add(new ViewOrderIDs(rsoderIDs.getInt("OrderID"), rsoderIDs.getString("Status"), rsoderIDs.getInt("TotalPrice")));
                    }
                    
                    while(rsoderIDInformation.next()){
                        orderList.add(new ViewOrder(rsoderIDInformation.getInt("OrderID"), rsoderIDInformation.getString("Image"), rsoderIDInformation.getString("Name"),rsoderIDInformation.getInt("Quantity"), rsoderIDInformation.getInt("UnitPrice"),rsoderIDInformation.getString("Size"), rsoderIDInformation.getString("Color")));
                    }
                    
                    
                    
                    request.setAttribute("orderIDList", orderIDList);
                    request.setAttribute("orderList", orderList);
                    
                    session.setAttribute("tabId", 16);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        } else {
            logger.log(Level.SEVERE, "Account is null in session.");
            request.setAttribute("error", "Account not found in session.");
        }
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
