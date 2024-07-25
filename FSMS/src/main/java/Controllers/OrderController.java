package Controllers;

import DAOs.CartDAO;
import DAOs.EmployeeDAO;
import Models.Account;
import DAOs.OrderDAO;
import DAOs.ProductTypeDAO;
import DAOs.VoucherDAO;
import DTO.ViewOrder;
import DTO.ViewOrderIDs;
import Models.Order;
import Models.OrderItems;
import Models.Voucher;
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
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

                    while (rsoderIDs.next()) {
                        ResultSet rsVoucher = orDAO.getVoucherByOrderID(acc.getAccountId(), rsoderIDs.getInt("OrderID"));
                        if (rsVoucher != null && rsVoucher.isBeforeFirst()) {
                            rsVoucher.next();
                            int amount = rsVoucher.getInt("DiscountAmount");
                            int persent = rsVoucher.getInt("DiscountPercentage");
                            if (!rsVoucher.wasNull()) {
                                if (persent * rsoderIDs.getInt("TotalPrice") < amount) {
                                    orderIDList.add(new ViewOrderIDs(rsoderIDs.getInt("OrderID"), rsoderIDs.getString("Status"), rsoderIDs.getInt("TotalPrice") - persent * rsoderIDs.getInt("TotalPrice")));
                                } else {
                                    orderIDList.add(new ViewOrderIDs(rsoderIDs.getInt("OrderID"), rsoderIDs.getString("Status"), rsoderIDs.getInt("TotalPrice") - amount));
                                }
                            } else {
                                orderIDList.add(new ViewOrderIDs(rsoderIDs.getInt("OrderID"), rsoderIDs.getString("Status"), rsoderIDs.getInt("TotalPrice") - amount));
                            }
                        } else {
                            orderIDList.add(new ViewOrderIDs(rsoderIDs.getInt("OrderID"), rsoderIDs.getString("Status"), rsoderIDs.getInt("TotalPrice")));
                        }
                    }

                    while (rsoderIDInformation.next()) {
                        orderList.add(new ViewOrder(rsoderIDInformation.getInt("OrderID"), rsoderIDInformation.getString("Image"), rsoderIDInformation.getString("Name"), rsoderIDInformation.getInt("Quantity"), rsoderIDInformation.getInt("UnitPrice"), rsoderIDInformation.getString("Size"), rsoderIDInformation.getString("Color")));
                    }

                    request.setAttribute("orderIDList", orderIDList);
                    request.setAttribute("orderList", orderList);

                    session.setAttribute("tabId", 16);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (path.endsWith("/orders/detail")) {

                int id = Integer.parseInt(request.getParameter("id"));

                OrderDAO orDAO = null;
                try {
                    orDAO = new OrderDAO();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                }

                ResultSet rsoderIDInformation = orDAO.getOrderByID(acc.getAccountId(), id);
                
                String address = orDAO.getAddress(acc.getAccountId(), id);
                
                int voucher = 0;

                try {
                    ResultSet rsVoucher = orDAO.getVoucherByOrderID(acc.getAccountId(), id);
                    if (rsVoucher != null && rsVoucher.isBeforeFirst()) {
                        rsVoucher.next();
                        int amount = rsVoucher.getInt("DiscountAmount");
                        int persent = rsVoucher.getInt("DiscountPercentage");
                        if (!rsVoucher.wasNull()) {
                            if (persent * rsVoucher.getInt("TotalPrice") < amount) {
                                voucher = persent * rsVoucher.getInt("TotalPrice");
                            } else {
                                voucher = amount;
                            }
                        } else {
                            voucher = amount;
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                ResultSet order = orDAO.getOrderInfo(acc.getAccountId(), id);
                ResultSet orderStatus = orDAO.getAllStatus(acc.getAccountId(), id);
                

                request.setAttribute("rsoderIDInformation", rsoderIDInformation);
                request.setAttribute("voucher", voucher);
                request.setAttribute("address", address);
                
                request.setAttribute("order", order);
                request.setAttribute("orderStatus", orderStatus);
                
                session.setAttribute("tabId", 17);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            }else if(path.endsWith("/orders/create")){
                try {
                    CartDAO cartDAO = new CartDAO();
                    ResultSet cartItems = cartDAO.getAllProductsInCart(acc.getAccountId());
                    
                    VoucherDAO voDAO = new VoucherDAO();
                    ResultSet voucherRs = voDAO.getAllVouchersActive();
                    
                    request.setAttribute("cartItems", cartItems);
                    request.setAttribute("voucherRs", voucherRs);
                    
                    session.setAttribute("tabId", 18);
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
       
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String path = request.getRequestURI();
        
        if(request.getParameter("totalFinal")!=null){
            try {
                int totalFinal = Integer.parseInt(request.getParameter("totalFinal"));
                String address = request.getParameter("address");
                String paymentMethod = request.getParameter("paymentMethod");
                int voucherID = Integer.parseInt(request.getParameter("voucherID"));
                int voucherQuantity = Integer.parseInt(request.getParameter("voucherQuantity"));
                
                EmployeeDAO emDAO = new EmployeeDAO();
                
            
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String formattedNow = now.format(formatter);
                Timestamp currentTimestamp = Timestamp.valueOf(formattedNow);
                System.out.println(currentTimestamp);
                System.out.println(currentTimestamp);
                
                
                int cusID = emDAO.getCustomerIDByAccountID(acc.getAccountId());
                Order order = new Order(cusID,"Pending", totalFinal, currentTimestamp, voucherID, paymentMethod.equals("cod")?"A":"B", "", address );
                
                OrderDAO orDAO = new OrderDAO();
                
                orDAO.addOrderCOD(order);
                
                OrderDAO orrDAO = new OrderDAO();
                int orderID = orrDAO.getOrderIDByCustomerIDAndCreateAt(cusID);
                
                CartDAO cartDAO = new CartDAO();
                ResultSet cartItems = cartDAO.getAllProductsInCart(acc.getAccountId());
                
                
                ProductTypeDAO proTypeDao = new ProductTypeDAO();
                while(cartItems.next()){
                    orDAO.addOrderItems(new OrderItems(orderID, cartItems.getInt("ProductID"),cartItems.getInt("ProductTypeID"),cartItems.getInt("CartQuantity"),cartItems.getInt("Price"),cartItems.getInt("CartQuantity") * cartItems.getInt("Price")));
                    proTypeDao.updateQuantityProductType(cartItems.getInt("ProductTypeID"), cartItems.getInt("ProductTypeQuantity") - cartItems.getInt("CartQuantity"));
                }
                
                cartDAO.deleteCart(cusID);
                
                VoucherDAO voDAO = new VoucherDAO();
                if(voucherID!=0){
                    voDAO.updateQuantity(voucherQuantity-1, voucherID);
                }
                
                session.setAttribute("addOrder", "success");
                
                response.sendRedirect("/orders");
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
